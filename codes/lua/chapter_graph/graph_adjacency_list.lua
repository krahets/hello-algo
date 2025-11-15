-- @script graph_adjacency_list.lua
-- @date 2025-11-15
-- @author fisheryv (yue.fisher2025@gdhfi.com)

-- 添加模块搜索路径
package.path = package.path .. ";codes/lua/modules/?.lua"

local vertex = require("vertex")
local Vertex = vertex.Vertex
local vals_to_vets = vertex.vals_to_vets

--- @class GraphAdjList
--- 基于邻接表实现的无向图类
--- @field adj_list table 邻接表
local GraphAdjList = {}
GraphAdjList.__index = GraphAdjList

--- 构造方法
--- @param edges table 边列表，每一条边包含两个顶点
--- @return GraphAdjList 实例
function GraphAdjList.new(edges)
    local obj = setmetatable({}, GraphAdjList)

    -- 邻接表，key：顶点，value：该顶点的所有邻接顶点
    obj.adj_list = {}

    -- 添加所有顶点和边
    for _, edge in ipairs(edges) do
        obj:add_vertex(edge[1])
        obj:add_vertex(edge[2])
        obj:add_edge(edge[1], edge[2])
    end

    return obj
end

--- 获取顶点数量
--- @return integer 顶点数量
function GraphAdjList:size()
    local count = 0
    for _ in pairs(self.adj_list) do
        count = count + 1
    end
    return count
end

--- 添加边
--- @param vet1 Vertex 顶点1
--- @param vet2 Vertex 顶点2
--- @raise 当顶点不存在或顶点相同时抛出错误
function GraphAdjList:add_edge(vet1, vet2)
    if not self.adj_list[vet1] or not self.adj_list[vet2] or vet1 == vet2 then
        error("无效的边")
    end

    -- 添加边 vet1 - vet2
    table.insert(self.adj_list[vet1], vet2)
    table.insert(self.adj_list[vet2], vet1)
end

--- 删除边
--- @param vet1 Vertex 顶点1
--- @param vet2 Vertex 顶点2
--- @raise 当顶点不存在或顶点相同时抛出错误
function GraphAdjList:remove_edge(vet1, vet2)
    if not self.adj_list[vet1] or not self.adj_list[vet2] or vet1 == vet2 then
        error("无效的边")
    end

    -- 删除边 vet1 - vet2
    self:_remove_from_list(self.adj_list[vet1], vet2)
    self:_remove_from_list(self.adj_list[vet2], vet1)
end

--- 添加顶点
--- @param vet Vertex 要添加的顶点
function GraphAdjList:add_vertex(vet)
    if self.adj_list[vet] then
        return
    end

    -- 在邻接表中添加一个新链表
    self.adj_list[vet] = {}
end

--- 删除顶点
--- @param vet Vertex 要删除的顶点
--- @raise 当顶点不存在时抛出错误
function GraphAdjList:remove_vertex(vet)
    if not self.adj_list[vet] then
        error("顶点不存在")
    end

    -- 在邻接表中删除顶点 vet 对应的链表
    self.adj_list[vet] = nil

    -- 遍历其他顶点的链表，删除所有包含 vet 的边
    for vertex, adj_vertices in pairs(self.adj_list) do
        self:_remove_from_list(adj_vertices, vet)
    end
end

--- 打印邻接表
function GraphAdjList:print()
    print("邻接表 =")
    for vertex, adj_vertices in pairs(self.adj_list) do
        local tmp = {}
        for _, v in ipairs(adj_vertices) do
            table.insert(tmp, v.val)
        end
        print(string.format("%d: [%s],", vertex.val, table.concat(tmp, ", ")))
    end
end

-- 私有方法：从列表中删除指定元素
function GraphAdjList:_remove_from_list(list, item)
    for i = #list, 1, -1 do
        if list[i] == item then
            table.remove(list, i)
            break
        end
    end
end

-- Driver Code
local function main()
    -- 初始化无向图
    local v = vals_to_vets({ 1, 3, 2, 5, 4 })
    local edges = {
        { v[1], v[2] },
        { v[1], v[4] },
        { v[2], v[3] },
        { v[3], v[4] },
        { v[3], v[5] },
        { v[4], v[5] },
    }
    local graph = GraphAdjList.new(edges)
    print("\n初始化后，图为")
    graph:print()

    -- 添加边
    -- 顶点 1, 2 即 v[1], v[3]
    graph:add_edge(v[1], v[3])
    print("\n添加边 1-2 后，图为")
    graph:print()

    -- 删除边
    -- 顶点 1, 3 即 v[1], v[2]
    graph:remove_edge(v[1], v[2])
    print("\n删除边 1-3 后，图为")
    graph:print()

    -- 添加顶点
    local v5 = Vertex.new(6)
    graph:add_vertex(v5)
    print("\n添加顶点 6 后，图为")
    graph:print()

    -- 删除顶点
    -- 顶点 3 即 v[2]
    graph:remove_vertex(v[2])
    print("\n删除顶点 3 后，图为")
    graph:print()
end


if ... then
    -- 被 require 作为模块加载
else
    -- 执行主函数
    main()
end

return GraphAdjList
