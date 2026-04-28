local ADDR =
{
    timer = 0x011377,
    players =
    {
        {
            base = 0x068C6C,                  -- offset 0
            -- ?
            life = 0x068D0B,                  -- offset 0x9F
            -- ?
            juggle_timer = 0x0694C7,          -- offset 0x85B
            juggle_potential = 0x0694C9,      -- offset 0x85D
        },
        {
            base = 0x069104,
            life = 0x0691A3,                  -- offset 0x9F
            juggle_timer = 0x06902f,
            juggle_potential = 0x069031,

            -- ChatGPT Just Lying™
            ai_juggle_timer = 0x02069A07, -- Curious what is actually stored here. 
        }
    },
}

return ADDR
