local W, F, L, P, G, O = unpack(select(2, ...))
local QK = W:GetModule("GUIDFilter")

O.guidFilter = {
    order = 4,
    name = L["GUID Filter"],
    type = "group",
    get = function(info)
        return W.db[info[#info - 1]][info[#info]]
    end,
    set = function(info, value)
        W.db[info[#info - 1]][info[#info]] = value
        QK:ProfileUpdate()
    end,
    args = {
        desc = {
            order = 1,
            type = "group",
            inline = true,
            name = L["GUID Filter"],
            args = {
                desc = {
                    order = 1,
                    type = "description",
                    name = L["GUID Filter Module is used to filter the chat with sender's GUID."],
                    width = "full"
                }
            }
        },
        enable = {
            order = 2,
            type = "toggle",
            name = L["Enable"],
            desc = L["Enable/Disable the GUID Filter Module."],
            width = "full"
        }
    }
}
