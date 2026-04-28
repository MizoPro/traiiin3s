
local console = require("src.common.console")

local function main(info)
    info.platform = "[!] Unknown"
    console.splash(info)
end

return main