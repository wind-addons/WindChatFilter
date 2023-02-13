local W, F, L, P, G, O = unpack(select(2, ...))

O.groupInvite = {
    order = 20,
    name = L["Group Invite"],
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
                    name = L["This module will help you to automatically decline group invites."],
                    width = "full"
                }
            }
        },
        general = {
            order = 2,
            type = "group",
            inline = true,
            name = L["General"],
            args = {
                enabled = {
                    order = 1,
                    type = "toggle",
                    name = L["Enabled"],
                    desc = L["Enable this module."],
                    width = "full",
                    get = function()
                        return W.db.groupInvite.enabled
                    end,
                    set = function(_, value)
                        W.db.groupInvite.enabled = value
                    end
                },
                onlyFriendsOrGuildMembers = {
                    order = 2,
                    type = "toggle",
                    name = L["Only Friends or Guild Members"],
                    desc = L["Decline all group invites NOT from friends or guild members."],
                    width = "full",
                    get = function()
                        return W.db.groupInvite.onlyFriendsOrGuildMembers
                    end,
                    set = function(_, value)
                        W.db.groupInvite.onlyFriendsOrGuildMembers = value
                        if value then
                            W.db.groupInvite.smartMode = false
                        end
                    end
                },
                smartMode = {
                    order = 3,
                    type = "toggle",
                    name = L["Smart Mode"],
                    desc = L["Believe me, it really works."],
                    width = "full",
                    get = function()
                        return W.db.groupInvite.smartMode
                    end,
                    set = function(_, value)
                        W.db.groupInvite.smartMode = value
                        if value then
                            W.db.groupInvite.onlyFriendsOrGuildMembers = false
                        end
                    end
                },
                displayMessageAfterRejecting = {
                    order = 4,
                    type = "toggle",
                    name = L["Display Message After Rejecting"],
                    desc = L["Display a message after rejecting a group invitation."],
                    width = "full",
                    get = function()
                        return W.db.groupInvite.displayMessageAfterRejecting
                    end,
                    set = function(_, value)
                        W.db.groupInvite.displayMessageAfterRejecting = value
                    end
                },
            }
        }
    }
}
