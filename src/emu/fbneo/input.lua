
local Object = require("src.core.object")

local Input = Object:extend()

local input_names =
{
    -- P1 input
    {
        Start = "P1 Start",
        Coin = "P1 Coin",
        Up = "P1 Up",
        Right = "P1 Right",
        Down = "P1 Down",
        Left = "P1 Left",
        LP = "P1 Weak Punch",
        MP = "P1 Medium Punch",
        HP = "P1 Strong Punch",
        LK = "P1 Weak Kick",
        MK = "P1 Medium Kick",
        HK = "P1 Strong Kick"
    }, 
    -- P2 input
    {
        Start = "P2 Start",
        Coin = "P2 Coin",
        Up = "P2 Up",
        Right = "P2 Right",
        Down = "P2 Down",
        Left = "P2 Left",
        LP = "P2 Weak Punch",
        MP = "P2 Medium Punch",
        HP = "P2 Strong Punch",
        LK = "P2 Weak Kick",
        MK = "P2 Medium Kick",
        HK = "P2 Strong Kick",
    }
}

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