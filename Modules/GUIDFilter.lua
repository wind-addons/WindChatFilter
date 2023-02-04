local W, F, L = unpack(select(2, ...))
local GF = W:NewModule("GUIDFilter", "AceHook-3.0", "AceEvent-3.0")

local p = 0

local function filter(...)
    local playerName = select(7, ...)
    local guid = select(14, ...)

    local ok, localizedClass, englishClass, localizedRace, englishRace, sex, name, realm =
        pcall(GetPlayerInfoByGUID, guid)

    -- print(playerName, localizedClass)

    return false
end

function GF:Handler(guid)
    local ok, localizedClass, englishClass, localizedRace, englishRace, sex, name, realm =
        pcall(GetPlayerInfoByGUID, guid)
    if not (ok and englishClass) then
        return
    end
end

function GF:ProfileUpdate()
    if not W.DebugMode then
        return
    end
    
    local nameCache = W.global.data.cache.name

    self.db = W.db.guidFilter

    ChatFrame_AddMessageEventFilter("CHAT_MSG_CHANNEL", filter)
end

GF.OnInitialize = GF.ProfileUpdate
