local console     = require("src.common.console")

local Addr        = require("src.emu.bizhawk.addr")
local Gui        = require("src.emu.bizhawk.gui")
local bizConst    = require("src.emu.bizhawk.const")
local Input       = require("src.emu.bizhawk.input")

local JuggleMeter = require("src.view.juggle_meter")
local InputHistory = require("src.view.input_history")

local juggle_meter
local input_history
local input_p1--, input_p2

local settings    =
{
    paused = false, -- Doesn't work(pause) yet!
    infinite_time = true,
    display_juggle_meter = true,
    juggle_meter_player = 1
}

local function init()
    -- seed
    math.randomseed(os.time())

    memory.usememorydomain(bizConst.PRIMARY_MEMORY_DOMAIN_NAME)

    juggle_meter = JuggleMeter(settings.juggle_meter_player)
    juggle_meter:reset()

    input_history = InputHistory()
    input_history:reset()

    input_p1 = Input( 1 )
    input_p1:reset()
end

local function loop()
    
    -- Update UI constants
    --Gui.update()

    -- infinite timer
    if settings.infinite_time then
        memory.writebyte(Addr.timer, 100)
    end

    juggle_meter:update()
    

    if settings.display_juggle_meter then
        juggle_meter:display()
    end
    input_history:display()

    -- freeze game
    if settings.paused then
        memory.writebyte(Addr.freeze, 0xFF)
        emu.yield()
    else
        memory.writebyte(Addr.freeze, 0x00)
        emu.frameadvance()
    end

    return true
end

local function oninputpoll()
    
    input_p1:update()
    input_history:update({
        dynamic= true
    })

    -- if p1_input.keys.Start.down and p1_input.keys.Start.state_timer > 30 then
    --     settings.paused = not settings.paused
    --     console.log("Paused/Unpaused!")
    -- end
    
    local keys = input.get() -- TODO? maybe add to `runtime` for better Input/Joypad API
    -- reset life bars, just a temporary fix
    if keys["Shift+Up"] then
        memory.writebyte(Addr.players[1].life, 160)
        memory.writebyte(Addr.players[2].life, 160)
    end
end

local function onloadstate(name)
    juggle_meter:reset()
    input_history:reset()
    input_p1:reset()
end

local function main(info)
    -- Print stuff to the console.
    info.platform = "[S] BizHawk"
    console.splash(info)

    -- Properly initialize everything.
    init()

    -- Register events here.
    event.onloadstate(onloadstate)
    event.oninputpoll(oninputpoll)

    -- Main program loop, where the magic happens.
    while loop() do end
end

return main
