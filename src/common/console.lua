--- Console display functions
local console = console or {}

console.log = console.log or function(msg)
    print(msg)
end

function console.table( arr )
    local msg = ""
    for k,v in pairs(arr) do
        msg = msg .. "\n> `" .. tostring(k) .. "` = " .. tostring(v)
    end
    console.log( msg )
end

function console.splash(info)
    print("@------------------------")
    print("@")
    print("@ traiiin3s (" .. info.version .. ")")
    print("@ ")
    print("@ By: " .. info.author .. "")
    print("@ License: " .. info.license .. "")
    print("@")
    print("@------------------------")
    print("@-- Platform:" .. info.platform)
    print("@------------------------")
end

function console.warn(msg)
    print("(!) Warning")
    print(" > " .. msg)
end

return console
