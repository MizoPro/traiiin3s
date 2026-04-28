--- Platform-dependant code
local runtime = {}

runtime.ADDR = {}
runtime.GUI = {}
-- runtime.input = {}

local __bounded = false -- only `main.lua` could bind

function runtime.bind( rt )
    if not __bounded
    then
        for k,v in pairs(rt)
        do
            runtime[k] = v
        end
        __bounded = true
    end
end

return runtime