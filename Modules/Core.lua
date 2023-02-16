local W, F, L = unpack(select(2, ...))
local CORE = W:NewModule("Core", "AceEvent-3.0")

local format = format
local ipairs = ipairs
local pairs = pairs
local sort = sort
local time = time
local tinsert = tinsert
local wipe = wipe

local ChatFrame_AddMessageEventFilter = ChatFrame_AddMessageEventFilter
local ChatFrame_RemoveMessageEventFilter = ChatFrame_RemoveMessageEventFilter
local IsGuildMember = IsGuildMember
local IsInInstance = IsInInstance

local C_BattleNet_GetAccountInfoByGUID = C_BattleNet.GetAccountInfoByGUID
local C_FriendList_IsFriend = C_FriendList.IsFriend
local C_Timer_After = C_Timer.After
local C_Timer_NewTicker = C_Timer.NewTicker

local blackList = {}
local priorityOfBlackList = {}

local whiteList = {}
local priorityOfWhiteList = {}

local ruleParsers = {}
local ruleParserOrder = {}

local eventToChannel = {
    ["CHAT_MSG_CHANNEL"] = "Channel",
    ["CHAT_MSG_SAY"] = "Say",
    ["CHAT_MSG_YELL"] = "Yell",
    ["CHAT_MSG_WHISPER"] = "Whisper",
    ["CHAT_MSG_WHISPER_INFORM"] = "Whisper",
    ["CHAT_MSG_RAID"] = "Raid",
    ["CHAT_MSG_RAID_LEADER"] = "Raid",
    ["CHAT_MSG_PARTY"] = "Party",
    ["CHAT_MSG_PARTY_LEADER"] = "Party",
    ["CHAT_MSG_GUILD"] = "Guild",
    ["CHAT_MSG_BATTLEGROUND"] = "Battleground",
    ["CHAT_MSG_EMOTE"] = "Emote"
}

local handleCache = {}
local friendCache = {}

local function result(blocked, guid, channel)
    handleCache[guid .. "_" .. channel] = {
        blocked = blocked,
        time = time()
    }
    return blocked
end

local function isExcluded(guid)
    if not W.global.advanced.includeMyself then
        if guid == W.myGUID then
            return true
        end
    end

    if guid ~= W.myGUID and not W.global.advanced.includeGuildMember then
        if IsGuildMember(guid) then
            return true
        end
    end

    if guid ~= W.myGUID and not W.global.advanced.includeFriend then
        if not friendCache[guid] then
            friendCache[guid] = (C_BattleNet_GetAccountInfoByGUID(guid) or C_FriendList_IsFriend(guid)) and 1 or -1
        end

        if friendCache[guid] == 1 then
            return true
        end
    end

    return false
end

local function messageHandler(_, event, msg, sender, _, _, _, _, _, _, channelName, _, _, guid)
    if not (event and msg and sender and channelName and guid) then
        return false
    end

    if W.global.advanced.stopInInstance and IsInInstance() then
        return false
    end

    local channel = eventToChannel[event]
    if not channel then
        return false
    end

    if channel == "Channel" then
        channel = channelName
    end

    local cache = handleCache[guid .. "_" .. channel]
    if cache and cache.time + 1 > time() then
        return cache.blocked
    else
        handleCache[guid .. "_" .. channel] = nil
    end

    if isExcluded(guid) then
        return result(false, guid, channel)
    end

    local data = {
        channel = channel,
        message = msg,
        sender = sender,
        guid = guid
    }

    for _, name in ipairs(priorityOfWhiteList) do
        local filter = whiteList[name]
        if filter and filter.func and filter.func(data) then
            return result(false, guid, channel)
        end
    end

    for _, name in ipairs(priorityOfBlackList) do
        local filter = blackList[name]
        if filter and filter.func and filter.func(data) then
            CORE:Log("debug", format("filter:%s:block sender=[%s] msg=[%s]", name, sender, msg))
            return result(true, guid, channel)
        end
    end

    return result(false, guid, channel)
end

local function getPriorityForList(list)
    local cache = {}
    for name, filter in pairs(list) do
        tinsert(
            cache,
            {
                priority = filter.priority or -99999,
                name = name
            }
        )
    end

    sort(
        cache,
        function(a, b)
            return a.priority > b.priority
        end
    )

    local result = {}
    for i, v in ipairs(cache) do
        result[i] = v.name
    end

    return result
end

function CORE:RegisterBlackList(name, filter)
    blackList[name] = filter
    priorityOfBlackList = getPriorityForList(blackList)
    self:Log("debug", "Registered blackList: " .. name)
end

function CORE:UnregisterBlackList(name)
    blackList[name] = nil
    priorityOfBlackList = getPriorityForList(blackList)
    self:Log("debug", "Unregistered blackList: " .. name)
end

function CORE:RegisterWhiteList(name, filter)
    whiteList[name] = filter
    priorityOfWhiteList = getPriorityForList(whiteList)
    self:Log("info", "Registered whiteList: %s", name)
end

function CORE:UnregisterWhiteList(name)
    whiteList[name] = nil
    priorityOfWhiteList = getPriorityForList(whiteList)
    self:Log("info", "Unregistered whiteList: %s", name)
end

function CORE:RegisterRuleParser(name, parser)
    ruleParsers[name] = parser
    tinsert(ruleParserOrder, name)
    self:Log("info", "Registered rule parser: %s", name)
end

