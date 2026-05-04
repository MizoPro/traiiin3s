--- Runtime bindings for BizHawk
---@type table
local bindings = {}

local Addr     = require("src.emu.bizhawk.addr")
local Gui      = require("src.emu.bizhawk.gui")
local Input    = require("src.emu.bizhawk.input")
local Style    = require("src.emu.bizhawk.style")

bindings.name  = "BizHawk"
bindings.Addr  = Addr
bindings.Gui   = Gui
bindings.Input = Input
bindings.Style = Style

return bindings