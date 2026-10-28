=begin
File: graph_adjacency_list.rb
Created Time: 2024-04-25
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/vertex'

### 인접 리스트로 구현한 무방향 그래프 클래스 ###
class GraphAdjList
  attr_reader :adj_list
  
  ### 생성자 ###
  def initialize(edges)
    # 인접 리스트의 key: 정점, value: 해당 정점의 모든 인접 정점
    @adj_list = {}
    # 모든 정점과 간선을 추가한다
    for edge in edges
      add_vertex(edge[0])
      add_vertex(edge[1])
      add_edge(edge[0], edge[1])
    end
  end

  ### 정점 개수 반환 ###
  def size
    @adj_list.length
  end

  ### 간선 추가 ###
  def add_edge(vet1, vet2)
    raise ArgumentError if !@adj_list.include?(vet1) || !@adj_list.include?(vet2)

    @adj_list[vet1] << vet2
    @adj_list[vet2] << vet1
  end

  ### 간선 삭제 ###
  def remove_edge(vet1, vet2)
    raise ArgumentError if !@adj_list.include?(vet1) || !@adj_list.include?(vet2)

    # 간선 vet1 - vet2를 삭제한다
    @adj_list[vet1].delete(vet2)
    @adj_list[vet2].delete(vet1)
  end

  ### 정점 추가 ###
  def add_vertex(vet)
    return if @adj_list.include?(vet)

    # 인접 리스트에 새 연결 리스트를 추가한다
    @adj_list[vet] = []
  end

  ### 정점 삭제 ###
  def remove_vertex(vet)
    raise ArgumentError unless @adj_list.include?(vet)

    # 인접 리스트에서 정점 vet에 해당하는 연결 리스트를 삭제한다
    @adj_list.delete(vet)
    # 다른 정점의 연결 리스트를 순회하여 vet를 포함하는 모든 간선을 삭제한다
    for vertex in @adj_list
      @adj_list[vertex.first].delete(vet) if @adj_list[vertex.first].include?(vet)
    end
  end

  ### 인접 리스트 출력 ###
  def __print__
    puts '인접 리스트 ='
    for vertex in @adj_list
      tmp = @adj_list[vertex.first].map { |v| v.val }
      puts "#{vertex.first.val}: #{tmp},"
    end
  end
end

### 실행 코드 ###
if __FILE__ == $0
  # 무방향 그래프 초기화
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
  puts "\n초기화한 후의 그래프"
  graph.__print__

  # 간선 추가
  # 정점 1, 2는 각각 v[0], v[2]이다
  graph.add_edge(v[0], v[2])
  puts "\n간선 1-2를 추가한 후의 그래프"
  graph.__print__

  # 간선 삭제
  # 정점 1, 3은 각각 v[0], v[1]이다
  graph.remove_edge(v[0], v[1])
  puts "\n간선 1-3을 삭제한 후의 그래프"
  graph.__print__

  # 정점 추가
  v5 = Vertex.new(6)
  graph.add_vertex(v5)
  puts "\n정점 6을 추가한 후의 그래프"
  graph.__print__

  # 정점 삭제
  # 정점 3은 v[1]이다
  graph.remove_vertex(v[1])
  puts "\n정점 3을 삭제한 후의 그래프"
  graph.__print__
end
