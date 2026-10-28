=begin
File: graph_adjacency_matrix.rb
Created Time: 2024-04-25
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/print_util'

### 인접 행렬로 구현한 무방향 그래프 클래스 ###
class GraphAdjMat
  def initialize(vertices, edges)
    ### 생성자 ###
    # 정점 리스트의 원소는 정점 값을, 인덱스는 정점 인덱스를 나타낸다
    @vertices = []
    # 인접 행렬의 행과 열 인덱스는 정점 인덱스에 해당한다
    @adj_mat = []
    # 정점 추가
    vertices.each { |val| add_vertex(val) }
    # 간선 추가
    # edges의 원소는 정점 인덱스, 즉 vertices 원소의 인덱스를 나타낸다
    edges.each { |e| add_edge(e[0], e[1]) }
  end

  ### 정점 개수 반환 ###
  def size
    @vertices.length
  end

  ### 정점 추가 ###
  def add_vertex(val)
    n = size
    # 정점 리스트에 새 정점의 값을 추가한다
    @vertices << val
    # 인접 행렬에 행 하나를 추가한다
    new_row = Array.new(n, 0)
    @adj_mat << new_row
    # 인접 행렬에 열 하나를 추가한다
    @adj_mat.each { |row| row << 0 }
  end

  ### 정점 삭제 ###
  def remove_vertex(index)
    raise IndexError if index >= size

    # 정점 리스트에서 인덱스 index의 정점을 제거한다
    @vertices.delete_at(index)
    # 인접 행렬에서 인덱스 index의 행을 삭제한다
    @adj_mat.delete_at(index)
    # 인접 행렬에서 인덱스 index의 열을 삭제한다
    @adj_mat.each { |row| row.delete_at(index) }
  end

  ### 간선 추가 ###
  def add_edge(i, j)
    # 매개변수 i, j는 vertices 원소의 인덱스에 해당한다
    # 인덱스가 범위를 벗어나거나 서로 같은 경우를 처리한다
    if i < 0 || j < 0 || i >= size || j >= size || i == j
      raise IndexError
    end
    # 무방향 그래프의 인접 행렬은 주대각선에 대해 대칭이며, (i, j) == (j, i)를 만족한다
    @adj_mat[i][j] = 1
    @adj_mat[j][i] = 1
  end

  ### 간선 삭제 ###
  def remove_edge(i, j)
    # 매개변수 i, j는 vertices 원소의 인덱스에 해당한다
    # 인덱스가 범위를 벗어나거나 서로 같은 경우를 처리한다
    if i < 0 || j < 0 || i >= size || j >= size || i == j
      raise IndexError
    end
    @adj_mat[i][j] = 0
    @adj_mat[j][i] = 0
  end

  ### 인접 행렬 출력 ###
  def __print__
    puts "정점 리스트 = #{@vertices}"
    puts '인접 행렬 ='
    print_matrix(@adj_mat)
  end
end

### 실행 코드 ###
if __FILE__ == $0
  # 무방향 그래프 초기화
  # edges의 원소는 정점 인덱스, 즉 vertices 원소의 인덱스를 나타낸다
  vertices = [1, 3, 2, 5, 4]
  edges = [[0, 1], [0, 3], [1, 2], [2, 3], [2, 4], [3, 4]]
  graph = GraphAdjMat.new(vertices, edges)
  puts "\n초기화한 후의 그래프"
  graph.__print__

  # 간선 추가
  # 정점 1, 2의 인덱스는 각각 0, 2이다
  graph.add_edge(0, 2)
  puts "\n간선 1-2를 추가한 후의 그래프"
  graph.__print__

  # 간선 삭제
  # 정점 1, 3의 인덱스는 각각 0, 1이다
  graph.remove_edge(0, 1)
  puts "\n간선 1-3을 삭제한 후의 그래프"
  graph.__print__

  # 정점 추가
  graph.add_vertex(6)
  puts "\n정점 6을 추가한 후의 그래프"
  graph.__print__

  # 정점 삭제
  # 정점 3의 인덱스는 1이다
  graph.remove_vertex(1)
  puts "\n정점 3을 삭제한 후의 그래프"
  graph.__print__
end
