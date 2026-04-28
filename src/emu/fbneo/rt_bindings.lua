--- Runtime bindings for BizHawk
---@type table
local bindings = {}

local Gui      = require("src.emu.fbneo.gui")
local Addr     = require("src.emu.fbneo.addr")
local Style    = require("src.emu.fbneo.style")

bindings.name  = "Fightcade"
bindings.Gui   = Gui
bindings.Addr  = Addr
bindings.Style = Style

return bindings