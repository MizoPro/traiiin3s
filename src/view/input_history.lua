local Object = require("src.core.object")
local rt = require("src.runtime")

local console = require("src.common.console")

local Gui = rt.Gui
local Addr = rt.Addr
local Style = rt.Style
local Input = rt.Input

local POS_X = 4
local POS_Y = 49
local MAX_SIZE = 15
local YSTEP = 10
local X_OFFSET = 14
local X_LAST_OFFSET = 8 --   rtl := -11

---@class InputHistory
local InputHistory = Object:extend()

---@class Segment
local Segment = Object:extend()

---@class Entry
local Entry = Object:extend()

function InputHistory:new()
    self.p1 = Segment(1)
    self.p2 = Segment(2)
end

function InputHistory:reset()
    self.p1:reset()
    self.p2:reset()
end

function InputHistory:update( settings )
    -- if settings then
    --      if settings.dynamic then
    --         self.p1.is_visible = true
    --         self.p2.is_visible = false
    --         --local pos_x = memory.read_s16_be( Addr.players[1].x_pos ) -- memory.readwordsigned(_obj.base + 0x64)
    --         self.p1.is_rtl = false -- pos_x < 320
    --      elseif settings.both then
    --         self.p1.is_visible = true
    --         self.p2.is_visible = true
    --      else
    --         self.p2.is_visible = false
    --      end
    -- end
    self.p1:update()
    self.p2:update()
end

function InputHistory:display()
    self.p1:display()
    self.p2:display()
end

local buttons = { "LP", "MP", "HP", "LK", "MK", "HK" }

function Segment:new(player, is_rtl)
    self.player = player
    self.is_rtl = is_rtl or (player == 2)
    self.is_visible = true
    self.x = POS_X
end

function Segment:reset()
    self.history = {}
    self.x = POS_X
end

function Segment:update()
    local frame = emu.framecount()
    local keys = Input.get( self.player )
    local entry = Entry(frame, keys)

    if #self.history == 0
    then
        return table.insert(self.history, entry)
    end

    local last_entry = self.history[#self.history]
    if last_entry.frame ~= emu.framecount() and entry:not_eq(last_entry)
    then
        table.insert(self.history, entry)
    end

    while #self.history > MAX_SIZE
    do
        table.remove(self.history, 1)
    end
end

function Segment:display()
    if not self.is_visible then return end
    local x = self.x
    if self.is_rtl then x = Gui.width() - x end
    local y = POS_Y
    local frame = emu.framecount()
    for i = #self.history, 1, -1
    do
        local entry = self.history[i]

        local xOffset = X_LAST_OFFSET
        if self.is_rtl then xOffset = -xOffset end
        entry:display(x + xOffset, y, self.is_rtl)

        if i < #self.history
        then
            frame = self.history[i + 1].frame
        end
        local frame_diff = frame - entry.frame
        local text = frame_diff < 999 and string.format("%d", frame_diff) or "-"
        local offset = X_LAST_OFFSET
        if not self.is_rtl and frame_diff < 999
        then
            if frame > 99 then
                offset = 0
            elseif frame > 9 then
                offset = 4
            end
        end

        Gui.TextView_draw(x + offset, y + 1, text, Style.input_history.color, Style.input_history.bgColor)

        y = y + YSTEP
    end
end

function Entry:new(frame, keys)
    self.frame = frame
    local direction = 5
    if keys.Left then
        direction = 4
    elseif keys.Right then
        direction = 6
    end
    if keys.Down then
        direction = direction - 3
    elseif keys.Up then
        direction = direction + 3
    end
    self.direction = string.format("D%d", direction)
    self.buttons = {}
    for _, name in ipairs(buttons) do
        self.buttons[name] = keys[name]
    end
end

function Entry:display(x, y, rtl)
    Gui.draw_controller_small(self, x, y, rtl)
end

function Entry:not_eq(other)
    return self.direction ~= other.direction or
        self.buttons.LP ~= other.buttons.LP or
        self.buttons.MP ~= other.buttons.MP or
        self.buttons.HP ~= other.buttons.HP or
        self.buttons.LK ~= other.buttons.LK or
        self.buttons.MK ~= other.buttons.MK or
        self.buttons.HK ~= other.buttons.HK
end

return InputHistory
