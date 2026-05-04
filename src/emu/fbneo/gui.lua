--- Platform-independant GUI wrapper around Fightcade's `gd` module
---@type table
--- TODO come up with an actual API
local Gui = {}

require("gd")

local button_image_map =
{
    D1 = gd.createFromPng("./assets/img/key/DIR_1.png"):gdStr(),
    D2 = gd.createFromPng("./assets/img/key/DIR_2.png"):gdStr(),
    D3 = gd.createFromPng("./assets/img/key/DIR_3.png"):gdStr(),
    D4 = gd.createFromPng("./assets/img/key/DIR_4.png"):gdStr(),
    D5 = gd.createFromPng("./assets/img/key/DIR_5.png"):gdStr(),
    D6 = gd.createFromPng("./assets/img/key/DIR_6.png"):gdStr(),
    D7 = gd.createFromPng("./assets/img/key/DIR_7.png"):gdStr(),
    D8 = gd.createFromPng("./assets/img/key/DIR_8.png"):gdStr(),
    D9 = gd.createFromPng("./assets/img/key/DIR_9.png"):gdStr(),
    LP = gd.createFromPng("./assets/img/key/LP.png"):gdStr(),
    MP = gd.createFromPng("./assets/img/key/MP.png"):gdStr(),
    HP = gd.createFromPng("./assets/img/key/HP.png"):gdStr(),
    LK = gd.createFromPng("./assets/img/key/LK.png"):gdStr(),
    MK = gd.createFromPng("./assets/img/key/MK.png"):gdStr(),
    HK = gd.createFromPng("./assets/img/key/HK.png"):gdStr()
}

-- # Constants
local ground_offset = 23

function Gui.width()
    -- Do NOT use `client.screenwidth` because it gives *wrong* dimensions!
    return emu.screenwidth() -- 384
end

function Gui.height()
    -- Do NOT use `client.screenheight` because it gives *wrong* dimensions!
    return emu.screenheight() -- 224
end

function Gui.TextView_draw(x, y, message, fillColor)
    return gui.drawtext(x, y, message, fillColor)
end

function Gui.BoxView_draw(x, y, w, h, borderColor, fillColor)
    return gui.drawbox(x, y, x + w, y + h, fillColor, borderColor)
end

function Gui.LineView_draw(x, y, w, h, fillColor)
    return gui.drawline(x, y, x + w, y + h, fillColor)
end

function Gui.draw_controller_small(obj, x, y, rtl)
    local sign = 1
    if rtl then sign = -1 end
    local offset = sign * 10
    local x = x + offset
    local dir_image = button_image_map[obj.direction]
    gui.image(x, y, dir_image)
    local interval = 8 * sign
    for name, key in pairs(obj.buttons)
    do
        if key then
            x = x + interval
            local btn_img = button_image_map[name]
            gui.image( x, y, btn_img )
        end
    end
end

return Gui