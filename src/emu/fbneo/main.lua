
local console = require("src.common.console")

local function main(info)
    info.platform = "[S] Fightcade"
    console.splash(info)
end

return main