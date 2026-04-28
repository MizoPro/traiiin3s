
local console = require("src.common.console")
local const   = require("src.common.const")

--- Is this BizHawk Emulator?
---@return boolean
local function check()
    if gameinfo and gameinfo.getromname
    then
        local romname = gameinfo.getromname()
        if romname ~= const.ROMFULLNAME
        then
            console.warn("Expected `" .. const.ROMNAME .. "`\n" .. "Found `" .. romname "` instead!")
        end
        return true
    end
    return false
end

return check