
local console = require("src.common.console")

local Addr      = require("src.emu.bizhawk.addr")
local bizConst  = require("src.emu.bizhawk.const")

local JuggleMeter = require("src.view.juggle_meter")

local juggle_meter

local EX_P_KEY = "Y"
local EX_K_KEY = "H"

local settings = 
{
    infinite_time = true, 
    display_juggle_meter = true, 
    juggle_meter_player = 1
}

local function init()
    memory.usememorydomain(bizConst.PRIMARY_MEMORY_DOMAIN_NAME)
    juggle_meter = JuggleMeter( settings.juggle_meter_player )
    juggle_meter:reset()
end

local function loop()
    local keys = input.get() -- TODO? maybe add to `runtime` for better Input/Joypad API

    -- infinite timer
    if settings.infinite_time then
        memory.writebyte(Addr.timer, 100)
    end

    juggle_meter:update()
    
    if settings.display_juggle_meter then
        juggle_meter:display()
    end

    -- reset life bars, just a temporary fix
    if keys["Shift+Up"] then
        memory.writebyte(Addr.players[1].life, 160)
        memory.writebyte(Addr.players[2].life, 160)
    end

    -- BizHawk doesn't have P+P+P or K+K+K like Fightcade, and I got used to them, so.
    if keys[ EX_P_KEY ]
    then
        local buttons = joypad.get()
        buttons["P1 Jab Punch"] = true
        buttons["P1 Strong Punch"] = true
        buttons["P1 Fierce Punch"] = true
        joypad.set(buttons)
    end

    if keys[ EX_K_KEY ]
    then
        local buttons = joypad.get()
        buttons["P1 Short Kick"] = true
        buttons["P1 Forward Kick"] = true
        buttons["P1 Roundhouse Kick"] = true
        joypad.set(buttons)
    end

    -- if paused
    -- then
    --     emu.yield()
    -- else
    emu.frameadvance()
    return true
end

local function onloadstate( name )
    juggle_meter:reset()
end

local function main(info)
    -- Print stuff to the console.
    info.platform = "[S] BizHawk"
    console.splash(info)

    -- Properly initialize everything.
    init()

    -- Register events here.
    event.onloadstate(onloadstate)

    -- Main program loop, where the magic happens.
    while loop() do end
end

return main