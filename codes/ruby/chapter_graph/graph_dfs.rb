=begin
File: graph_dfs.rb
Created Time: 2024-04-25
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require 'set'
require_relative './graph_adjacency_list'
require_relative '../utils/vertex'

### 深度优先遍历辅助函数 ###
def dfs(graph, visited, res, vet)
  res << vet # 记录访问顶点
  visited.add(vet) # 标记该顶点已被访问
  # 遍历该顶点的所有邻接顶点
  for adj_vet in graph.adj_list[vet]
    next if visited.include?(adj_vet) # 跳过已被访问的顶点
    # 递归访问邻接顶点
    dfs(graph, visited, res, adj_vet)
  end
end

### 深度优先遍历 ###
def graph_dfs(graph, start_vet)
  # 使用邻接表来表示图，以便获取指定顶点的所有邻接顶点
  # 顶点遍历序列
  res = []
  # 哈希集合，用于记录已被访问过的顶点
  visited = Set.new
  dfs(graph, visited, res, start_vet)
  res
end

### Driver Code ###
if __FILE__ == $0
  # 初始化无向图
  v = vals_to_vets([0, 1, 2, 3, 4, 5, 6])
  edges = [
    [v[0], v[1]],
    [v[0], v[3]],
    [v[1], v[2]],
    [v[2], v[5]],
    [v[4], v[5]],
    [v[5], v[6]],
  ]
  graph = GraphAdjList.new(edges)
  puts "\n初始化后，图为"
  graph.__print__

  # 深度优先遍历
  res = graph_dfs(graph, v[0])
  puts "\n深度优先遍历（DFS）顶点序列为"
  p vets_to_vals(res)
end
