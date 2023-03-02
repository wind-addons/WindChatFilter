<div align="center">
<img width="512" src="Title.svg"/><br><br>
<img src="https://img.shields.io/badge/版本-1.3.0-green.svg?longCache=true&style=for-the-badge"/>

[English (enUS)](README.md) | [简体中文 (zhCN)](README_zhCN.md)
</div>

# ✅ 狀態

![發布狀態](https://img.shields.io/github/actions/workflow/status/fang2hou/WindChatFilter/publish_stable.yml?branch=1.3.0) [![加入 Discord 伺服器](https://img.shields.io/badge/Wind%20Plugins-加入-grey.svg?longCache=true&color=7289DA&logo=discord)](https://discord.gg/SPqB72z7TK)

下載點: [Curse](https://www.curseforge.com/wow/addons/wind-chat-filter-wcf) | [Wago](https://addons.wago.io/addons/windchatfilter) | [GitHub 發布](https://github.com/fang2hou/WindChatFilter/releases)

## 🌟 介紹

**Wind 聊天過濾器** 是一個用於屏蔽遊戲中部分聊天文字的插件.

## 💦 功能

1. **高性能**

    Wind 聊天過濾器是一個高度優化的插件. 它可以在不影響遊戲的性能的同時, 實時過濾聊天消息.  
    與其他過濾插件相比, Wind 聊天過濾器具有更好的邏輯使得性能提高了 8 倍之多.

1. **始終保持最新的預設規則**

    為了提供更好的玩家體驗, 預設規則將定期更新.  
    大多數玩家應該啟用這些規則. 當然, 您也可以在設定中隨時禁用它.  

    默認規則包括:
    - RMT 角色
      - 一個適用於主城中的熊貓人死亡騎士的過濾規則.
    - RMT 名字
      - 一個用於過濾 RMT 角色名的規則.
    - RMT 消息 1
      - 一個用於過濾 RMT 消息的規則. 作用於 說 / 大喊 / 表情頻道.
    - RMT 消息 2
      - 一個用於過濾 RMT 消息的規則. 作用於 密語 / 交易 / 綜合 / 尋求組隊 / 新手頻道.
    - 延遲插件消息
      - 一個用於過濾延遲插件消息的規則. (例如: 雷霆 WA 喊話)
    - 未知消息
      - 一個用於過濾來自敵對陣營的未知消息的規則.

1. **組隊防護**

    近期工作室頻繁進行組隊騷擾, 您可以使用 Wind 聊天過濾器中的組隊防護模組來智能屏蔽他們.  
    如果您身處工作室行為極其猖狂的伺服器, 您也可以使用只允許好友或者公會成員邀請的選項.

1. **高度可定制的規則**

    Wind 聊天過濾器提供了一個高度可定制的規則係統. 您可以使用各種自定義選項來設置私人過濾器, 並在任何時候在設置中啟用或禁用它們.

1. **開發者友好**

    有時, 您可能希望使用自己的代碼添加一些自定義規則.  
    Wind 聊天過濾器提供了一個對開發者友好的 API, 以便您添加自己的規則.

    您可以使用以下 API 來添加自己的規則:

    ```lua
    local api = _G.WindChatFilter.API

    -- 過濾器的結構應該是這樣的:
    --   - priority: 數字
    --   - func: 一個用於接收 chatData 並返回 true/false 的函式

    -- chatData 的構造應該是這樣的:
    --   - channel: 字串
    --   - message: 字串
    --   - sender: 字串
    --   - guid: 字串

    -- 新增一個過濾器, 如果消息是 "test", 則會被過濾
    api.RegisterBlackList("testFilter", {
        priority = 1,
        func = function(data)
            if data.message == "test" then
                return true
            end
            return false
        end
    })

    -- 測試 1
    api.TestWithAllFilters({
        channel = "Say",
        message = "test",
        sender = "testSender",
        guid = "testGUID"
    })

    -- 測試 2
    api.TestWithAllFilters({
        channel = "Guild",
        message = "Nothing",
        sender = "testSender",
        guid = "testGUID"
    })

    -- 移除過濾器
    api.UnregisterBlackList("testFilter")

    -- 重建規則
    api.RebuildRules()
    ```

## ❤️ 鳴謝

[完整鳴謝名单](CREDITS.md)
