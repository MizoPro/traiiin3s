--- Main script entry point
---@description Redirects to the appropriate emulator-specific `main`
local main          = nil

local runtime = require("src.runtime")

local check_bizhawk = require("src.emu.bizhawk.check")
local check_fbneo   = require("src.emu.fbneo.check")

if check_bizhawk() then
    runtime.bind(require("src.emu.bizhawk.rt_bindings"))
    main = require("src.emu.bizhawk.main")
elseif check_fbneo() then
    runtime.bind(require("src.emu.fbneo.rt_bindings"))
    main = require("src.emu.fbneo.main")
else
    runtime.bind(require("src.emu.fbneo.unsafe_rt_bindings"))
    main = require("src.emu.fbneo.unsafe_main")
end

return main
