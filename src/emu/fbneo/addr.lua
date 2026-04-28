
--- All memory addresses should be declared here.
---@type table
local Addr =
{
    timer = 0x02011377,
    players =
    {
        {
            base = 0x02068C6C,                  -- offset 0
            -- ?
            life = 0x02068D0B,                  -- offset 0x9F
            -- ?
            juggle_timer = 0x020694C7,          -- offset 0x85B
            juggle_potential = 0x020694C9,      -- offset 0x85D
        },
        {
            base = 0x02069104,                  -- offset 0
            life = 0x020691A3,                  -- offset 0x9F
            juggle_timer = 0x0206902f,
            juggle_potential = 0x02069031,

            -- ChatGPT Just Lying™
            ai_juggle_timer = 0x02069A07, -- Curious what is actually stored here. 
        }
    },
}

return Addr