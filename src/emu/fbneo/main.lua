local console = require("src.common.console")

local JuggleMeter = require("src.view.juggle_meter")
local InputHistory = require("src.view.input_history")

local juggle_meter
local input_history

local function init()
    -- seed
    math.randomseed(os.time())

    juggle_meter = JuggleMeter(1)
    input_history = InputHistory()
end

local function onstart()
    juggle_meter:reset()
    input_history:reset()
end

local function ongui()
    juggle_meter:display()
    input_history:display()
end

local function beforeframe()
    juggle_meter:update()
    input_history:update({ })
end

local function onloadstate()
    juggle_meter:reset()
    input_history:reset()
end

local function main(info)
    -- Print Stuff to the console
    info.platform = "[S] Fightcade"
    console.splash(info)

    init()

    -- Register events here.
    emu.registerstart(onstart)
    emu.registerbefore(beforeframe)
    gui.register(ongui)
    savestate.registerload(onloadstate)
end

return main
