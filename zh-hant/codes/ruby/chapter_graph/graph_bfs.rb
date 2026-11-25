=begin
File: graph_bfs.rb
Created Time: 2024-04-25
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require 'set'
require_relative './graph_adjacency_list'
require_relative '../utils/vertex'

### 廣度優先走訪 ###
def graph_bfs(graph, start_vet)
  # 以鄰接串列表示圖，以便取得指定頂點的所有相鄰頂點
  # 頂點走訪順序
  res = []
  # 用雜湊集合記錄已走訪的頂點
  visited = Set.new([start_vet])
  # 使用佇列實作 BFS
  que = [start_vet]
  # 從頂點 vet 出發，反覆執行，直到走訪完所有頂點
  while que.length > 0
    vet = que.shift # 取出佇列前端的頂點
    res << vet # 記錄走訪的頂點
    # 走訪此頂點的所有相鄰頂點
    for adj_vet in graph.adj_list[vet]
      next if visited.include?(adj_vet) # 略過已走訪的頂點
      que << adj_vet # 只將尚未走訪的頂點加入佇列
      visited.add(adj_vet) # 將此頂點標記為已走訪
    end
  end
  # 回傳頂點的走訪順序
  res
end

### Driver Code ###
if __FILE__ == $0
  # 初始化無向圖
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
  puts "\n初始化後的圖為"
  graph.__print__

  # 廣度優先走訪
  res = graph_bfs(graph, v.first)
  puts "\n廣度優先走訪（BFS）的頂點順序為"
  p vets_to_vals(res)
end
