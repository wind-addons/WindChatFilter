local addonName, addon = ...

local LibStub = _G.LibStub
local GetAddOnMetadata = GetAddOnMetadata
local GetLocale = GetLocale

local Engine = LibStub("AceAddon-3.0"):NewAddon(addonName)
local Locale = LibStub("AceLocale-3.0"):GetLocale(addonName, true)

addon[1] = Engine
addon[2] = {} -- Funtions
addon[3] = Locale

-- Utilities namespace
Engine.Utilities = {}

-- Variables
Engine.AddonNamePlain = "WindChatFilter"
Engine.AddonName = Locale["Wind Chat Filter"]
Engine.Version = GetAddOnMetadata(addonName, "Version")
Engine.AddonMsgPrefix = "WINDCF"
Engine.Locale = GetLocale()
Engine.isChineseClient = Engine.Locale == "zhCN" or Engine.Locale == "zhTW"

Engine.myGUID = UnitGUID("player")

_G[Engine.AddonNamePlain] = addon