=begin
File: graph_bfs.rb
Created Time: 2024-04-25
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require 'set'
require_relative './graph_adjacency_list'
require_relative '../utils/vertex'

### 幅優先探索 ###
def graph_bfs(graph, start_vet)
  # 指定した頂点の隣接頂点をすべて取得できるよう、グラフを隣接リストで表す
  # 頂点の訪問順
  res = []
  # 訪問済みの頂点を記録するハッシュ集合
  visited = Set.new([start_vet])
  # BFS にキューを使う
  que = [start_vet]
  # 頂点 vet から開始し、すべての頂点を訪問するまで繰り返す
  while que.length > 0
    vet = que.shift # キューの先頭から頂点を取り出す
    res << vet # 訪問した頂点を記録する
    # この頂点の隣接頂点をすべて調べる
    for adj_vet in graph.adj_list[vet]
      next if visited.include?(adj_vet) # 訪問済みの頂点を飛ばす
      que << adj_vet # 未訪問の頂点だけをキューに追加する
      visited.add(adj_vet) # この頂点を訪問済みにする
    end
  end
  # 頂点を訪問順に返す
  res
end

### 実行例 ###
if __FILE__ == $0
  # 無向グラフを初期化する
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
  puts "\n初期化後のグラフ："
  graph.__print__

  # 幅優先探索
  res = graph_bfs(graph, v.first)
  puts "\n幅優先探索（BFS）での頂点の訪問順："
  p vets_to_vals(res)
end
