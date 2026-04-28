--- Console display functions
local console = console or {}

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
