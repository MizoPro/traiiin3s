--- Platform-independant GUI wrapper around Fightcade's `gd` module
---@type table
--- TODO come up with an actual API
local Gui = {}

require("gd")

function Gui.TextView_draw( x, y, message, forecolor, backcolor, fontsize, fontfamily, fontstyle, horizalign, vertalign, surfacename )
    return gui.drawtext(x, y, message, forecolor , backcolor , fontsize, fontfamily , fontstyle, horizalign, vertalign, surfacename)
end

function Gui.BoxView_draw(x, y, w, h, line, background, surfacename)
    return gui.drawbox(x, y, x + w, y + h, line, background, surfacename)
end

function Gui.LineView_draw(x, y, w, h, color, surfacename)
    return gui.drawline(x, y, x + w, y + h, color, surfacename)
end

return Gui