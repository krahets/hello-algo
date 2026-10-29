=begin
File: graph_dfs.rb
Created Time: 2024-04-25
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require 'set'
require_relative './graph_adjacency_list'
require_relative '../utils/vertex'

### 深さ優先走査の補助関数 ###
def dfs(graph, visited, res, vet)
  res << vet # 訪問した頂点を記録する
  visited.add(vet) # この頂点を訪問済みにする
  # この頂点に隣接する全頂点を走査する
  for adj_vet in graph.adj_list[vet]
    next if visited.include?(adj_vet) # 訪問済みの頂点をスキップする
    # 隣接する頂点を再帰的に訪問する
    dfs(graph, visited, res, adj_vet)
  end
end

### 深さ優先走査 ###
def graph_dfs(graph, start_vet)
  # 指定した頂点に隣接する全頂点を取得しやすいように、グラフを隣接リストで表す
  # 頂点の走査順序
  res = []
  # 訪問済みの頂点を記録するハッシュ集合
  visited = Set.new
  dfs(graph, visited, res, start_vet)
  res
end

### 実行用コード ###
if __FILE__ == $0
  # 無向グラフを初期化する
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
  puts "\n初期化後のグラフ"
  graph.__print__

  # 深さ優先走査
  res = graph_dfs(graph, v[0])
  puts "\n深さ優先走査（DFS）の頂点の順序"
  p vets_to_vals(res)
end
