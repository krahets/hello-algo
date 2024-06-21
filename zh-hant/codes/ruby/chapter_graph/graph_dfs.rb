=begin
File: graph_dfs.rb
Created Time: 2024-04-25
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require 'set'
require_relative './graph_adjacency_list'
require_relative '../utils/vertex'

### 深度優先走訪輔助函式 ###
def dfs(graph, visited, res, vet)
  res << vet # 記錄訪問頂點
  visited.add(vet) # 標記該頂點已被訪問
  # 走訪該頂點的所有鄰接頂點
  for adj_vet in graph.adj_list[vet]
    next if visited.include?(adj_vet) # 跳過已被訪問的頂點
    # 遞迴訪問鄰接頂點
    dfs(graph, visited, res, adj_vet)
  end
end

### 深度優先走訪 ###
def graph_dfs(graph, start_vet)
  # 使用鄰接表來表示圖，以便獲取指定頂點的所有鄰接頂點
  # 頂點走訪序列
  res = []
  # 雜湊集合，用於記錄已被訪問過的頂點
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
  puts "\n初始化後，圖為"
  graph.__print__

  # 深度優先走訪
  res = graph_dfs(graph, v[0])
  puts "\n深度優先走訪（DFS）頂點序列為"
  p vets_to_vals(res)
end
