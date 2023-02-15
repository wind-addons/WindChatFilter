<div align="center">
<img width="512" src="Title.svg"/><br><br>
<img src="https://img.shields.io/badge/Version-1.1.9-green.svg?longCache=true&style=for-the-badge"/>

[简体中文 (zhCN)](README_zhCN.md) | [繁體中文 (zhTW)](README_zhTW.md)
</div>

# ✅ Status

![Publish State](https://img.shields.io/github/actions/workflow/status/fang2hou/WindChatFilter/publish_stable.yml?branch=1.1.9) [![Join Discord Server](https://img.shields.io/badge/Wind%20Plugins-Join-grey.svg?longCache=true&color=7289DA&logo=discord)](https://discord.gg/WHDER5SATV)

Download Sites: [Curse](https://www.curseforge.com/wow/addons/wind-chat-filter-wcf) | [Wago](https://addons.wago.io/addons/windchatfilter) | [GitHub Release](https://github.com/fang2hou/WindChatFilter/releases)

## 🌟 Introduction

**Wind Chat Filter** is an addon aimed to filter some chat messages in game.

## 💦 Features

1. **High Performance**

    Wind Chat Filter is a highly optimized addon. It can filter chat messages in real time, and it will not affect the performance of the game.
    Compared with other filter addons, Wind Chat Filter has a better logic to reach 8x faster performance.

1. **Always Up-to-Date Default Rules**

    In order to provide a better experience for the players, the default rules will be updated regularly.  
    It should be enabled for most players. And of course, you can disable it at any time in the settings.

    The default rules include:
    - RMT Character
      - A rule for filtering Pandaren Death Knight while you are in the main city.
    - RMT Name
      - A rule for filtering RMT character name.
    - RMT Message 1
      - A rule for filtering RMT message in say / yell / emote channel.
    - RMT Message 2
      - A rule for filtering RMT message in whisper / trade / general / lfg / newcomer chat channel.
    - Delayed Addon Message
      - A rule for filtering delayed addon message in say / yell channel. (e.g. Thundering WA message)
    - Unknown Message
      - A rule for filtering unknown message from enemy faction.

1. **Group Invite Guard**

    Recently, the RMT characters have been frequently inviting players to send their ads. You can use the Group Invite Guard module in Wind Chat Filter to automatically reject their invites.  
    If you are in a server where the RMT characters are extremely aggressive, you can also use the option to only allow friends or guild members to invite you.

1. **Highly Customizable Rule**

    Wind Chat Filter provides a highly customizable rule system. You can use various custom options to set up your private filters, and enable or disable them at any time in the settings.

1. **Developer Friendly**

    Sometimes, you may want to add some custom rules with your own codes.  
    Wind Chat Filter provides a developer-friendly API for you to add your own rules.

    You can use the following API to add your own rules:

    ```lua
    local api = _G.WindChatFilter.API

    -- filter should have the following structure:
    --   - priority: number
    --   - func: function to handle `chatData`

    -- chatData should have the following structure:
    --   - channel: string
    --   - message: string
    --   - sender: string
    --   - guid: string

    -- add a filter that if the message is "test", it will be filtered
    api.RegisterBlackList("testFilter", {
        priority = 1,
        func = function(data)
            if data.message == "test" then
                return true
            end
            return false
        end
    })

    -- first test
    api.TestWithAllFilters({
        channel = "Say",
        message = "test",
        sender = "testSender",
        guid = "testGUID"
    })

    -- second test
    api.TestWithAllFilters({
        channel = "Guild",
        message = "Nothing",
        sender = "testSender",
        guid = "testGUID"
    })

    -- remove the filter
    api.UnregisterBlackList("testFilter")

    -- rebuild the cache
    api.RebuildRules()
    ```

## ❤️ Credits

[All credits](CREDITS.md)
