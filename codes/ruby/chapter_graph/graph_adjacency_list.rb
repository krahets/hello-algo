=begin
File: graph_adjacency_list.rb
Created Time: 2024-04-25
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/vertex'

### 基于邻接表实现的无向图类 ###
class GraphAdjList
  attr_reader :adj_list
  
  ### 构造方法 ###
  def initialize(edges)
    # 邻接表，key：顶点，value：该顶点的所有邻接顶点
    @adj_list = {}
    # 添加所有顶点和边
    for edge in edges
      add_vertex(edge[0])
      add_vertex(edge[1])
      add_edge(edge[0], edge[1])
    end
  end

  ### 获取顶点数量 ###
  def size
    @adj_list.length
  end

  ### 添加边 ###
  def add_edge(vet1, vet2)
    raise ArgumentError if !@adj_list.include?(vet1) || !@adj_list.include?(vet2)

    @adj_list[vet1] << vet2
    @adj_list[vet2] << vet1
  end

  ### 删除边 ###
  def remove_edge(vet1, vet2)
    raise ArgumentError if !@adj_list.include?(vet1) || !@adj_list.include?(vet2)

    # 删除边 vet1 - vet2
    @adj_list[vet1].delete(vet2)
    @adj_list[vet2].delete(vet1)
  end

  ### 添加顶点 ###
  def add_vertex(vet)
    return if @adj_list.include?(vet)

    # 在邻接表中添加一个新链表
    @adj_list[vet] = []
  end

  ### 删除顶点 ###
  def remove_vertex(vet)
    raise ArgumentError unless @adj_list.include?(vet)

    # 在邻接表中删除顶点 vet 对应的链表
    @adj_list.delete(vet)
    # 遍历其他顶点的链表，删除所有包含 vet 的边
    for vertex in @adj_list
      @adj_list[vertex.first].delete(vet) if @adj_list[vertex.first].include?(vet)
    end
  end

  ### 打印邻接表 ###
  def __print__
    puts '邻接表 ='
    for vertex in @adj_list
      tmp = @adj_list[vertex.first].map { |v| v.val }
      puts "#{vertex.first.val}: #{tmp},"
    end
  end
end

### Driver Code ###
if __FILE__ == $0
  # 初始化无向图
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
  puts "\n初始化后，图为"
  graph.__print__

  # 添加边
  # 顶点 1，2 即 v[0]，v[2]
  graph.add_edge(v[0], v[2])
  puts "\n添加边 1-2 后，图为"
  graph.__print__

  # 删除边
  # 顶点 1，3 即 v[0]，v[1]
  graph.remove_edge(v[0], v[1])
  puts "\n删除边 1-3 后，图为"
  graph.__print__

  # 添加顶点
  v5 = Vertex.new(6)
  graph.add_vertex(v5)
  puts "\n添加顶点 6 后，图为"
  graph.__print__

  # 删除顶点
  # 顶点 3 即 v[1]
  graph.remove_vertex(v[1])
  puts "\n删除顶点 3 后，图为"
  graph.__print__
end
