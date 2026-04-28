local Object         = require "src.core.object"

local rt             = require("src.runtime")

local Addr           = rt.Addr
local Gui            = rt.Gui
local Style          = rt.Style

local WIDTH          = 121
local HEIGHT         = 3

local POS_X1         = 240
local POS_X2         = 55
local POS_Y          = 50

local OFFSET_POT_X   = 8
local OFFSET_POT_Y   = -2
local OFFSET_TIMER_Y = 6
local POTS_X         = { 101, 81, 61, 41, 21, 11, 5, 2, 1 }

---@class JuggleMeter
local JuggleMeter    = Object:extend()

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
    self.pot    = 0
    self.timer  = 0
end

function JuggleMeter:update( player )
    self.player = player or self.player
    local addrs = Addr.players[self.player]
    self.pot    = memory.readbyte(addrs.juggle_potential)
    self.timer  = memory.readbyte(addrs.juggle_timer)
    if self.timer ~= 0xFF then
        self.remaining = (self.timer + 1) / 2
    else
        self.remaining = nil
    end
end

function JuggleMeter:display()
    local w = self.width
    local h = self.height

    local x = self.X[self.player]
    local y = self.Y

    Gui.TextView_draw(x, y + OFFSET_POT_Y, self.pot, Style.juggle_meter.text)
    x = x + OFFSET_POT_X

    Gui.BoxView_draw(x, y, w, h, Style.juggle_meter.border, Style.juggle_meter.bg)

    for _, p in ipairs(POTS_X) do
        Gui.LineView_draw(x + p, y, 0, h, Style.juggle_meter.border)
    end

    if self.remaining ~= nil then
        Gui.BoxView_draw(x, y, self.remaining, h, Style.juggle_meter.border, Style.juggle_meter.fill)
        if self.timer > 0 then
            if self.remaining < 10 then
                x = x - 1
            elseif self.remaining < 100 then
                x = x - 3
            else
                x = x - 5
            end
            Gui.TextView_draw(x + self.remaining, y + OFFSET_TIMER_Y, self.remaining, Style.juggle_meter.text)
        end
    end
end

return JuggleMeter
