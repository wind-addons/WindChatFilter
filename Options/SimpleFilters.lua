local W, F, L, P, G, O = unpack(select(2, ...))
local QK = W:GetModule("GUIDFilter")

O.simpleFilters = {
    order = 4,
    name = L["Simple Filters"],
    type = "group",
    get = function(info)
        return W.db[info[#info - 1]][info[#info]]
    end,
    set = function(info, value)
        W.db[info[#info - 1]][info[#info]] = value
    end,
    args = {
        desc = {
            order = 1,
            type = "group",
            inline = true,
            name = L["Simple Filters"],
            args = {
                desc = {
                    order = 1,
                    type = "description",
                    name = L["Some default filters for most players."],
                    width = "full"
                }
            }
        },
        enable = {
            order = 2,
            type = "toggle",
            name = L["Enable"],
            width = "full"
        },
        useCahce = {
            order = 3,
            type = "toggle",
            name = L["Use Cache"],
            desc = L["Use cache to reduce fps drops."],
            width = "full"
        },
        noPadarenDK = {
            order = 3,
            type = "toggle",
            name = L["No Padaren DK"],
            desc = L["Filter the chat with Padaren DK."] ..
                "\n" .. L["This filter is only for trade/lfg channel or you are in main city."],
            width = "full"
        },
        smartNameFilter = {
            order = 4,
            type = "toggle",
            name = L["Smart Name Filter"],
            desc = L["Filter player name with default keywords."],
            width = "full"
        },
        smartMassegeFilter = {
            order = 5,
            type = "toggle",
            name = L["Smart Massege Filter"],
            desc = L["Filter the message with default keywords."],
            width = "full"
        },
        addonMessageFilter = {
            order = 6,
            type = "toggle",
            name = L["Addon Message Filter"],
            desc = L["Filter the addon messages when you in main city."],
            width = "full"
        },
        factionFilter = {
            order = 7,
            type = "toggle",
            disabled = true,
            name = L["Faction Filter"],
            desc = L["Filter the chat from other faction."],
            width = "full"
        }
    }
}
