=begin
File: graph_adjacency_matrix.rb
Created Time: 2024-04-25
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/print_util'

### 基於鄰接矩陣實現的無向圖類別 ###
class GraphAdjMat
  def initialize(vertices, edges)
    ### 建構子 ###
    # 頂點串列，元素代表“頂點值”，索引代表“頂點索引”
    @vertices = []
    # 鄰接矩陣，行列索引對應“頂點索引”
    @adj_mat = []
    # 新增頂點
    vertices.each { |val| add_vertex(val) }
    # 新增邊
    # 請注意，edges 元素代表頂點索引，即對應 vertices 元素索引
    edges.each { |e| add_edge(e[0], e[1]) }
  end

  ### 獲取頂點數量 ###
  def size
    @vertices.length
  end

  ### 新增頂點 ###
  def add_vertex(val)
    n = size
    # 向頂點串列中新增新頂點的值
    @vertices << val
    # 在鄰接矩陣中新增一行
    new_row = Array.new(n, 0)
    @adj_mat << new_row
    # 在鄰接矩陣中新增一列
    @adj_mat.each { |row| row << 0 }
  end

  ### 刪除頂點 ###
  def remove_vertex(index)
    raise IndexError if index >= size

    # 在頂點串列中移除索引 index 的頂點
    @vertices.delete_at(index)
    # 在鄰接矩陣中刪除索引 index 的行
    @adj_mat.delete_at(index)
    # 在鄰接矩陣中刪除索引 index 的列
    @adj_mat.each { |row| row.delete_at(index) }
  end

  ### 新增邊 ###
  def add_edge(i, j)
    # 參數 i, j 對應 vertices 元素索引
    # 索引越界與相等處理
    if i < 0 || j < 0 || i >= size || j >= size || i == j
      raise IndexError
    end
    # 在無向圖中，鄰接矩陣關於主對角線對稱，即滿足 (i, j) == (j, i)
    @adj_mat[i][j] = 1
    @adj_mat[j][i] = 1
  end

  ### 刪除邊 ###
  def remove_edge(i, j)
    # 參數 i, j 對應 vertices 元素索引
    # 索引越界與相等處理
    if i < 0 || j < 0 || i >= size || j >= size || i == j
      raise IndexError
    end
    @adj_mat[i][j] = 0
    @adj_mat[j][i] = 0
  end

  ### 列印鄰接矩陣 ###
  def __print__
    puts "頂點串列 = #{@vertices}"
    puts '鄰接矩陣 ='
    print_matrix(@adj_mat)
  end
end

### Driver Code ###
if __FILE__ == $0
  # 初始化無向圖
  # 請注意，edges 元素代表頂點索引，即對應 vertices 元素索引
  vertices = [1, 3, 2, 5, 4]
  edges = [[0, 1], [0, 3], [1, 2], [2, 3], [2, 4], [3, 4]]
  graph = GraphAdjMat.new(vertices, edges)
  puts "\n初始化後，圖為"
  graph.__print__

  # 新增邊
  # 頂點 1, 2 的索引分別為 0, 2
  graph.add_edge(0, 2)
  puts "\n新增邊 1-2 後，圖為"
  graph.__print__

  # 刪除邊
  # 定點 1, 3 的索引分別為 0, 1
  graph.remove_edge(0, 1)
  puts "\n刪除邊 1-3 後，圖為"
  graph.__print__

  # 新增頂點
  graph.add_vertex(6)
  puts "\n新增頂點 6 後，圖為"
  graph.__print__

  # 刪除頂點
  # 頂點 3 的索引為 1
  graph.remove_vertex(1)
  puts "\n刪除頂點 3 後，圖為"
  graph.__print__
end