function CORE:RebuildRules()
    local rules = W.db.rules

    wipe(blackList)
    wipe(priorityOfBlackList)
    wipe(whiteList)
    wipe(priorityOfWhiteList)

    for _, rule in pairs(rules.blackList) do
        if rule.enabled then
            local functionList = {}

            for _, index in ipairs(ruleParserOrder) do
                local func = ruleParsers[index](rule)
                if func then
                    tinsert(functionList, func)
                end
            end

            if #functionList > 0 then
                self:RegisterBlackList(
                    rule.name,
                    {
                        priority = rule.priority,
                        func = function(data)
                            for _, func in ipairs(functionList) do
                                if not func(data) then
                                    return false
                                end
                            end
                            return true
                        end
                    }
                )
            end
        end
    end

    for _, rule in pairs(rules.whiteList) do
        if rule.enabled then
            local functionList = {}
            local filter = {
                priority = rule.priority,
                functionList = functionList,
                func = function(data)
                    for _, func in ipairs(functionList) do
                        if not func(data) then
                            return false
                        end
                    end
                    return true
                end
            }

            for _, parser in pairs(ruleParsers) do
                tinsert(functionList, parser(rule))
            end

            self:RegisterWhiteList(rule.name, filter)
        end
    end
end

function CORE:MapChanging()
    local now = time()
    self.mapChanging = true
    self.mapChangingTime = time()

    C_Timer_After(
        3,
        function()
            if self.mapChangingTime == now then
                self.mapChanging = false
            end
        end
    )
end

function CORE:OnInitialize()
    self.db = W.db.core

    if not self.db.enable then
        return
    end

    self:RebuildRules()
    self:RegisterEvent("CHAT_MSG_CHANNEL_NOTICE", "MapChanging")
    self:RegisterEvent("PLAYER_ENTERING_WORLD", "MapChanging")

    C_Timer_NewTicker(
        10,
        function()
            local now = time()
            for k, v in pairs(handleCache) do
                if v.time < now - 10 then
                    handleCache[k] = nil
                end
            end
        end
    )

    ChatFrame_AddMessageEventFilter("CHAT_MSG_CHANNEL", messageHandler)
    ChatFrame_AddMessageEventFilter("CHAT_MSG_SAY", messageHandler)
    ChatFrame_AddMessageEventFilter("CHAT_MSG_YELL", messageHandler)
    ChatFrame_AddMessageEventFilter("CHAT_MSG_WHISPER", messageHandler)
    ChatFrame_AddMessageEventFilter("CHAT_MSG_WHISPER_INFORM", messageHandler)
    ChatFrame_AddMessageEventFilter("CHAT_MSG_RAID", messageHandler)
    ChatFrame_AddMessageEventFilter("CHAT_MSG_RAID_LEADER", messageHandler)
    ChatFrame_AddMessageEventFilter("CHAT_MSG_PARTY", messageHandler)
    ChatFrame_AddMessageEventFilter("CHAT_MSG_PARTY_LEADER", messageHandler)
    ChatFrame_AddMessageEventFilter("CHAT_MSG_GUILD", messageHandler)
    ChatFrame_AddMessageEventFilter("CHAT_MSG_BATTLEGROUND", messageHandler)
    ChatFrame_AddMessageEventFilter("CHAT_MSG_EMOTE", messageHandler)

    self.initialized = true
end

function CORE:ProfileUpdate()
    self.db = W.db.core

    self:RebuildRules()

    if not self.db.enable then
        if self.initialized then
            ChatFrame_RemoveMessageEventFilter("CHAT_MSG_CHANNEL", messageHandler)
            ChatFrame_RemoveMessageEventFilter("CHAT_MSG_SAY", messageHandler)
            ChatFrame_RemoveMessageEventFilter("CHAT_MSG_YELL", messageHandler)
            ChatFrame_RemoveMessageEventFilter("CHAT_MSG_WHISPER", messageHandler)
            ChatFrame_RemoveMessageEventFilter("CHAT_MSG_WHISPER_INFORM", messageHandler)
            ChatFrame_RemoveMessageEventFilter("CHAT_MSG_RAID", messageHandler)
            ChatFrame_RemoveMessageEventFilter("CHAT_MSG_RAID_LEADER", messageHandler)
            ChatFrame_RemoveMessageEventFilter("CHAT_MSG_PARTY", messageHandler)
            ChatFrame_RemoveMessageEventFilter("CHAT_MSG_PARTY_LEADER", messageHandler)
            ChatFrame_RemoveMessageEventFilter("CHAT_MSG_GUILD", messageHandler)
            ChatFrame_RemoveMessageEventFilter("CHAT_MSG_BATTLEGROUND", messageHandler)
            ChatFrame_RemoveMessageEventFilter("CHAT_MSG_EMOTE", messageHandler)
        end
    else
        if not self.initialized then
            self:OnInitialize()
        end
    end
end

function CORE:GetRunningFilterStatus()
    F.Print("--- BlackList ---------")
    for _, name in ipairs(priorityOfBlackList) do
        local filter = blackList[name]
        F.Print(format("Priority: %s Name: %s", filter.priority, name))
    end
    F.Print("--- WhiteList ---------")
    for _, name in ipairs(priorityOfWhiteList) do
        local filter = whiteList[name]
        F.Print(format("Priority: %s Name: %s", filter.priority, name))
    end
    F.Print("-------------------------")
end

function CORE:TestWithAllFilters(data)
    F.Print("--------------------------")
    for _, name in ipairs(priorityOfWhiteList) do
        local filter = whiteList[name]
        if filter and filter.func and filter.func(data) then
            F.Print("WhiteList(" .. name .. "): OK")
        else
            F.Print("WhiteList(" .. name .. "): FAILED")
        end
    end

    for _, name in ipairs(priorityOfBlackList) do
        local filter = blackList[name]
        if filter and filter.func and filter.func(data) then
            F.Print("BlackList(" .. name .. "): OK")
        else
            F.Print("BlackList(" .. name .. "): FAILED")
        end
    end
    F.Print("-------------------------")
    return false
end
