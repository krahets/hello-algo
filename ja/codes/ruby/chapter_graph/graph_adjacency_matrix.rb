=begin
File: graph_adjacency_matrix.rb
Created Time: 2024-04-25
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/print_util'

### 隣接行列で実装した無向グラフクラス ###
class GraphAdjMat
  def initialize(vertices, edges)
    ### コンストラクタ ###
    # 頂点リスト。要素は「頂点の値」、インデックスは「頂点のインデックス」を表す
    @vertices = []
    # 隣接行列。行と列のインデックスは「頂点のインデックス」に対応する
    @adj_mat = []
    # 頂点を追加する
    vertices.each { |val| add_vertex(val) }
    # 辺を追加する
    # edges の要素は頂点のインデックス、すなわち vertices の要素のインデックスを表すことに注意
    edges.each { |e| add_edge(e[0], e[1]) }
  end

  ### 頂点数を取得する ###
  def size
    @vertices.length
  end

  ### 頂点を追加する ###
  def add_vertex(val)
    n = size
    # 頂点リストに新しい頂点の値を追加する
    @vertices << val
    # 隣接行列に 1 行追加する
    new_row = Array.new(n, 0)
    @adj_mat << new_row
    # 隣接行列に 1 列追加する
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
    # 引数 i, j は vertices の要素のインデックスに対応する
    # 添字が範囲外または互いに等しい場合の処理
    if i < 0 || j < 0 || i >= size || j >= size || i == j
      raise IndexError
    end
    # 無向グラフの隣接行列は主対角線に関して対称であり、(i, j) == (j, i) を満たす
    @adj_mat[i][j] = 1
    @adj_mat[j][i] = 1
  end

  ### 辺を削除する ###
  def remove_edge(i, j)
    # 引数 i, j は vertices の要素のインデックスに対応する
    # 添字が範囲外または互いに等しい場合の処理
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

### 実行用コード ###
if __FILE__ == $0
  # 無向グラフを初期化する
  # edges の要素は頂点のインデックス、すなわち vertices の要素のインデックスを表すことに注意
  vertices = [1, 3, 2, 5, 4]
  edges = [[0, 1], [0, 3], [1, 2], [2, 3], [2, 4], [3, 4]]
  graph = GraphAdjMat.new(vertices, edges)
  puts "\n初期化後のグラフ"
  graph.__print__

  # 辺を追加する
  # 頂点 1, 2 のインデックスはそれぞれ 0, 2
  graph.add_edge(0, 2)
  puts "\n辺 1-2 を追加した後のグラフ"
  graph.__print__

  # 辺を削除する
  # 頂点 1, 3 のインデックスはそれぞれ 0, 1
  graph.remove_edge(0, 1)
  puts "\n辺 1-3 を削除した後のグラフ"
  graph.__print__

  # 頂点を追加する
  graph.add_vertex(6)
  puts "\n頂点 6 を追加した後のグラフ"
  graph.__print__

  # 頂点を削除する
  # 頂点 3 のインデックスは 1
  graph.remove_vertex(1)
  puts "\n頂点 3 を削除した後のグラフ"
  graph.__print__
end
