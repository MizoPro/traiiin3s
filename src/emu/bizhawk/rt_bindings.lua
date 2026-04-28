--- Runtime bindings for BizHawk
---@type table
local bindings = {}

local Gui      = require("src.emu.bizhawk.gui")
local Addr     = require("src.emu.bizhawk.addr")
local Style    = require("src.emu.bizhawk.style")

bindings.name  = "BizHawk"
bindings.Gui   = Gui
bindings.Addr  = Addr
bindings.Style = Style

return bindings