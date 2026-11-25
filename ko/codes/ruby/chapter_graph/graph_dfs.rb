=begin
File: graph_dfs.rb
Created Time: 2024-04-25
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require 'set'
require_relative './graph_adjacency_list'
require_relative '../utils/vertex'

### 깊이 우선 순회 보조 함수 ###
def dfs(graph, visited, res, vet)
  res << vet # 방문한 정점 기록
  visited.add(vet) # 이 정점을 방문한 것으로 표시
  # 현재 정점에 인접한 모든 정점 순회
  for adj_vet in graph.adj_list[vet]
    next if visited.include?(adj_vet) # 이미 방문한 정점은 건너뜀
    # 인접 정점을 재귀적으로 방문
    dfs(graph, visited, res, adj_vet)
  end
end

### 깊이 우선 순회 ###
def graph_dfs(graph, start_vet)
  # 지정한 정점의 인접 정점을 모두 구할 수 있도록 인접 리스트로 그래프 표현
  # 정점 방문 순서
  res = []
  # 방문한 정점을 기록하는 해시 집합
  visited = Set.new
  dfs(graph, visited, res, start_vet)
  res
end

### 실행 예제 ###
if __FILE__ == $0
  # 무방향 그래프 초기화
  v = vals_to_vets([0, 1, 2, 3, 4, 5, 6])
  edges = [
    [v[0], v[1]],
    [v[0], v[3]],
    [v[1], v[2]],
    [v[2], v[5]],
    [v[4], v[5]],
    [v[5], v[6]],
  ]
  graph = GraphAdjList.new(edges)
  puts "\n초기화한 그래프:"
  graph.__print__

  # 깊이 우선 순회
  res = graph_dfs(graph, v[0])
  puts "\n깊이 우선 순회(DFS)의 정점 방문 순서:"
  p vets_to_vals(res)
end
