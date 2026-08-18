-- @classmod pair
-- @date 2025-11-12
-- @author fisheryv (yue.fisher2025@gdhfi.com)

--- @class Pair
--- 键值对
--- @field key integer 键
--- @field val string 值
local Pair = {}

--- 构造函数
--- @param key integer 键
--- @param val string 值
--- @return Pair
function Pair:new(key, val)
    local obj = {}
    setmetatable(obj, self)
    self.__index = self
    obj.key = key
    obj.val = val
    return obj
end

return Pair