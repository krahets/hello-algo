-- @script graph_bfs.lua
-- @date 2025-11-15
-- @author fisheryv (yue.fisher2025@gdhfi.com)

-- 添加模块搜索路径
package.path = package.path .. ";codes/lua/modules/?.lua"
package.path = package.path .. ";codes/lua/chapter_graph/graph_adjacency_list.lua"

local GraphAdjList = require("graph_adjacency_list")
local vertex = require("vertex")
local vals_to_vets = vertex.vals_to_vets
local vets_to_vals = vertex.vets_to_vals

--- 广度优先遍历
--- @param graph GraphAdjList 图
--- @param start_vet table 起始顶点
--- @return table 顶点遍历序列
local function graph_bfs(graph, start_vet)
    -- 使用邻接表来表示图，以便获取指定顶点的所有邻接顶点
    -- 顶点遍历序列
    local res = {}
    -- 哈希集合，用于记录已被访问过的顶点
    local visited = {}
    visited[start_vet] = true
    -- 队列用于实现 BFS
    local que = { start_vet }
    -- 以顶点 vet 为起点，循环直至访问完所有顶点
    while #que > 0 do
        local vet = table.remove(que, 1) -- 队首顶点出队
        table.insert(res, vet)           -- 记录访问顶点
        -- 遍历该顶点的所有邻接顶点
        for _, adj_vet in ipairs(graph.adj_list[vet]) do
            if not visited[adj_vet] then
                table.insert(que, adj_vet) -- 只入队未访问的顶点
                visited[adj_vet] = true    -- 标记该顶点已被访问
            end
        end
    end
    -- 返回顶点遍历序列
    return res
end

-- Driver Code
local function main()
    -- 初始化无向图
    local v = vals_to_vets({ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 })
    local edges = {
        { v[1], v[2] },
        { v[1], v[4] },
        { v[2], v[3] },
        { v[2], v[5] },
        { v[3], v[6] },
        { v[4], v[5] },
        { v[4], v[7] },
        { v[5], v[6] },
        { v[5], v[8] },
        { v[6], v[9] },
        { v[7], v[8] },
        { v[8], v[9] },
    }
    local graph = GraphAdjList.new(edges)
    print("\n初始化后，图为")
    graph:print()

    -- 广度优先遍历
    local res = graph_bfs(graph, v[1])
    print("\n广度优先遍历（BFS）顶点序列为")
    print("[" .. table.concat(vets_to_vals(res), ", ") .. "]")
end

-- 执行主函数
main()
