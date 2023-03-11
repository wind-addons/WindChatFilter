local W, F, L, P, G, O = unpack(select(2, ...))

O.groupInviteGuard = {
    order = 20,
    name = L["Group Invite Guard"],
    type = "group",
    args = {
        description = {
            order = 1,
            type = "group",
            inline = true,
            name = L["Description"],
            args = {
                description = {
                    order = 1,
                    type = "description",
                    fontSize = "medium",
                    name = L["This module will help you to automatically decline group invitations."],
                    width = "full"
                }
            }
        },
        general = {
            order = 2,
            type = "group",
            inline = true,
            name = L["General"],
            get = function(info)
                return W.db.groupInviteGuard[info[#info]]
            end,
            set = function(info, value)
                W.db.groupInviteGuard[info[#info]] = value
            end,
            args = {
                enabled = {
                    order = 1,
                    type = "toggle",
                    name = L["Enabled"],
                    desc = L["Enable this module."],
                    width = "full"
                },
                onlyFriendsOrGuildMembers = {
                    order = 2,
                    type = "toggle",
                    name = L["Only Friends or Guild Members"],
                    desc = L["Decline all group invites NOT from friends or guild members."],
                    width = "full",
                    set = function(_, value)
                        W.db.groupInviteGuard.onlyFriendsOrGuildMembers = value
                        if value then
                            W.db.groupInviteGuard.smartMode = false
                        end
                    end
                },
                smartMode = {
                    order = 3,
                    type = "toggle",
                    name = L["Smart Mode"],
                    desc = L["Believe me, it really works."],
                    width = "full",
                    set = function(_, value)
                        W.db.groupInviteGuard.smartMode = value
                        if value then
                            W.db.groupInviteGuard.onlyFriendsOrGuildMembers = false
                        end
                    end
                },
                displayMessageAfterRejecting = {
                    order = 4,
                    type = "toggle",
                    name = L["Display Message After Rejecting"],
                    desc = L["Display a message after rejecting a group invitation."],
                    width = "full"
                },
                chatFilterMode = {
                    order = 4,
                    type = "toggle",
                    name = L["Chat Filter Mode"],
                    desc = L["Use chat filter mode."],
                    width = "full",
                    set = function(_, value)
                        W.db.groupInviteGuard.chatFilterMode = value
                        if value then
                            W.db.groupInviteGuard.smartMode = false
                            W.db.groupInviteGuard.onlyFriendsOrGuildMembers = false
                        end
                    end
                }
            }
        }
    }
}
