--- Main script entry point
---@description Redirects to the appropriate emulator-specific `main`

local runtime       = require("src.runtime")

local main_path
local rt_bindings_path

local check_bizhawk = require("src.emu.bizhawk.check")
local check_fbneo   = require("src.emu.fbneo.check")

if check_bizhawk() then
    rt_bindings_path = "src.emu.bizhawk.rt_bindings"
    main_path        = "src.emu.bizhawk.main"
elseif check_fbneo() then
    rt_bindings_path = "src.emu.fbneo.rt_bindings"
    main_path        = "src.emu.fbneo.main"
else
    rt_bindings_path = "src.emu.fbneo.rt_bindings"
    main_path        = "src.emu.fbneo.unsafe_main"
end

-- ! Bind first, before `require`ing `main`.
local rt = require(rt_bindings_path)
runtime.bind(rt)

local main = require(main_path)

return main