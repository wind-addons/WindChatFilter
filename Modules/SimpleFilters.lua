local W, F, L = unpack(select(2, ...))
local SF = W:NewModule("SimpleFilters", "AceHook-3.0", "AceEvent-3.0")

local mainCityMapIDs = {
    [84] = true, -- Stormwind City
    [85] = true, --	Orgrimmar - Orgrimmar
    [86] = true, --	Orgrimmar - Cleft of Shadow
    [87] = true, --	Ironforge
    [88] = true, --	Thunder Bluff
    [89] = true, --	Darnassus
    [90] = true, --	Undercity
    [2112] = true -- Valdrakken
}

local padarenDKChannels = {
    "^Trade",
    "^交易",
    "^組隊頻道$",
    "^尋求組隊$"
}

local nameKeyWords = {
    "团本",
    "團本",
    "團長",
    "团长",
    "秘境",
    "大秘",
    "大米",
    "大密",
    "秘境",
    "密境",
    "米境",
    "消费",
    "消費",
    "专车",
    "專車"
}

local msgKeywords = {
    "团本",
    "團本",
    "團長",
    "团长",
    "秘境",
    "大秘",
    "大米",
    "大密",
    "秘境",
    "密境",
    "米境",
    "消费",
    "消費",
    "专车",
    "專車",
    "化身巨龙牢窟",
    "清水",
    "躺尸",
    "可躺",
    "30人",
    "微信",
    "v信",
    "v:",
    "v：",
    "wei信",
    "wei:",
    "wei：",
    "微:",
    "微：",
    "散买",
    "散買",
    "散賣",
    "散卖",
    "面前",
    "效率",
    "开打",
    "開打",
    "躺全程",
    "包團",
    "包团",
    "大團",
    "大团",
    "20層",
    "20层",
    "血腥",
    "上號",
    "上号",
    "詢價",
    "询价"
}

local addonKeywords = {
    "{rt%d}",
    "^Clear",
    "^%d$",
    "^>>"
}

local blockedCache = {}

local function block(guid)
    if SF.db.useCahce then
        blockedCache[guid] = true
    end
    return true
end

local debugMode = false
local function debugPrint(...)
    if not debugMode then
        return
    end

    args = {...}
    C_Timer.After(
        3,
        function()
            print(unpack(args))
        end
    )
end

local function filterHandler(_, event, msg, sender, _, _, _, _, _, _, channelName, _, _, guid)
    if not guid then
        return false
    end

    if blockedCache[guid] then
        return true
    end

    if not W.global.guidCache[guid] then
        local ok, _, englishClass, _, englishRace, _, name = pcall(GetPlayerInfoByGUID, guid)
        if ok and englishClass and englishRace and name then
            W.global.guidCache[guid] = {
                englishClass = englishClass,
                englishRace = englishRace,
                name = name
            }
        end
    end

    local data = W.global.guidCache[guid]
    if not data then
        return false
    end

    if SF.db.noPadarenDK then
        if event == "CHAT_MSG_CHANNEL" then
            for _, v in ipairs(padarenDKChannels) do
                if strfind(channelName, v) then
                    if data.englishClass == "DEATHKNIGHT" and data.englishRace == "Pandaren" then
                        debugPrint(sender .. " be blocked by npdk")
                        return block(guid)
                    end
                end
            end
        end
    end

    local map = C_Map.GetBestMapForUnit("player")
    if map and mainCityMapIDs[map] then
        if SF.db.noPadarenDK then
            if data.englishClass == "DEATHKNIGHT" and data.englishRace == "Pandaren" then
                debugPrint(sender .. " be blocked by npdk")
                return block(guid)
            end
        end

        if event ~= "CHAT_MSG_CHANNEL" and SF.db.addonMessageFilter then
            for _, v in ipairs(addonKeywords) do
                if strfind(msg, v) then
                    debugPrint(msg .. " be blocked by am: ", v)
                    return true
                end
            end
        end

        if SF.db.factionFilter then
            local playerFaction = UnitFactionGroup("player")
            local playerRace = UnitRace("player")
        end
    end

    if SF.db.smartNameFilter then
        for _, v in ipairs(nameKeyWords) do
            if strfind(sender, v) then
                debugPrint(sender .. " be blocked by nf:", v)
                return block(guid)
            end
        end
    end

    if SF.db.smartMassegeFilter then
        for _, v in ipairs(msgKeywords) do
            if strfind(msg, v) then
                debugPrint(msg .. " be blocked by mf:", v)
                return block(guid)
            end
        end
    end

    return false
end

function SF:OnInitialize()
    self.db = W.db.simpleFilters

    if not self.db.enable then
        return
    end

    ChatFrame_AddMessageEventFilter("CHAT_MSG_CHANNEL", filterHandler)
    ChatFrame_AddMessageEventFilter("CHAT_MSG_SAY", filterHandler)
    ChatFrame_AddMessageEventFilter("CHAT_MSG_YELL", filterHandler)
    ChatFrame_AddMessageEventFilter("CHAT_MSG_EMOTE", filterHandler)

    self.initialized = true
end

function SF:ProfileUpdate()
    self.db = W.db.simpleFilters

    if not self.db.enable then
        if self.initialized then
            ChatFrame_RemoveMessageEventFilter("CHAT_MSG_CHANNEL", filterHandler)
            ChatFrame_RemoveMessageEventFilter("CHAT_MSG_SAY", filterHandler)
            ChatFrame_RemoveMessageEventFilter("CHAT_MSG_YELL", filterHandler)
            ChatFrame_RemoveMessageEventFilter("CHAT_MSG_EMOTE", filterHandler)
        end
    else
        if not self.initialized then
            self:OnInitialize()
        end
    end
end
