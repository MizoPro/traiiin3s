local console = require("src.common.console")
local ADDR = require("src.emu.bizhawk.addr")

local function init()
    local MEMORY_DOMAIN = "sh2 : ram : 0x2000000-0x207FFFF"
    memory.usememorydomain(MEMORY_DOMAIN)
end

local function loop()
    local keys = input.get()

    -- infinite timer
    memory.writebyte(ADDR.timer, 100)

    if keys["Shift+Up"] then
        -- reset life bars
        memory.writebyte(ADDR.players[1].life, 160)
        memory.writebyte(ADDR.players[2].life, 160)
    end

    if keys["Y"]
    then
        local buttons = joypad.get()
        buttons["P1 Jab Punch"] = true
        buttons["P1 Strong Punch"] = true
        buttons["P1 Fierce Punch"] = true
        joypad.set(buttons)
    end

    if keys["H"]
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

local function main(info)
    info.platform = "[S] BizHawk"
    console.splash(info)

    init()

    while true
    do
        if not loop()
        then
            break
        end
    end
end

return main
