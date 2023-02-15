-- Generated by WindToolsScripts
-- https://github.com/fang2hou/WindToolsScripts
local addonName = ...
local L = LibStub("AceLocale-3.0"):NewLocale(addonName, "zhTW")
if not L then return end

L["%m-%d-%Y %H:%M:%S"] = "%Y年%m月%d日 %H時%M分%S秒"
L["%s has been removed."] = "%s 已被移除."
L["%s is an addon aimed to filter some chat messages in game."] = "%s 是一個用於過濾遊戲中一些聊天訊息的插件."
L["Add"] = "新增"
L["Add Channel"] = "新增頻道"
L["Add Keyword"] = "新增關鍵字"
L["Add Map"] = "新增地圖"
L["Add Player Name"] = "新增玩家名"
L["Add Player Realm"] = "新增玩家伺服器"
L["Add all main cities to this rule."] = "將所有主城加入此規則."
L["Addon Message"] = "插件訊息"
L["Advanced"] = "進階"
L["AiFaDian"] = "愛發電"
L["Are you sure to remove this rule?"] = "確定要移除此規則?"
L["Battleground"] = "戰場"
L["Believe me, it really works."] = "相信我, 它真的有效."
L["Black List"] = "黑名單"
L["Cache"] = "快取"
L["Cancel"] = "取消"
L["Channel"] = "頻道"
L["Channel Name"] = "頻道名"
L["Class"] = "職業"
L["Clear All Cache"] = "清除所有快取"
L["Clear all cache data, including GUID cache, name cache, and rule cache."] = "清除所有快取資料, 包括 GUID 快取, 名稱快取, 規則快取."
L["Click to toggle config window."] = "點擊開啟設定視窗."
L["Code"] = "程式碼"
L["Code Snippet"] = "程式碼片段"
L["Contributors (GitHub.com)"] = "程式碼貢獻者 (GitHub.com)"
L["Copy"] = "複製"
L["Copy Rule"] = "複製規則"
L["Create"] = "建立"
L["Create New Rule"] = "建立新規則"
L["Create a new rule for the black list."] = "建立新的黑名單規則."
L["Created on %s"] = "建立於 %s"
L["Current Map:"] = "當前地圖:"
L["Custom Channel Names"] = "自訂頻道名"
L["Custom Keywords"] = "自訂關鍵字"
L["Custom Maps"] = "自訂地圖"
L["Custom Player Names"] = "自訂玩家名"
L["Custom Player Realms"] = "自訂玩家伺服器"
L["Decline all group invites NOT from friends or guild members."] = "拒絕所有非好友或公會成員的組隊邀請."
L["Default rules cannot be changed."] = "預設規則無法被更改."
L["Delayed Message"] = "延遲訊息"
L["Description"] = "描述"
L["Developer"] = "開發者"
L["Did you really want to remove %s?"] = "確定要移除 %s?"
L["Disable GUID cache to reduce memory usage, but it will cause the performance drop when you are in a crowed server."] = "停用 GUID 快取以減少記憶體使用量, 但是在人數較多的伺服器上會導致效能下降."
L["Disabled"] = "停用"
L["Discord"] = true
L["Display Message After Rejecting"] = "拒絕後顯示訊息"
L["Display a message after rejecting a group invitation."] = "拒絕組隊邀請後顯示訊息."
L["Do Not Use GUID Cache"] = "不使用 GUID 快取"
L["Donate"] = "捐助"
L["Emote"] = "表情"
L["Enable this module."] = "啟用此模組."
L["Enable this option will make the filter to match all races in hostile factions."] = "啟用此選項將使過濾器匹配所有敵對陣營的種族."
L["Enable this option will make the filter to match all races in neutral factions."] = "啟用此選項將使過濾器匹配所有中立陣營的種族."
L["Enable this option will save resource usage, but some message may not be filtered when you change zone."] = "啟用此選項將減少資源使用量, 但是在切換區域時有可能會有訊息未被過濾."
L["Enabled"] = "啟用"
L["Enables / disables %s minimap icon"] = "開啟/關閉 %s 小地圖圖示"
L["Execute"] = "執行"
L["Failed to get current map id."] = "無法獲取當前地圖 ID."
L["Filter Pandaren DKs in main cities."] = "過濾主城內的熊貓人死亡騎士."
L["Filter Status"] = "過濾狀態"
L["Filter by the channel category or names."] = "過濾頻道類別或名稱."
L["Filter by the map where player is in."] = "過濾玩家所在的地圖."
L["Filter by the message sender's class."] = "過濾訊息發送者的職業."
L["Filter by the message sender's name."] = "過濾訊息發送者的名稱."
L["Filter by the message sender's race."] = "過濾訊息發送者的種族."
L["Filter by the message sender's realm."] = "過濾訊息發送者的伺服器."
L["Filter by the specific keywords in the message."] = "過濾訊息中的特定關鍵字."
L["Filter messages that delayed in open world."] = "過濾在開放世界中延遲的訊息."
L["Filter messages that from enemy faciton."] = "過濾來自敵對陣營的訊息."
L["Filter messages that send from addons."] = "過濾來自插件的訊息."
L["Filter the message by the character name."] = "過濾訊息中的角色名稱."
L["Filter the messages from you."] = "過濾來自你的訊息."
L["Filter the messages from your friends."] = "過濾來自你的好友的訊息."
L["Filter the messages from your guild members."] = "過濾來自你的公會成員的訊息."
L["Filter the messages in say / yell / emote channel with default keywords."] = "使用預設關鍵字過濾說 / 大喊 / 表情 頻道中的訊息."
L["Filter the messages in whisper / trade / general / new comer / lfg channel with default keywords."] = "使用預設關鍵字過濾密語 / 交易 / 綜合 / 新手 / 尋求組隊 頻道中的訊息."
L["General"] = "一般設定"
L["General Chat"] = "綜合頻道"
L["GitHub"] = true
L["Group Invite Guard"] = "組隊防護"
L["Guild"] = "公會"
L["Help"] = "幫助"
L["Here are some options for advanced users."] = "這裡有一些面向進階用戶的選項."
L["Here is a code snippet for you to test your filter."] = "這裡有一個程式碼片段供你測試你的過濾器."
L["Hostile Factions"] = "敵對陣營"
L["In other words, they are AND relationships."] = "換句話說, 它們是 AND 關係."
L["Include Friend"] = "包含好友"
L["Include Guild Member"] = "包含公會成員"
L["Include Myself"] = "包含自己"
L["Information"] = "訊息"
L["Invalid map ID."] = "無效的地圖 ID."
L["KOOK"] = true
L["Keyword"] = "關鍵字"
L["Ko-fi"] = "Ko-fi"
L["Log Level"] = "日誌等級"
L["Main City"] = "主城"
L["Map"] = "地圖"
L["Map ID"] = "地圖 ID"
L["Message"] = "訊息"
L["Minimap icon"] = "小地圖圖示"
L["NGA.cn"] = "NGA 玩家社區"
L["Neutral Factions"] = "中立陣營"
L["New Rule"] = "新規則"
L["New Rule Name"] = "新規則名稱"
L["Newcomer Chat"] = "新手頻道"
L["Normal Channels"] = "一般頻道"
L["Notice"] = "注意"
L["Only Friends or Guild Members"] = "只有好友或公會成員"
L["Only display log message that the level is higher than you choose."] = "只顯示高於所選等級的日誌訊息."
L["Party"] = "隊伍"
L["Placeholder"] = "占位符"
L["Player Info"] = "玩家資訊"
L["Player Name"] = "玩家名稱"
L["Player Realm"] = "玩家伺服器"
L["Preview: "] = "預覽: "
L["Print the status of all filters."] = "顯示所有過濾器的狀態."
L["Priority"] = "優先度"
L["Provided by %s"] = "由 %s 提供"
L["QQ Group"] = "QQ 群"
L["RMT Character"] = "RMT 角色"
L["RMT Message"] = "RMT 訊息"
L["RMT Name"] = "RMT 名稱"
L["Race"] = "種族"
L["Raid"] = "團隊"
L["Realm"] = "伺服器"
L["Rebuild Rules"] = "重建規則"
L["Regex is supported, however CJK support is not guaranteed because the Lua version embedded in WoW is 5.1."] = "支援正則表達式, 但是因為 WoW 內嵌的 Lua 版本為 5.1, 不保證中日韓文字支援的準確度."
L["Rejected group invitation from %s."] = "拒絕了來自 %s 的組隊邀請."
L["Remove"] = "刪除"
L["Remove Rule"] = "移除規則"
L["Rule Description"] = "規則描述"
L["Rule Name"] = "規則名稱"
L["Say"] = "說"
L["Set to 1 if you do not understand the meaning of log level."] = "如果你不理解日誌等級的意思, 設定為 1 就好."
L["Shadowmoon"] = "暗影之月"
L["Smart Mode"] = "智能模式"
L["Some settings of default rules cannot be changed."] = "預設規則的某些設定無法更改."
L["Stop In Instance"] = "副本中停用"
L["Stop filtering in instance."] = "在副本中停用過濾."
L["Thank you for using %s!"] = "感謝你使用 %s!"
L["The rule which has higher priority will be applied first."] = "優先度高的規則將先被套用."
L["The rules below will be applied to the black list."] = "下面的規則將被視作自動攔截對象."
L["The sub-modules of each rule (e.g. the message module) are independent of each other."] = "每個規則的子模組 (例如訊息模組) 互相獨立."
L["This channel name has already been added."] = "這個頻道名稱已經被添加."
L["This is a custom rule."] = "這是一個自訂規則."
L["This is a default rule and cannot be deleted."] = "這是一個預設規則, 不能被刪除."
L["This keyword has already been added."] = "這個關鍵字已經被添加."
L["This map has already been added."] = "這個地圖已經被添加."
L["This module will help you to automatically decline group invitations."] = "這個模組將幫助你自動拒絕組隊邀請."
L["This player name has already been added."] = "這個玩家名稱已經被添加."
L["This player realm has already been added."] = "這個玩家伺服器已經被添加."
L["Trade"] = "交易"
L["Unknown Message"] = "未知訊息"
L["Version"] = "版本"
L["When %s starts filtering, it will pass the contextual information to all enabled sub-modules, and the rule will only be matched if the data passes all sub-modules."] = "當 %s 開始過濾時, 它會將上下文資訊傳遞給所有啟用的子模組, 只有當通過所有子模組的檢查時, 規則才會被判定套用."
L["Whisper"] = "密語"
L["Wind Chat Filter"] = "|cff5385edW|r|cff5093eai|r|cff4ea1e8n|r|cff4bb0e5d|r |cff46c5e0聊|r|cff43d0de天|r|cff41d7dd過|r|cff41d7dd濾|r|cff41d7dd器|r"
L["WoW Build"] = "魔獸世界版本號"
L["Yell"] = "大喊"
L["You can send your suggestions or bugs via %s, %s, %s, %s and the thread in %s."] = "你可以透過 %s, %s, %s, %s 和在 %s 的帖子來回報錯誤和建議."
L["You must recomplie the rules to apply the changes."] = "你必須重新編譯規則以套用更改."
