
--- All memory addresses should be declared here.
---@type table
local Addr =
{
    freeze = 0x0201136F,
    timer = 0x02011377,
    players =
    {
        {
            base = 0x02068C6C,                  -- offset 0
            -- ?
            x_pos = 0x02068C6C + 0x64,      -- offset 0x64
            y_pos = 0x02068C6C + 0x68,      -- offset 0x68
            life = 0x02068D0B,                  -- offset 0x9F
            -- ?
            juggle_timer = 0x020694C7,          -- offset 0x85B
            juggle_potential = 0x020694C9,      -- offset 0x85D
        },
        {
            base = 0x02069104,                  -- offset 0
            x_pos = 0x02069104 + 0x64,      -- offset 0x64
            y_pos = 0x02069104 + 0x68,      -- offset 0x68
            life = 0x020691A3,                  -- offset 0x9F
            juggle_timer = 0x0206902f,
            juggle_potential = 0x02069031,

            -- ChatGPT Just Lying™
            ai_juggle_timer = 0x02069A07, -- Curious what is actually stored here. 
        }
    },
    screen_x = 0x02026CB0,
    screen_y = 0x02026CB4,
    scale = 0x0200DCBA,
}

return Addr