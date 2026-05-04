--- All memory addresses should be declared here.
---@type table
local Addr =
{
    freeze = 0x01136F,
    timer = 0x011377,
    players =
    {
        {
            base = 0x068C6C,             -- offset 0
            -- ?
            x_pos = 0x068C6C + 0x64,      -- offset 0x64
            y_pos = 0x068C6C + 0x68,      -- offset 0x68
            -- ?
            life = 0x068D0B,             -- offset 0x9F
            -- ?
            juggle_timer = 0x0694C7,     -- offset 0x85B
            juggle_potential = 0x0694C9, -- offset 0x85D
        },
        {
            base = 0x069104,
            -- ?
            x_pos = 0x069104 + 0x64,      -- offset 0x64
            y_pos = 0x069104 + 0x68,      -- offset 0x68
            -- ?
            life = 0x0691A3, -- offset 0x9F

            -- All the other addresses I currently know were gathered by other people.

            -- However, these two are the only ones that I had to find manually, by trial and error
            juggle_timer = 0x06902f,
            juggle_potential = 0x069031,

            -- ChatGPT Just Lying™ to me
            -- ai_juggle_timer = 0x069A07, -- Curious what is actually stored here.
        }
    },
    screen_x = 0x026CB0,
    screen_y = 0x026CB4,
    scale = 0x00DCBA,
}

return Addr
