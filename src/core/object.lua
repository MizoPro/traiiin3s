---@class Object
---@field super Object
---The parent of every class object
--- makes declaring and using classes a lot easier
local Object = {}
Object.__index = Object

---Can be overrided by child objects to implement a constructor.
function Object:new(...) end

function Object:extend()
  local cls = {}
  for k,v in pairs(self) do
    if k:find("__") == 1 then
      cls[k] = v
    end
  end
  cls.__index = cls
  cls.super = self
  setmetatable(cls, self)
  return cls
end

---Methamethod to allow using the object call as a constructor.
function Object:__call(...)
  local obj = setmetatable({}, self)
  obj:new(...)
  return obj
end

---Check if the object inherits from the given type.
---@param T any
---@return boolean
function Object:extends(T)
  local mt = getmetatable(self)
  while mt do
    if mt == T then
      return true
    end
    mt = getmetatable(mt)
  end
  return false
end

---Check if the object is strictly of the given type.
---@param T any
---@return boolean
function Object:is(T)
  return getmetatable(self) == T
end

---Metamethod to get a string representation of an object.
---@return string
function Object:__tostring()
  return "[Object]"
end

return Object