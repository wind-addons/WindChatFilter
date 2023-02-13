-- Generated by WindToolsScripts
-- https://github.com/fang2hou/WindToolsScripts
local addonName = ...
local L = LibStub("AceLocale-3.0"):NewLocale(addonName, "zhCN")
if not L then return end

L["%m-%d-%Y %H:%M:%S"] = "%Y年%m月%d日 %H时%M分%S秒"
L["%s has been removed."] = "%s 已被移除."
L["%s is an addon aimed to filter some chat messages in game."] = "%s 是一个用于过滤游戏中一些聊天信息的插件."
L["Add"] = "添加"
L["Add Channel"] = "添加频道"
L["Add Keyword"] = "添加关键词"
L["Add Map"] = "添加地图"
L["Add Player Name"] = "添加玩家名"
L["Add Player Realm"] = "添加玩家服务器"
L["Add all main cities to this rule."] = "添加所有主城到该规则."
L["Advanced"] = "高级"
L["AiFaDian"] = "爱发电"
L["Are you sure to remove this rule?"] = "你确定要移除该规则吗?"
L["Battleground"] = "战场"
L["Believe me, it really works."] = "相信我, 它真的有效."
L["Black List"] = "黑名单"
L["Cache"] = "缓存"
L["Cancel"] = "取消"
L["Channel"] = "频道"
L["Channel Name"] = "频道名"
L["Class"] = "职业"
L["Clear All Cache"] = "清除所有缓存"
L["Clear all cache data, including GUID cache, name cache, and rule cache."] = "清除所有缓存数据, 包括 GUID 缓存, 名称缓存, 规则缓存."
L["Click to toggle config window."] = "点击开启设置窗口."
L["Code"] = "代码"
L["Code Snippet"] = "代码片段"
L["Compile the rule to the real function for high performance filtering."] = "编译规则为实际函数以提高过滤性能."
L["Contributors (Github.com)"] = "代码贡献者 (Github.com)"
L["Copy"] = "复制"
L["Copy Rule"] = "复制规则"
L["Create"] = "创建"
L["Create New Rule"] = "创建新规则"
L["Create a new rule for the black list."] = "为黑名单创建新规则."
L["Created on %s"] = "创建于 %s"
L["Current Map:"] = "当前地图:"
L["Custom Channel Names"] = "自定义频道名"
L["Custom Keywords"] = "自定义关键词"
L["Custom Maps"] = "自定义地图"
L["Custom Player Names"] = "自定义玩家名"
L["Custom Player Realms"] = "自定义玩家服务器"
L["Decline all group invites NOT from friends or guild members."] = "拒绝所有非好友或公会成员的组队邀请."
L["Default rules cannot be changed."] = "默认规则无法被修改."
L["Delayed Message"] = "延迟消息"
L["Description"] = "描述"
L["Developer"] = "开发者"
L["Did you really want to remove %s?"] = "你真的想移除 %s 吗?"
L["Disable GUID cache to reduce memory usage, but it will cause the performance drop when you are in a crowed server."] = "禁用 GUID 缓存以减少内存占用, 但是在人数较多的服务器上会导致性能下降."
L["Disabled"] = "关闭"
L["Discord"] = "Discord"
L["Display Message After Rejecting"] = "拒绝后显示消息"
L["Display a message after rejecting a group invitation."] = "拒绝组队邀请后显示一条消息."
L["Do Not Use GUID Cache"] = "不使用 GUID 缓存"
L["Donate"] = "捐助"
L["Emote"] = "表情"
L["Enable this module."] = "启用该模块."
L["Enable this option will make the filter to match all races in hostile factions."] = "启用该选项将使过滤器匹配敌对阵营中的所有种族."
L["Enable this option will make the filter to match all races in neutral factions."] = "启用该选项将使过滤器匹配中立阵营中的所有种族."
L["Enable this option will save resource usage, but some message may not be filtered when you change zone."] = "启用该选项将节省资源占用, 但是当你切换区域时有可能会有一些消息不会被过滤."
L["Enabled"] = "开启"
L["Enables / disables %s minimap icon"] = "启用/停用 %s小地图图标"
L["Execute"] = "运行"
L["Failed to get current map id."] = "获取当前地图 ID 失败."
L["Filter Pandaren DKs in main cities."] = "过滤主城中的熊猫人死亡骑士."
L["Filter Status"] = "过滤状态"
L["Filter by the channel category or names."] = "过滤频道类别或名称."
L["Filter by the map where player is in."] = "过滤玩家所在的地图."
L["Filter by the message sender's class."] = "过滤消息发送者的职业."
L["Filter by the message sender's name."] = "过滤消息发送者的名称."
L["Filter by the message sender's race."] = "过滤消息发送者的种族."
L["Filter by the message sender's realm."] = "过滤消息发送者的服务器."
L["Filter by the specific keywords in the message."] = "过滤消息中的特定关键词."
L["Filter messages that delayed in open world."] = "过滤在开放世界中延迟的消息."
L["Filter messages that from enemy faciton."] = "过滤来自敌对阵营的消息."
L["Filter the message by the character name."] = "过滤消息中的角色名."
L["Filter the messages from you."] = "过滤来自你的消息."
L["Filter the messages from your friends."] = "过滤来自你的好友的消息."
L["Filter the messages from your guild members."] = "过滤来自你的公会成员的消息."
L["Filter the messages in say / yell / whisper / emote channel with default keywords."] = "使用默认默认关键词过滤 说 / 大喊 / 密语 / 表情 频道中的消息."
L["Filter the messages in trade / general channel with default keywords."] = "使用默认默认关键词过滤 交易 / 本地综合 频道中的消息."
L["General"] = "一般"
L["General Chat"] = "本地综合"
L["Github"] = true
L["Group Invite"] = "组队邀请"
L["Guild"] = "公会"
L["Help"] = "帮助"
L["Here are some options for advanced users."] = "这里有一些面向高级用户的选项."
L["Here is a code snippet for you to test your filter."] = "这里有一个代码片段供你测试你的过滤器."
L["Hostile Factions"] = "敌对阵营"
L["In other words, they are AND relationships."] = "换句话说, 它们是 AND 关系."
L["Include Friend"] = "包含好友"
L["Include Guild Member"] = "包含公会成员"
L["Include Myself"] = "包含自己"
L["Information"] = "信息"
L["Invalid map ID."] = "无效的地图 ID."
L["KOOK"] = "KOOK (开黑啦)"
L["Keyword"] = "关键词"
L["Ko-fi"] = "Ko-fi"
L["Log Level"] = "日志等级"
L["Main City"] = "主城"
L["Map"] = "地图"
L["Map ID"] = "地图 ID"
L["Message"] = "消息"
L["Minimap icon"] = "小地图图标"
L["NGA.cn"] = "NGA 玩家社区"
L["Neutral Factions"] = "中立阵营"
L["New Rule"] = "新规则"
L["New Rule Name"] = "新规则名称"
L["Newcomer Chat"] = "新手聊天"
L["Normal Channels"] = "普通频道"
L["Notice"] = "注意"
L["Only Friends or Guild Members"] = "只有好友或公会成员"
L["Only display log message that the level is higher than you choose."] = "只显示高于选择等级的日志信息."
L["Party"] = "小队"
L["Player Info"] = "玩家信息"
L["Player Name"] = "玩家名称"
L["Player Realm"] = "玩家服务器"
L["Preview: "] = "预览: "
L["Print the status of all filters."] = "打印所有过滤器的状态."
L["Priority"] = "优先级"
L["Provided by %s"] = "由 %s 提供"
L["QQ Group"] = "QQ 群"
L["RMT Character"] = "RMT 角色"
L["RMT Message"] = "RMT 消息"
L["RMT Name"] = "RMT 姓名"
L["Race"] = "种族"
L["Raid"] = "团队"
L["Realm"] = "服务器"
L["Rebuild Rules"] = "重建规则"
L["Regex is supported, however CJK support is not guaranteed because the Lua version embedded in WoW is 5.1."] = "支持正则表达式, 但是因为 WoW 内嵌的 Lua 版本为 5.1, 不保证中日韩文字支持的准确性."
L["Rejected group invitation from %s."] = "拒绝了 %s 的组队邀请."
L["Remove"] = "移除"
L["Remove Rule"] = "移除规则"
L["Rule Description"] = "规则描述"
L["Rule Name"] = "规则名称"
L["Say"] = "说"
L["Set to 2 if you do not understand the meaning of log level."] = "如果你不理解什么是日志级别, 设置为 2 就行."
L["Shadowmoon"] = "暗影之月"
L["Smart Mode"] = "智能模式"
L["Some settings of default rules cannot be changed."] = "默认规则的某些设置无法更改."
L["Stop In Instance"] = "副本中停止执行"
L["Stop filtering in instance."] = "在副本中停止过滤."
L["Thank you for using %s!"] = "感谢你使用 %s!"
L["The rule which has higher priority will be applied first."] = "优先级高的规则将会先被执行."
L["The rules below will be applied to the black list."] = "下面的规则将会被自动拦截."
L["The sub-modules of each rule (e.g. the message module) are independent of each other."] = "每个规则的子模块 (例如消息模块) 互相独立."
L["This channel name has already been added."] = "该频道名称已经被添加."
L["This is a custom rule."] = "这是一个自定义规则."
L["This is a default rule and cannot be deleted."] = "这是一个默认规则, 无法删除."
L["This keyword has already been added."] = "该关键词已经被添加."
L["This map has already been added."] = "该地图已经被添加."
L["This module will help you to automatically decline group invites."] = "该模块将帮助你自动拒绝组队邀请."
L["This player name has already been added."] = "该玩家名称已经被添加."
L["This player realm has already been added."] = "该玩家服务器已经被添加."
L["Trade"] = "交易"
L["Unknown Message"] = "未知消息"
L["Version"] = "版本"
L["When %s starts filtering, it will pass the contextual information to all enabled sub-modules, and the rule will only be matched if the data passes all sub-modules."] = "当 %s 开始过滤时, 它将会把上下文信息传递给所有启用的子模块, 规则只有在数据通过所有子模块检查时才会被判定为匹配."
L["Whisper"] = "密语"
L["Wind Chat Filter"] = "|cff5385edW|r|cff5093eai|r|cff4ea1e8n|r|cff4bb0e5d|r |cff46c5e0聊|r|cff43d0de天|r|cff41d7dd过|r|cff41d7dd滤|r|cff41d7dd器|r"
L["WoW Build"] = "魔兽世界版本号"
L["Yell"] = "大喊"
L["You can send your suggestions or bugs via %s, %s, %s, %s and the thread in %s."] = "你可以通过 %s, %s, %s, %s 和在 %s 的帖子来发送你的建议和错误."
