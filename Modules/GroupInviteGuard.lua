local W, F, L = unpack(select(2, ...))
local GIG = W:NewModule("GroupInviteGuard", "AceEvent-3.0")

local format = format
local gsub = gsub
local pairs = pairs
local strfind = strfind

local IsGuildMember = IsGuildMember
local StaticPopup_Hide = StaticPopup_Hide

local C_BattleNet_GetAccountInfoByGUID = C_BattleNet.GetAccountInfoByGUID
local C_FriendList_IsFriend = C_FriendList.IsFriend

local smartModeNames = {
    ["靜思"] = true,
    ["静思"] = true,
    ["提升"] = true,
    ["代充"] = true,
    ["清水"] = true,
    ["团本"] = true,
    ["團本"] = true,
    ["团木"] = true,
    ["團木"] = true,
    ["團長"] = true,
    ["团长"] = true,
    ["秘境"] = true,
    ["大秘"] = true,
    ["大米"] = true,
    ["大密"] = true,
    ["秘境"] = true,
    ["密境"] = true,
    ["米境"] = true,
    ["消费"] = true,
    ["消費"] = true,
    ["专车"] = true,
    ["專車"] = true,
    ["找我"] = true
}

local suggestInvitePattern = string.gsub(_G.ERR_INFORM_SUGGEST_INVITE_SS, "%%%d$s", "(.+)")
local linkedPlayers = {}

function GIG:Reject(name)
    self:Log("debug", "Rejected group invitation from player: " .. name)

    if self.db.displayMessageAfterRejecting then
        F.Print(format(L["Rejected group invitation from %s."], name))
    end

    StaticPopup_Hide("PARTY_INVITE")
end

function GIG:RequestHandler(_, name, _, _, _, _, _, guid)
    if not self.db.enabled then
        return
    end

    if not guid or guid == "" or guid == W.myGUID then
        return
    end

    local isGuildMember = IsGuildMember(guid)
    local isFriend = C_FriendList_IsFriend(guid)
    local isBNFriend = C_BattleNet_GetAccountInfoByGUID(guid) ~= nil

    local playerInfo = F.FetchPlayerInfo(guid)

    if self.db.onlyFriendsOrGuildMembers then
        if not (isGuildMember or isFriend or isBNFriend) then
            self:Reject(name)
        end
    end

    if self.db.smartMode then
        if not (isGuildMember or isFriend or isBNFriend) then
            local playerInfo = F.FetchPlayerInfo(guid)

            if playerInfo then
                if playerInfo.race == "Pandaren" and playerInfo.class == "DEATHKNIGHT" then
                    self:Reject(name)
                else
                    for namePattern, _ in pairs(smartModeNames) do
                        if strfind(playerInfo.name, namePattern) then
                            self:Reject(namePattern)
                            break
                        end
                    end

                    if linkedPlayers[name] then
                        for linkedName, _ in pairs(linkedPlayers[name]) do
                            for namePattern, _ in pairs(smartModeNames) do
                                if strfind(linkedName, namePattern) then
                                    self:Reject(format("%s (%s)", name, linkedName))
                                    break
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

function GIG:LinkPlayers(_, message)
    local inviter, leader

    gsub(
        message,
        suggestInvitePattern,
        function(...)
            inviter, leader = ...
        end
    )

    if inviter and leader then
        if not linkedPlayers[inviter] then
            linkedPlayers[inviter] = {}
        end

        linkedPlayers[inviter][leader] = true

        if not linkedPlayers[leader] then
            linkedPlayers[leader] = {}
        end

        linkedPlayers[leader][inviter] = true
    end
end

function GIG:OnInitialize()
    self.db = W.db.groupInviteGuard

    if not self.db.enabled then
        return
    end

    self:RegisterEvent("PARTY_INVITE_REQUEST", "RequestHandler")
    self:RegisterEvent("CHAT_MSG_SYSTEM", "LinkPlayers")

    self.initialized = true
end

function GIG:ProfileUpdate()
    self.db = W.db.groupInviteGuard

    if self.db.enabled then
        if not self.initialized then
            self:OnInitialize()
        end
    end
end
