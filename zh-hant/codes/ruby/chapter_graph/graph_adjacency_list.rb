=begin
File: graph_adjacency_list.rb
Created Time: 2024-04-25
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/vertex'

### 以鄰接串列實作的無向圖類別 ###
class GraphAdjList
  attr_reader :adj_list
  
  ### 建構式 ###
  def initialize(edges)
    # 鄰接串列，key 是頂點，value 是該頂點的所有相鄰頂點
    @adj_list = {}
    # 加入所有頂點和邊
    for edge in edges
      add_vertex(edge[0])
      add_vertex(edge[1])
      add_edge(edge[0], edge[1])
    end
  end

  ### 取得頂點數量 ###
  def size
    @adj_list.length
  end

  ### 新增邊 ###
  def add_edge(vet1, vet2)
    raise ArgumentError if !@adj_list.include?(vet1) || !@adj_list.include?(vet2) || vet1 == vet2

    @adj_list[vet1] << vet2
    @adj_list[vet2] << vet1
  end

  ### 刪除邊 ###
  def remove_edge(vet1, vet2)
    raise ArgumentError if !@adj_list.include?(vet1) || !@adj_list.include?(vet2) || vet1 == vet2

    # 刪除邊 vet1 - vet2
    @adj_list[vet1].delete(vet2)
    @adj_list[vet2].delete(vet1)
  end

  ### 新增頂點 ###
  def add_vertex(vet)
    return if @adj_list.include?(vet)

    # 在鄰接串列中新增一條鏈結串列
    @adj_list[vet] = []
  end

  ### 刪除頂點 ###
  def remove_vertex(vet)
    raise ArgumentError unless @adj_list.include?(vet)

    # 從鄰接串列中刪除頂點 vet 對應的鏈結串列
    @adj_list.delete(vet)
    # 走訪其他頂點的鏈結串列，刪除所有以 vet 為端點的邊
    for vertex in @adj_list
      @adj_list[vertex.first].delete(vet) if @adj_list[vertex.first].include?(vet)
    end
  end

  ### 印出鄰接串列 ###
  def __print__
    puts '鄰接串列 ='
    for vertex in @adj_list
      tmp = @adj_list[vertex.first].map { |v| v.val }
      puts "#{vertex.first.val}: #{tmp},"
    end
  end
end

### Driver Code ###
if __FILE__ == $0
  # 初始化無向圖
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
  puts "\n初始化後的圖為"
  graph.__print__

  # 新增邊
  # 頂點 1、2 分別是 v[0]、v[2]
  graph.add_edge(v[0], v[2])
  puts "\n新增邊 1-2 後的圖為"
  graph.__print__

  # 刪除邊
  # 頂點 1、3 分別是 v[0]、v[1]
  graph.remove_edge(v[0], v[1])
  puts "\n刪除邊 1-3 後的圖為"
  graph.__print__

  # 新增頂點
  v5 = Vertex.new(6)
  graph.add_vertex(v5)
  puts "\n新增頂點 6 後的圖為"
  graph.__print__

  # 刪除頂點
  # 頂點 3 是 v[1]
  graph.remove_vertex(v[1])
  puts "\n刪除頂點 3 後的圖為"
  graph.__print__
end
