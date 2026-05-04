---Style, colors, fonts, etc for BizHawk
---@type table
local Style = {}

-- Colors are in AARRGGBB in BizHawk
Style.juggle_meter =
{
    fill   = 0xFF00C080,
    empty  = 0xFF000000,
    bg     = 0x00000000,
    border = 0xFF000000,
    text   = 0xFFFFFFFF,
}

Style.input_history = 
{
    color = 0xFFD6E3EF, 
    bgColor = 0xFF101000
}

return Style
