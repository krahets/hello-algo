=begin
File: graph_adjacency_matrix.rb
Created Time: 2024-04-25
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/print_util'

### 基于邻接矩阵实现的无向图类 ###
class GraphAdjMat
  def initialize(vertices, edges)
    ### 构造方法 ###
    # 顶点列表，元素代表“顶点值”，索引代表“顶点索引”
    @vertices = []
    # 邻接矩阵，行列索引对应“顶点索引”
    @adj_mat = []
    # 添加顶点
    vertices.each { |val| add_vertex(val) }
    # 添加边
    # 请注意，edges 元素代表顶点索引，即对应 vertices 元素索引
    edges.each { |e| add_edge(e[0], e[1]) }
  end

  ### 获取顶点数量 ###
  def size
    @vertices.length
  end

  ### 添加顶点 ###
  def add_vertex(val)
    n = size
    # 向顶点列表中添加新顶点的值
    @vertices << val
    # 在邻接矩阵中添加一行
    new_row = Array.new(n, 0)
    @adj_mat << new_row
    # 在邻接矩阵中添加一列
    @adj_mat.each { |row| row << 0 }
  end

  ### 删除顶点 ###
  def remove_vertex(index)
    raise IndexError if index >= size

    # 在顶点列表中移除索引 index 的顶点
    @vertices.delete_at(index)
    # 在邻接矩阵中删除索引 index 的行
    @adj_mat.delete_at(index)
    # 在邻接矩阵中删除索引 index 的列
    @adj_mat.each { |row| row.delete_at(index) }
  end

  ### 添加边 ###
  def add_edge(i, j)
    # 参数 i, j 对应 vertices 元素索引
    # 索引越界与相等处理
    if i < 0 || j < 0 || i >= size || j >= size || i == j
      raise IndexError
    end
    # 在无向图中，邻接矩阵关于主对角线对称，即满足 (i, j) == (j, i)
    @adj_mat[i][j] = 1
    @adj_mat[j][i] = 1
  end

  ### 删除边 ###
  def remove_edge(i, j)
    # 参数 i, j 对应 vertices 元素索引
    # 索引越界与相等处理
    if i < 0 || j < 0 || i >= size || j >= size || i == j
      raise IndexError
    end
    @adj_mat[i][j] = 0
    @adj_mat[j][i] = 0
  end

  ### 打印邻接矩阵 ###
  def __print__
    puts "顶点列表 = #{@vertices}"
    puts '邻接矩阵 ='
    print_matrix(@adj_mat)
  end
end

### Driver Code ###
if __FILE__ == $0
  # 初始化无向图
  # 请注意，edges 元素代表顶点索引，即对应 vertices 元素索引
  vertices = [1, 3, 2, 5, 4]
  edges = [[0, 1], [0, 3], [1, 2], [2, 3], [2, 4], [3, 4]]
  graph = GraphAdjMat.new(vertices, edges)
  puts "\n初始化后，图为"
  graph.__print__

  # 添加边
  # 顶点 1, 2 的索引分别为 0, 2
  graph.add_edge(0, 2)
  puts "\n添加边 1-2 后，图为"
  graph.__print__

  # 删除边
  # 定点 1, 3 的索引分别为 0, 1
  graph.remove_edge(0, 1)
  puts "\n删除边 1-3 后，图为"
  graph.__print__

  # 添加顶点
  graph.add_vertex(6)
  puts "\n添加顶点 6 后，图为"
  graph.__print__

  # 删除顶点
  # 顶点 3 的索引为 1
  graph.remove_vertex(1)
  puts "\n删除顶点 3 后，图为"
  graph.__print__
end
