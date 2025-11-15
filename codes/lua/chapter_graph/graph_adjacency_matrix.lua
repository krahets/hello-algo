-- @script graph_adjacency_matrix.lua
-- @date 2025-11-15
-- @author fisheryv (yue.fisher2025@gdhfi.com)

-- 添加模块搜索路径
package.path = package.path .. ";codes/lua/modules/?.lua"

local print_util = require("print_util")

--- @class GraphAdjMat
--- 基于邻接矩阵实现的无向图类
--- @field vertices table 顶点列表，元素代表"顶点值"
--- @field adj_mat table 邻接矩阵
local GraphAdjMat = {}
GraphAdjMat.__index = GraphAdjMat

--- 构造方法
--- @param vertices table 顶点列表，元素代表"顶点值"
--- @param edges table 边列表，元素代表顶点索引，即对应vertices元素索引
--- @return GraphAdjMat
function GraphAdjMat.new(vertices, edges)
    local obj = setmetatable({}, GraphAdjMat)

    -- 顶点列表，元素代表"顶点值"，索引代表"顶点索引"
    obj.vertices = {}
    -- 邻接矩阵，行列索引对应"顶点索引"
    obj.adj_mat = {}

    -- 添加顶点
    for _, val in ipairs(vertices) do
        obj:add_vertex(val)
    end

    -- 添加边
    for _, e in ipairs(edges) do
        obj:add_edge(e[1], e[2])
    end

    return obj
end

--- 获取顶点数量
--- @return integer
function GraphAdjMat:size()
    return #self.vertices
end

--- 添加顶点
--- @param val number 顶点值
function GraphAdjMat:add_vertex(val)
    local n = self:size()

    -- 向顶点列表中添加新顶点的值
    table.insert(self.vertices, val)

    -- 在邻接矩阵中添加一行
    local new_row = {}
    for i = 1, n do
        new_row[i] = 0
    end
    table.insert(self.adj_mat, new_row)

    -- 在邻接矩阵中添加一列
    for _, row in ipairs(self.adj_mat) do
        row[n + 1] = 0
    end
end

--- 删除顶点
--- @param index integer 顶点索引
function GraphAdjMat:remove_vertex(index)
    if index > self:size() or index < 1 then
        error("Index out of range")
    end

    -- 在顶点列表中移除索引index的顶点
    table.remove(self.vertices, index)

    -- 在邻接矩阵中删除索引index的行
    table.remove(self.adj_mat, index)

    -- 在邻接矩阵中删除索引index的列
    for _, row in ipairs(self.adj_mat) do
        table.remove(row, index)
    end
end

--- 添加边
--- @param i integer 顶点i的索引，对应vertices元素索引
--- @param j integer 顶点j的索引，对应vertices元素索引
function GraphAdjMat:add_edge(i, j)
    -- 参数i, j对应vertices元素索引
    -- 索引越界与相等处理
    local n = self:size()
    if i < 1 or j < 1 or i > n or j > n or i == j then
        error("Index out of range or i equals j")
    end

    -- 在无向图中，邻接矩阵关于主对角线对称，即满足(i, j) == (j, i)
    self.adj_mat[i][j] = 1
    self.adj_mat[j][i] = 1
end

--- 删除边
--- @param i integer 顶点i的索引，对应vertices元素索引
--- @param j integer 顶点j的索引，对应vertices元素索引
function GraphAdjMat:remove_edge(i, j)
    -- 参数i, j对应vertices元素索引
    -- 索引越界与相等处理
    local n = self:size()
    if i < 1 or j < 1 or i > n or j > n or i == j then
        error("Index out of range or i equals j")
    end

    self.adj_mat[i][j] = 0
    self.adj_mat[j][i] = 0
end

--- 打印邻接矩阵
function GraphAdjMat:print()
    print("顶点列表 = [" .. table.concat(self.vertices, ", ") .. "]")
    print("邻接矩阵 =")
    print_util.print_matrix(self.adj_mat)
end

-- Driver Code
local function main()
    -- 初始化无向图
    -- 请注意，edges元素代表顶点索引，即对应vertices元素索引
    local vertices = { 1, 3, 2, 5, 4 }
    local edges = { { 1, 2 }, { 1, 4 }, { 2, 3 }, { 3, 4 }, { 3, 5 }, { 4, 5 } }
    local graph = GraphAdjMat.new(vertices, edges)
    print("\n初始化后，图为")
    graph:print()

    -- 添加边
    -- 顶点1, 2的索引分别为1, 3
    graph:add_edge(1, 3)
    print("\n添加边 1-2 后，图为")
    graph:print()

    -- 删除边
    -- 顶点1, 3的索引分别为1, 2
    graph:remove_edge(1, 2)
    print("\n删除边 1-3 后，图为")
    graph:print()

    -- 添加顶点
    graph:add_vertex(6)
    print("\n添加顶点 6 后，图为")
    graph:print()

    -- 删除顶点
    -- 顶点3的索引为2
    graph:remove_vertex(2)
    print("\n删除顶点 3 后，图为")
    graph:print()
end

-- 执行主函数
main()
