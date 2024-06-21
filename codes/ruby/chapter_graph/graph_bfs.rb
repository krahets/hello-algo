=begin
File: graph_bfs.rb
Created Time: 2024-04-25
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require 'set'
require_relative './graph_adjacency_list'
require_relative '../utils/vertex'

### 广度优先遍历 ###
def graph_bfs(graph, start_vet)
  # 使用邻接表来表示图，以便获取指定顶点的所有邻接顶点
  # 顶点遍历序列
  res = []
  # 哈希集合，用于记录已被访问过的顶点
  visited = Set.new([start_vet])
  # 队列用于实现 BFS
  que = [start_vet]
  # 以顶点 vet 为起点，循环直至访问完所有顶点
  while que.length > 0
    vet = que.shift # 队首顶点出队
    res << vet # 记录访问顶点
    # 遍历该顶点的所有邻接顶点
    for adj_vet in graph.adj_list[vet]
      next if visited.include?(adj_vet) # 跳过已被访问的顶点
      que << adj_vet # 只入队未访问的顶点
      visited.add(adj_vet) # 标记该顶点已被访问
    end
  end
  # 返回顶点遍历序列
  res
end

### Driver Code ###
if __FILE__ == $0
  # 初始化无向图
  v = vals_to_vets([0, 1, 2, 3, 4, 5, 6, 7, 8, 9])
  edges = [
    [v[0], v[1]],
    [v[0], v[3]],
    [v[1], v[2]],
    [v[1], v[4]],
    [v[2], v[5]],
    [v[3], v[4]],
    [v[3], v[6]],
    [v[4], v[5]],
    [v[4], v[7]],
    [v[5], v[8]],
    [v[6], v[7]],
    [v[7], v[8]],
  ]
  graph = GraphAdjList.new(edges)
  puts "\n初始化后，图为"
  graph.__print__

  # 广度优先遍历
  res = graph_bfs(graph, v.first)
  puts "\n广度优先便利（BFS）顶点序列为"
  p vets_to_vals(res)
end
