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
  res << vet # 방문한 정점을 기록한다
  visited.add(vet) # 해당 정점을 방문했다고 표시한다
  # 해당 정점의 모든 인접 정점을 순회한다
  for adj_vet in graph.adj_list[vet]
    next if visited.include?(adj_vet) # 이미 방문한 정점은 건너뛴다
    # 인접 정점을 재귀적으로 방문한다
    dfs(graph, visited, res, adj_vet)
  end
end

### 깊이 우선 순회 ###
def graph_dfs(graph, start_vet)
  # 지정한 정점의 모든 인접 정점을 얻기 쉽도록 그래프를 인접 리스트로 표현한다
  # 정점 순회 순서
  res = []
  # 방문한 정점을 기록하는 해시 집합
  visited = Set.new
  dfs(graph, visited, res, start_vet)
  res
end

### 실행 코드 ###
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
  puts "\n초기화한 후의 그래프"
  graph.__print__

  # 깊이 우선 순회
  res = graph_dfs(graph, v[0])
  puts "\n깊이 우선 순회(DFS)의 정점 순서"
  p vets_to_vals(res)
end
