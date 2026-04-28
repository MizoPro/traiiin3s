local Object   = require "src.core.object"

local rt = require("src.runtime")

local ADDR = rt.ADDR
local GUI = rt.GUI

local WIDTH = 121
local HEIGHT = 3

local POS_X1 = 240
local POS_X2 = 55
local POS_Y = 50

local OFFSET_POT_X = 8
local OFFSET_POT_Y = -2
local OFFSET_TIMER_Y = 6
local POTS_X = { 101, 81, 61, 41, 21, 11, 5, 2, 1 }

local FILL_COLOR  = 0x00C080FF
local EMPTY_COLOR = 0x00000000
local BGCOLOR     = 0x000000FF

---@class JuggleMeter
local JuggleMeter = Object:extend()

function JuggleMeter:new( default_player )
    self.width = WIDTH
    self.height = HEIGHT
    self.X = { POS_X1, POS_X2 }
    self.Y = POS_Y
    self.default_player = default_player or 1
    self.player = self.default_player
end

function JuggleMeter:reset()
    self.player = self.default_player -- nil
    self.pot   = 0
    self.timer = 0
end

function JuggleMeter:update( player )
    self.player = player
    local addrs   = ADDR.players[ player ]
    self.pot      = memory.readbyte( addrs.juggle_potential   )
    self.timer    = memory.readbyte( addrs.juggle_timer )
    if self.timer ~= 0xFF then
        self.remaining = ( self.timer + 1) / 2
    else
        self.remaining = nil
    end
end

function JuggleMeter:display()
    local w = self.width
    local h = self.height
    
    local x = self.X [ self.player ]
    local y = self.Y

    GUI.TextView_draw( x, y + OFFSET_POT_Y, self.pot )
    x = x + OFFSET_POT_X

    GUI.BoxView_draw( x, y, w, h, EMPTY_COLOR, BGCOLOR )

    for _, p in ipairs( POTS_X ) do
        GUI.LineView_draw( x + p, y, 0, h, BGCOLOR )
    end

    if self.remaining ~= nil then
        GUI.BoxView_draw( x, y, self.remaining, h, FILL_COLOR, BGCOLOR )
        if self.timer > 0 then
            if self.remaining < 10 then
                x = x - 1
            elseif self.remaining < 100 then
                x = x - 3
            else
                x = x - 5
            end
            GUI.TextView_draw( x + self.remaining, y + OFFSET_TIMER_Y, self.remaining )
        end
    end
end

return JuggleMeter