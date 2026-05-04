--- Platform-dependant code wrapped in a common API layer
---@type table
local runtime =
{
    name    =  "", 
    Addr    = {},
    Gui     = {},
    Input   = {},
    Style   = {}
}

-- runtime.input = {}

local guard = false -- Guard to only bind *once* from `main.lua`.

function runtime.bind( rt )
    if not guard
    then
        for k,v in pairs(rt)
        do
            runtime[k] = v
        end
        guard = true
    -- else print("[WARN] Cannot bind. Already bound with " .. rt.name )
    end
end

return runtime