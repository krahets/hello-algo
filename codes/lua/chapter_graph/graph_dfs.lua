-- @script graph_dfs.lua
-- @date 2025-11-15
-- @author fisheryv (yue.fisher2025@gdhfi.com)

-- 添加模块搜索路径
package.path = package.path .. ";codes/lua/modules/?.lua"
package.path = package.path .. ";codes/lua/chapter_graph/graph_adjacency_list.lua"

local GraphAdjList = require("graph_adjacency_list")
local vertex = require("vertex")
local vets_to_vals = vertex.vets_to_vals
local vals_to_vets = vertex.vals_to_vets

--- 深度优先遍历辅助函数
--- @param graph GraphAdjList 图
--- @param visited table 已访问顶点集合
--- @param res table 顶点遍历序列
--- @param vet Vertex 当前顶点
local function dfs(graph, visited, res, vet)
    table.insert(res, vet) -- 记录访问顶点
    visited[vet] = true    -- 标记该顶点已被访问

    -- 遍历该顶点的所有邻接顶点
    for _, adjVet in ipairs(graph.adj_list[vet] or {}) do
        if not visited[adjVet] then
            -- 递归访问邻接顶点
            dfs(graph, visited, res, adjVet)
        end
    end
end

--- 深度优先遍历
--- @param graph GraphAdjList 图
--- @param start_vet table 起始顶点
--- @return table 顶点遍历序列
local function dfs_traversal(graph, start_vet)
    -- 顶点遍历序列
    local res = {}
    -- 哈希表，用于记录已被访问过的顶点
    local visited = {}

    dfs(graph, visited, res, start_vet)
    return res
end

-- Driver Code
local function main()
    -- 初始化无向图
    local v = vals_to_vets({ 0, 1, 2, 3, 4, 5, 6 })
    local edges = {
        { v[1], v[2] },
        { v[1], v[4] },
        { v[2], v[3] },
        { v[3], v[6] },
        { v[5], v[6] },
        { v[6], v[7] },
    }

    local graph = GraphAdjList.new(edges)
    print("\n初始化后，图为")
    graph:print()

    -- 深度优先遍历
    local res = dfs_traversal(graph, v[1])
    print("\n深度优先遍历（DFS）顶点序列为")
    print("[" .. table.concat(vets_to_vals(res), ", ") .. "]")
end

-- 执行主函数
main()
