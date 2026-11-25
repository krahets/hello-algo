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
    # 정점 리스트의 원소는 정점 값을, 인덱스는 정점 인덱스를 나타냄
    @vertices = []
    # 인접 행렬의 행과 열 인덱스는 정점 인덱스에 해당
    @adj_mat = []
    # 정점 추가
    vertices.each { |val| add_vertex(val) }
    # 간선 추가
    # edges의 원소는 정점 인덱스, 즉 vertices의 원소 인덱스를 나타냄
    edges.each { |e| add_edge(e[0], e[1]) }
  end

  ### 정점 수 구하기 ###
  def size
    @vertices.length
  end

  ### 정점 추가 ###
  def add_vertex(val)
    n = size
    # 정점 리스트에 새 정점의 값 추가
    @vertices << val
    # 인접 행렬에 행 하나 추가
    new_row = Array.new(n, 0)
    @adj_mat << new_row
    # 인접 행렬에 열 하나 추가
    @adj_mat.each { |row| row << 0 }
  end

  ### 정점 삭제 ###
  def remove_vertex(index)
    raise IndexError if index >= size

    # 정점 리스트에서 인덱스가 index인 정점 삭제
    @vertices.delete_at(index)
    # 인접 행렬에서 인덱스가 index인 행 삭제
    @adj_mat.delete_at(index)
    # 인접 행렬에서 인덱스가 index인 열 삭제
    @adj_mat.each { |row| row.delete_at(index) }
  end

  ### 간선 추가 ###
  def add_edge(i, j)
    # 매개변수 i, j는 vertices의 원소 인덱스
    # 인덱스가 범위를 벗어나거나 서로 같은 경우 처리
    if i < 0 || j < 0 || i >= size || j >= size || i == j
      raise IndexError
    end
    # 무방향 그래프의 인접 행렬은 주대각선을 기준으로 대칭이므로 (i, j) == (j, i)
    @adj_mat[i][j] = 1
    @adj_mat[j][i] = 1
  end

  ### 간선 삭제 ###
  def remove_edge(i, j)
    # 매개변수 i, j는 vertices의 원소 인덱스
    # 인덱스가 범위를 벗어나거나 서로 같은 경우 처리
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

### 실행 예제 ###
if __FILE__ == $0
  # 무방향 그래프 초기화
  # edges의 원소는 정점 인덱스, 즉 vertices의 원소 인덱스를 나타냄
  vertices = [1, 3, 2, 5, 4]
  edges = [[0, 1], [0, 3], [1, 2], [2, 3], [2, 4], [3, 4]]
  graph = GraphAdjMat.new(vertices, edges)
  puts "\n초기화한 그래프:"
  graph.__print__

  # 간선 추가
  # 정점 1과 2의 인덱스는 각각 0과 2
  graph.add_edge(0, 2)
  puts "\n간선 1-2를 추가한 그래프:"
  graph.__print__

  # 간선 삭제
  # 정점 1과 3의 인덱스는 각각 0과 1
  graph.remove_edge(0, 1)
  puts "\n간선 1-3을 삭제한 그래프:"
  graph.__print__

  # 정점 추가
  graph.add_vertex(6)
  puts "\n정점 6을 추가한 그래프:"
  graph.__print__

  # 정점 삭제
  # 정점 3의 인덱스는 1
  graph.remove_vertex(1)
  puts "\n정점 3을 삭제한 그래프:"
  graph.__print__
end
