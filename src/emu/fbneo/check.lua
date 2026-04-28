
local console = require("src.common.console")
local const   = require("src.common.const")

--- Is this Fightcade's fbneo emulator?
---@return boolean
local function check()
    if emu and emu.romname
    then
        local romname = emu.romname()
        if romname ~= const.ROMNAME
        then
            console.warn("Expected `" .. const.ROMNAME .. "`\n" .. "Found `" .. romname "` instead!")
        end
        return true
    end
    return false
end

return check