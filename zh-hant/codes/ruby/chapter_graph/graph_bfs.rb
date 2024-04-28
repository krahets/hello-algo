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
  # 使用鄰接表來表示圖，以便獲取指定頂點的所有鄰接頂點
  # 頂點走訪序列
  res = []
  # 雜湊集合，用於記錄已被訪問過的頂點
  visited = Set.new([start_vet])
  # 佇列用於實現 BFS
  que = [start_vet]
  # 以頂點 vet 為起點，迴圈直至訪問完所有頂點
  while que.length > 0
    vet = que.shift # 佇列首頂點出隊
    res << vet # 記錄訪問頂點
    # 走訪該頂點的所有鄰接頂點
    for adj_vet in graph.adj_list[vet]
      next if visited.include?(adj_vet) # 跳過已被訪問的頂點
      que << adj_vet # 只入列未訪問的頂點
      visited.add(adj_vet) # 標記該頂點已被訪問
    end
  end
  # 返回頂點走訪序列
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
  puts "\n初始化後，圖為"
  graph.__print__

  # 廣度優先走訪
  res = graph_bfs(graph, v.first)
  puts "\n廣度優先便利（BFS）頂點序列為"
  p vets_to_vals(res)
end
