local W, F, L = unpack(select(2, ...))
local GI = W:NewModule("GroupInvite", "AceEvent-3.0")

local smartModeNames = {
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

local function decline(name)
    if W.db.groupInvite.displayMessageAfterRejecting then
        W.Print(L["Rejected group invitation from %s."], name)
    end
    self:Log("debug", "Decline invite from player: " .. name)
    StaticPopup_Hide("PARTY_INVITE")
end

function GI:RequestHandler(_, name, _, _, _, _, _, guid)
    if not self.db.enabled then
        return
    end

    if not guid or guid == "" or guid == W.myGUID then
        return
    end

    local isGuildMember = IsGuildMember(guid)
    local isFriend = C_FriendList.IsFriend(guid)
    local isBNFriend = C_BattleNet.GetAccountInfoByGUID(guid) ~= nil

    local playerInfo = F.FetchPlayerInfo(guid)

    if self.db.onlyFriendsOrGuildMembers then
        if not (isGuildMember or isFriend or isBNFriend) then
            decline(name)
        end
    end

    if self.db.smartMode then
        if not (isGuildMember or isFriend or isBNFriend) then
            local playerInfo = F.FetchPlayerInfo(guid)

            if playerInfo then
                if playerInfo.race == "Pandaren" and playerInfo.class == "DEATHKNIGHT" then
                    decline(name)
                else
                    local matched
                    for name, _ in pairs(smartModeNames) do
                        if strfind(playerInfo.name, name) then
                            matched = true
                            break
                        end
                    end
                    if matched then
                        decline(name)
                    end
                end
            end
        end
    end
end

function GI:OnInitialize()
    self.db = W.db.groupInvite

    if not self.db.enabled then
        return
    end

    self:RegisterEvent("PARTY_INVITE_REQUEST", "RequestHandler")

    self.initialized = true
end

function GI:ProfileUpdate()
    self.db = W.db.groupInvite

    if self.db.enabled then
        if not self.initialized then
            self:OnInitialize()
        end
    end
end
