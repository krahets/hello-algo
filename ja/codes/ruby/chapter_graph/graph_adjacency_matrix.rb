=begin
File: graph_adjacency_matrix.rb
Created Time: 2024-04-25
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/print_util'

### 隣接行列で無向グラフを表すクラス ###
class GraphAdjMat
  def initialize(vertices, edges)
    ### コンストラクタ ###
    # 頂点リスト。要素は頂点の値を、インデックスは頂点のインデックスを表す
    @vertices = []
    # 隣接行列。行と列のインデックスは頂点のインデックスに対応する
    @adj_mat = []
    # 頂点を追加する
    vertices.each { |val| add_vertex(val) }
    # 辺を追加する
    # edges の各要素が示すのは頂点のインデックス、すなわち vertices の要素のインデックス
    edges.each { |e| add_edge(e[0], e[1]) }
  end

  ### 頂点数を取得する ###
  def size
    @vertices.length
  end

  ### 頂点を追加する ###
  def add_vertex(val)
    n = size
    # 新しい頂点の値を頂点リストに追加する
    @vertices << val
    # 隣接行列に行を 1 つ追加する
    new_row = Array.new(n, 0)
    @adj_mat << new_row
    # 隣接行列に列を 1 つ追加する
    @adj_mat.each { |row| row << 0 }
  end

  ### 頂点を削除する ###
  def remove_vertex(index)
    raise IndexError if index >= size

    # 頂点リストからインデックス index の頂点を削除する
    @vertices.delete_at(index)
    # 隣接行列からインデックス index の行を削除する
    @adj_mat.delete_at(index)
    # 隣接行列からインデックス index の列を削除する
    @adj_mat.each { |row| row.delete_at(index) }
  end

  ### 辺を追加する ###
  def add_edge(i, j)
    # 引数 i と j は vertices の要素のインデックス
    # インデックスが範囲外または同じ値の場合の処理
    if i < 0 || j < 0 || i >= size || j >= size || i == j
      raise IndexError
    end
    # 無向グラフの隣接行列は主対角線に関して対称で、(i, j) == (j, i) を満たす
    @adj_mat[i][j] = 1
    @adj_mat[j][i] = 1
  end

  ### 辺を削除する ###
  def remove_edge(i, j)
    # 引数 i と j は vertices の要素のインデックス
    # インデックスが範囲外または同じ値の場合の処理
    if i < 0 || j < 0 || i >= size || j >= size || i == j
      raise IndexError
    end
    @adj_mat[i][j] = 0
    @adj_mat[j][i] = 0
  end

  ### 隣接行列を表示する ###
  def __print__
    puts "頂点リスト = #{@vertices}"
    puts '隣接行列 ='
    print_matrix(@adj_mat)
  end
end

### 実行例 ###
if __FILE__ == $0
  # 無向グラフを初期化する
  # edges の各要素が示すのは頂点のインデックス、すなわち vertices の要素のインデックス
  vertices = [1, 3, 2, 5, 4]
  edges = [[0, 1], [0, 3], [1, 2], [2, 3], [2, 4], [3, 4]]
  graph = GraphAdjMat.new(vertices, edges)
  puts "\n初期化後のグラフ："
  graph.__print__

  # 辺を追加する
  # 頂点 1 と 2 のインデックスはそれぞれ 0 と 2
  graph.add_edge(0, 2)
  puts "\n辺 1-2 を追加した後のグラフ："
  graph.__print__

  # 辺を削除する
  # 頂点 1 と 3 のインデックスはそれぞれ 0 と 1
  graph.remove_edge(0, 1)
  puts "\n辺 1-3 を削除した後のグラフ："
  graph.__print__

  # 頂点を追加する
  graph.add_vertex(6)
  puts "\n頂点 6 を追加した後のグラフ："
  graph.__print__

  # 頂点を削除する
  # 頂点 3 のインデックスは 1
  graph.remove_vertex(1)
  puts "\n頂点 3 を削除した後のグラフ："
  graph.__print__
end
