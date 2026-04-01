-- @classmod vertex
-- @date 2025-11-15
-- @author fisheryv (yue.fisher2025@gdhfi.com)

--- @class Vertex
--- 顶点类
--- @field val integer 顶点值
local Vertex = {}
Vertex.__index = Vertex

--- 构造函数
--- @param val integer 顶点值
--- @return Vertex 新顶点实例
function Vertex.new(val)
    local obj = setmetatable({}, Vertex)
    obj.val = val
    return obj
end

--- 输入值列表，返回顶点列表
--- @param vals table 值列表
--- @return table 顶点列表
local function vals_to_vets(vals)
    local vets = {}
    for _, val in ipairs(vals) do
        table.insert(vets, Vertex.new(val))
    end
    return vets
end

--- 输入顶点列表，返回值列表
--- @param vets table 顶点列表
--- @return table 值列表
local function vets_to_vals(vets)
    local vals = {}
    for _, vet in ipairs(vets) do
        table.insert(vals, vet.val)
    end
    return vals
end

return {
    Vertex = Vertex,
    vals_to_vets = vals_to_vets,
    vets_to_vals = vets_to_vals
}
