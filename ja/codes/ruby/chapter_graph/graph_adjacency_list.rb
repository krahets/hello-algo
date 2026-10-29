=begin
File: graph_adjacency_list.rb
Created Time: 2024-04-25
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/vertex'

### 隣接リストで実装した無向グラフクラス ###
class GraphAdjList
  attr_reader :adj_list
  
  ### コンストラクタ ###
  def initialize(edges)
    # 隣接リスト。key：頂点、value：その頂点に隣接する全頂点
    @adj_list = {}
    # すべての頂点と辺を追加する
    for edge in edges
      add_vertex(edge[0])
      add_vertex(edge[1])
      add_edge(edge[0], edge[1])
    end
  end

  ### 頂点数を取得する ###
  def size
    @adj_list.length
  end

  ### 辺を追加する ###
  def add_edge(vet1, vet2)
    raise ArgumentError if !@adj_list.include?(vet1) || !@adj_list.include?(vet2)

    @adj_list[vet1] << vet2
    @adj_list[vet2] << vet1
  end

  ### 辺を削除する ###
  def remove_edge(vet1, vet2)
    raise ArgumentError if !@adj_list.include?(vet1) || !@adj_list.include?(vet2)

    # 辺 vet1 - vet2 を削除する
    @adj_list[vet1].delete(vet2)
    @adj_list[vet2].delete(vet1)
  end

  ### 頂点を追加する ###
  def add_vertex(vet)
    return if @adj_list.include?(vet)

    # 隣接リストに新しい連結リストを追加する
    @adj_list[vet] = []
  end

  ### 頂点を削除する ###
  def remove_vertex(vet)
    raise ArgumentError unless @adj_list.include?(vet)

    # 隣接リストから頂点 vet に対応する連結リストを削除する
    @adj_list.delete(vet)
    # 他の頂点の連結リストを走査し、vet を含むすべての辺を削除する
    for vertex in @adj_list
      @adj_list[vertex.first].delete(vet) if @adj_list[vertex.first].include?(vet)
    end
  end

  ### 隣接リストを表示する ###
  def __print__
    puts '隣接リスト ='
    for vertex in @adj_list
      tmp = @adj_list[vertex.first].map { |v| v.val }
      puts "#{vertex.first.val}: #{tmp},"
    end
  end
end

### 実行用コード ###
if __FILE__ == $0
  # 無向グラフを初期化する
  v = vals_to_vets([1, 3, 2, 5, 4])
  edges = [
    [v[0], v[1]],
    [v[0], v[3]],
    [v[1], v[2]],
    [v[2], v[3]],
    [v[2], v[4]],
    [v[3], v[4]],
  ]
  graph = GraphAdjList.new(edges)
  puts "\n初期化後のグラフ"
  graph.__print__

  # 辺を追加する
  # 頂点 1、2 は v[0]、v[2] に対応する
  graph.add_edge(v[0], v[2])
  puts "\n辺 1-2 を追加した後のグラフ"
  graph.__print__

  # 辺を削除する
  # 頂点 1、3 は v[0]、v[1] に対応する
  graph.remove_edge(v[0], v[1])
  puts "\n辺 1-3 を削除した後のグラフ"
  graph.__print__

  # 頂点を追加する
  v5 = Vertex.new(6)
  graph.add_vertex(v5)
  puts "\n頂点 6 を追加した後のグラフ"
  graph.__print__

  # 頂点を削除する
  # 頂点 3 は v[1] に対応する
  graph.remove_vertex(v[1])
  puts "\n頂点 3 を削除した後のグラフ"
  graph.__print__
end
