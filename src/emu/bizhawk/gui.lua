local Addr = require("src.emu.bizhawk.addr")

--- Platform-independant GUI wrapper around BizHawk's `gui` module
---@type table
--- TODO come up with an actual API
local Gui = {}

-- # Constants
local ground_offset = 23

function Gui.width()
    -- Do NOT use `client.screenwidth` because it gives *wrong* dimensions!
    return client.bufferwidth() -- 384
end

function Gui.height()
    -- Do NOT use `client.screenheight` because it gives *wrong* dimensions!
    return client.bufferheight() -- 224
end

local screen_x = 0
local screen_y = 0
local scale = 1

function Gui.screen_x()
    return screen_x
end

function Gui.update()
  -- screen stuff
  screen_x = memory.read_s16_be(Addr.screen_x)
  screen_y = memory.read_s16_be(Addr.screen_y)
  scale = memory.read_s16_be(Addr.scale)
  scale = 0x40 / (scale > 0 and scale or 1)
end

-- # Tools
function Gui.game_to_screen_space_x(x)
  return x - screen_x - client.screenwidth() / 2-- - client.bufferwidth()
end
function Gui.game_to_screen_space_y(y)
  return client.screenheight() - (y - screen_y) - ground_offset
end
function Gui.game_to_screen_space(x, y)
  return Gui.game_to_screen_space_x(x), Gui.game_to_screen_space_y(y)
end

local button_image_map =
{
    D1 = "./assets/img/key/DIR_1.png",
    D2 = "./assets/img/key/DIR_2.png",
    D3 = "./assets/img/key/DIR_3.png",
    D4 = "./assets/img/key/DIR_4.png",
    D5 = "./assets/img/key/DIR_5.png",
    D6 = "./assets/img/key/DIR_6.png",
    D7 = "./assets/img/key/DIR_7.png",
    D8 = "./assets/img/key/DIR_8.png",
    D9 = "./assets/img/key/DIR_9.png",
    LP = "./assets/img/key/LP.png",
    MP = "./assets/img/key/MP.png",
    HP = "./assets/img/key/HP.png",
    LK = "./assets/img/key/LK.png",
    MK = "./assets/img/key/MK.png",
    HK = "./assets/img/key/HK.png"
}

function Gui.TextView_draw(x, y, message, forecolor, backcolor, fontsize, fontfamily, fontstyle, horizalign, vertalign,
                           surfacename)
    return gui.drawText(x, y, message, forecolor, backcolor, fontsize, fontfamily, fontstyle, horizalign, vertalign,
        surfacename)
end

function Gui.BoxView_draw(x, y, w, h, line, background, surfacename)
    return gui.drawBox(x, y, x + w, y + h, line, background, surfacename)
end

function Gui.LineView_draw(x, y, w, h, color, surfacename)
    return gui.drawLine(x, y, x + w, y + h, color, surfacename)
end

function Gui.draw_controller_small(obj, x, y, rtl)
    local sign = 1
    if rtl then sign = -1 end
    local offset = sign * 10
    local x = x + offset
    local dir_image = button_image_map[obj.direction]
    gui.drawImage(dir_image, x, y)
    local interval = 8 * sign
    for name, key in pairs(obj.buttons)
    do
        if key then
            x = x + interval
            local btn_img = button_image_map[name]
            gui.drawImage( btn_img, x, y )
        end
    end
end

local radius = 10

function Gui.draw_point(x, y, color)
    gui.drawEllipse( x, y, radius, radius, color )
end

return Gui
