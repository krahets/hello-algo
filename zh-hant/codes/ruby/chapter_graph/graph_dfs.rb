=begin
File: graph_dfs.rb
Created Time: 2024-04-25
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require 'set'
require_relative './graph_adjacency_list'
require_relative '../utils/vertex'

### 深度優先走訪的輔助函式 ###
def dfs(graph, visited, res, vet)
  res << vet # 記錄走訪的頂點
  visited.add(vet) # 將此頂點標記為已走訪
  # 走訪此頂點的所有相鄰頂點
  for adj_vet in graph.adj_list[vet]
    next if visited.include?(adj_vet) # 略過已走訪的頂點
    # 遞迴走訪相鄰頂點
    dfs(graph, visited, res, adj_vet)
  end
end

### 深度優先走訪 ###
def graph_dfs(graph, start_vet)
  # 以鄰接串列表示圖，以便取得指定頂點的所有相鄰頂點
  # 頂點走訪順序
  res = []
  # 用雜湊集合記錄已走訪的頂點
  visited = Set.new
  dfs(graph, visited, res, start_vet)
  res
end

### Driver Code ###
if __FILE__ == $0
  # 初始化無向圖
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
  puts "\n初始化後的圖為"
  graph.__print__

  # 深度優先走訪
  res = graph_dfs(graph, v[0])
  puts "\n深度優先走訪（DFS）的頂點順序為"
  p vets_to_vals(res)
end
