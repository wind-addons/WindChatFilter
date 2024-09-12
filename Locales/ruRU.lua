-- Generated by WindToolsScripts
-- https://github.com/wind-addons/WindToolsScripts
local addonName = ...
local L = LibStub("AceLocale-3.0"):NewLocale(addonName, "ruRU")
if not L then return end

L["%m-%d-%Y %H:%M:%S"] = true
L["%s has been removed."] = true
L["%s is an addon aimed to filter some chat messages in game."] = true
L["Add"] = "Добавить"
L["Add Channel"] = true
L["Add Keyword"] = true
L["Add Map"] = true
L["Add Player Name"] = true
L["Add Player Realm"] = true
L["Add all main cities to this rule."] = true
L["Addon Announcement"] = true
L["Addon Message"] = true
L["Advanced"] = "Дополнительно"
L["AiFaDian"] = true
L["Allow Whispered Target"] = true
L["Allow group invites from players who you sent whispers recently."] = true
L["Apply"] = "Применить"
L["Are you sure to remove this rule?"] = true
L["Battleground"] = "Поле боя"
L["Black List"] = true
L["Cache"] = true
L["Cancel"] = true
L["Channel"] = "Канал"
L["Channel Name"] = "Название канала"
L["Chat Filter Mode"] = true
L["Class"] = true
L["Clear All Cache"] = true
L["Clear all cache data, including GUID cache, name cache, and rule cache."] = true
L["Click to toggle config window."] = "Нажмите для перехода к окну конфигурации"
L["Code"] = true
L["Code Snippet"] = true
L["Contributors (GitHub.com)"] = "Авторы (GitHub.com)"
L["Copy"] = true
L["Copy Rule"] = true
L["Craft Advertisement"] = true
L["Create"] = true
L["Create New Rule"] = true
L["Create a new rule for the black list."] = true
L["Created on %s"] = true
L["Current Map:"] = true
L["Custom Channel Names"] = true
L["Custom Keywords"] = true
L["Custom Maps"] = true
L["Custom Player Names"] = true
L["Custom Player Realms"] = true
L["DND Character"] = true
L["Decline all group invites NOT from friends or guild members."] = true
L["Default rules cannot be changed."] = true
L["Delayed Message"] = true
L["Description"] = "Описание"
L["Developer"] = true
L["Did you really want to remove %s?"] = true
L["Disable GUID cache to reduce memory usage, but it will cause the performance drop when you are in a crowed server."] = true
L["Disabled"] = "Disabled"
L["Discord"] = "Дискорд"
L["Display a message after rejecting a group invitation."] = true
L["Do Not Disturb"] = true
L["Do Not Use GUID Cache"] = true
L["Donate"] = "Пожертвовать"
L["Emote"] = "Эмоции"
L["Enable this mode to filter group invites with existing chat filters."] = true
L["Enable this module."] = true
L["Enable this option will make the filter to match all races in hostile factions."] = true
L["Enable this option will make the filter to match all races in neutral factions."] = true
L["Enable this option will save resource usage, but some message may not be filtered when you change zone."] = true
L["Enabled"] = "Включено"
L["Enables / disables %s minimap icon"] = "Включает / отключает %s значок миникарты"
L["Execute"] = true
L["Failed to get current map id."] = true
L["Filter DND characters."] = true
L["Filter Pandaren DKs in main cities."] = true
L["Filter Status"] = true
L["Filter by the channel category or names."] = true
L["Filter by the map where player is in."] = true
L["Filter by the message sender's class."] = true
L["Filter by the message sender's name."] = true
L["Filter by the message sender's race."] = true
L["Filter by the message sender's realm."] = true
L["Filter by the specific keywords in the message."] = true
L["Filter messages that delayed in open world."] = true
L["Filter messages that from enemy faciton."] = true
L["Filter messages that send from addons."] = true
L["Filter some announcement messages if you feel annoying."] = true
L["Filter the message by the character name."] = true
L["Filter the messages from you."] = true
L["Filter the messages from your friends."] = true
L["Filter the messages from your guild members."] = true
L["Filter the messages in say / yell / emote channel with default keywords."] = true
L["Filter the messages in whisper / trade / general / new comer / lfg channel with default keywords."] = true
L["General"] = "Общие"
L["General Chat"] = true
L["GitHub"] = true
L["Group Invite Guard"] = true
L["Guild"] = "Гильдия"
L["Help"] = "Помощь"
L["Here are some options for advanced users."] = true
L["Here is a code snippet for you to test your filter."] = true
L["Hostile Factions"] = true
L["In other words, they are AND relationships."] = true
L["Include Friend"] = true
L["Include Guild Member"] = true
L["Include Myself"] = true
L["Information"] = "Информация"
L["Instance"] = "Подземелье"
L["Invalid map ID."] = true
L["It should be worked in most cases, but not always."] = true
L["Keyword"] = true
L["Ko-fi"] = true
L["Log Level"] = "Уровень журнала"
L["Main City"] = true
L["Map"] = true
L["Map ID"] = true
L["Message"] = true
L["Minimap icon"] = "Значок миникарты"
L["Modes"] = true
L["Mute Already In Group SE"] = true
L["Mute the sound effect that alerts you when you are already in a group."] = true
L["NGA.cn"] = true
L["NetEase Message"] = true
L["Neutral Factions"] = true
L["New Rule"] = "Новое правило"
L["New Rule Name"] = true
L["Newcomer Chat"] = true
L["Normal Channels"] = true
L["Notice"] = "Внимание:"
L["Only display log message that the level is higher than you choose."] = "Отображать только сообщение журнала о том, что уровень выше, чем Вы выбрали."
L["Party"] = "Группа"
L["Placeholder"] = true
L["Player Info"] = true
L["Player Name"] = true
L["Player Realm"] = true
L["Preview: "] = true
L["Print the status of all filters."] = true
L["Priority"] = true
L["Provided by %s"] = true
L["QQ Group"] = "QQ группы"
L["RMT Character"] = true
L["RMT Message"] = true
L["RMT Name"] = true
L["Race"] = true
L["Raid"] = "Рейд"
L["Realm"] = "Игровой мир"
L["Regex is supported, however CJK support is not guaranteed because the Lua version embedded in WoW is 5.1."] = true
L["Reject Message"] = true
L["Rejected group invitation from %s."] = true
L["Remove"] = "Удалить"
L["Remove Rule"] = true
L["Rule Description"] = true
L["Rule Name"] = true
L["Say"] = "Сказать"
L["Set to 1 if you do not understand the meaning of log level."] = "Установите на 1, если Вы не понимаете значение уровня журнала."
L["Shadowmoon"] = "Призрачная Луна"
L["Smart Mode"] = true
L["Some settings of default rules cannot be changed."] = true
L["Stop In Instance"] = true
L["Stop filtering in instance."] = true
L["Strict Mode"] = true
L["System"] = true
L["Thank you for using %s!"] = "Спасибо за использование %s!"
L["The change will not take effect until you apply it!"] = true
L["The filtering will ignore channel limitation of rules."] = true
L["The rule which has higher priority will be applied first."] = true
L["The rules below will be applied to the black list."] = true
L["The sub-modules of each rule (e.g. the message module) are independent of each other."] = true
L["This channel name has already been added."] = true
L["This feature does not block invitations from premade groups."] = true
L["This is a custom rule."] = true
L["This is a default rule and cannot be deleted."] = true
L["This keyword has already been added."] = true
L["This map has already been added."] = true
L["This module will help you to automatically decline group invitations."] = true
L["This player name has already been added."] = true
L["This player realm has already been added."] = true
L["Trade"] = "Обмен"
L["Unknown Message"] = true
L["Version"] = "Версия"
L["When %s starts filtering, it will pass the contextual information to all enabled sub-modules, and the rule will only be matched if the data passes all sub-modules."] = true
L["Whisper"] = "Шепот"
L["Wind Chat Filter"] = "|cff5385edW|r|cff528eeci|r|cff5096ean|r|cff4e9fe8d|r |cff4ab1e4C|r|cff49b9e3h|r|cff47bfe1a|r|cff46c5e0t|r |cff42d2ddF|r|cff41d7ddi|r|cff41d7ddl|r|cff41d7ddt|r|cff41d7dde|r|cff41d7ddr|r"
L["WoW Build"] = "Сборка WoW"
L["Yell"] = "Крик"
L["You can send your suggestions or bugs via %s, %s, %s and the thread in %s."] = "Вы можете отправлять свои предложения или сообщения об ошибках через %s, %s, %s и ветку в %s."
L["You can whisper the player once to add him/her to the whitelist temporarily."] = true
