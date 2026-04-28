local GUI = {}

function GUI.TextView_draw( x, y, message, forecolor, backcolor, fontsize, fontfamily, fontstyle, horizalign, vertalign, surfacename )
    return gui.drawText(x, y, message, forecolor , backcolor , fontsize, fontfamily , fontstyle, horizalign, vertalign, surfacename)
end

function GUI.BoxView_draw(x, y, w, h, line, background, surfacename)
    return gui.drawBox(x, y, x + w, y + h, line, background, surfacename)
end

function GUI.LineView_draw(x, y, w, h, color, surfacename)
    return gui.drawLine(x, y, x + w, y + h, color, surfacename)
end

return GUI