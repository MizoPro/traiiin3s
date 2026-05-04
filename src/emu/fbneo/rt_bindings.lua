--- Runtime bindings for BizHawk
---@type table
local bindings = {}

local Addr     = require("src.emu.fbneo.addr")
local Gui      = require("src.emu.fbneo.gui")
local Input    = require("src.emu.fbneo.input")
local Style    = require("src.emu.fbneo.style")

bindings.name  = "Fightcade"
bindings.Addr  = Addr
bindings.Gui   = Gui
bindings.Input = Input
bindings.Style = Style

return bindings