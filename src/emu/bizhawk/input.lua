
local Object = require("src.core.object")
local console = require("src.common.console")
local util = require("src.common.util")

--- Common API input layer
---@class Input
local Input = Object:extend()
-- Reset = false
-- Service 1 = false
-- Service Mode = false

local KEY_Px3 = "Y"
local KEY_Kx3 = "H"

local input_names =
{
    -- P1 input
    {
        Start = "1 Player Start",
        Coin = "Coin 1",
        Up = "P1 Up",
        Right = "P1 Right",
        Down = "P1 Down",
        Left = "P1 Left",
        LP = "P1 Jab Punch",
        MP = "P1 Strong Punch",
        HP = "P1 Fierce Punch",
        LK = "P1 Short Kick",
        MK = "P1 Forward Kick",
        HK = "P1 Roundhouse Kick"
    }, 
    -- P2 input
    {
        Start = "2 Players Start",
        Coin = "Coin 2",
        Up = "P2 Up",
        Right = "P2 Right",
        Down = "P2 Down",
        Left = "P2 Left",
        LP = "P2 Jab Punch",
        MP = "P2 Strong Punch",
        HP = "P2 Fierce Punch",
        LK = "P2 Short Kick",
        MK = "P2 Forward Kick",
        HK = "P2 Roundhouse Kick",
    }
}

function Input:new( player )
    self.names = input_names[ player ]
    self.keys = {}
end

function Input:reset()
    for k,name in pairs(self.names)
    do
        self.keys[k] = {
            name= name,
            pressed= false,
            released = false, 
            down = false, 
            state_time = 0
        }
    end
end

function Input:update()
    self:custom_keys()
    
    local buttons = joypad.get()
    
    for _,key in pairs(self.keys)
    do
        local b = buttons[key.name]
        key.pressed = false
        key.released = false
        if b and not key.down then
            key.pressed = true
        end
        if not b and key.down then
            key.released = true
        end
        if key.down == b then
            key.state_time = key.state_time + 1
        else
            key.state_time = 0
            key.down = b
        end
    end
end

function Input:custom_keys()
    local keys = input.get()

    if keys[KEY_Px3]
    then
        local buttons = joypad.get()
        buttons["P1 Jab Punch"] = true
        buttons["P1 Strong Punch"] = true
        buttons["P1 Fierce Punch"] = true
        joypad.set(buttons)
    end
    
    if keys[KEY_Kx3]
    then
        local buttons = joypad.get()
        buttons["P1 Short Kick"] = true
        buttons["P1 Forward Kick"] = true
        buttons["P1 Roundhouse Kick"] = true
        joypad.set(buttons)
    end
end

function Input:display()
    -- for k,key in pairs(self.keys)
    -- do
    --     if key.down then
    --         console.log("(!)> Holding " .. tostring(key.state_time))
    --     end
    -- end
end



function Input.get( player )
    player = player or 1
    local keys = {}
    local buttons = joypad.get()
    local names = input_names[player]
    for name, key in pairs(names)
    do
        keys[name] = buttons[key]
    end
    return keys
end

return Input