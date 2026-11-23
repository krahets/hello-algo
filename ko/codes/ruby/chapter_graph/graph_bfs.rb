=begin
File: graph_bfs.rb
Created Time: 2024-04-25
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require 'set'
require_relative './graph_adjacency_list'
require_relative '../utils/vertex'

### 너비 우선 순회 ###
def graph_bfs(graph, start_vet)
  # 지정한 정점의 모든 인접 정점을 얻기 쉽도록 그래프를 인접 리스트로 표현한다
  # 정점 순회 순서
  res = []
  # 방문한 정점을 기록하는 해시 집합
  visited = Set.new([start_vet])
  # 큐를 사용하여 BFS를 구현한다
  que = [start_vet]
  # 정점 vet에서 시작하여 모든 정점을 방문할 때까지 반복한다
  while que.length > 0
    vet = que.shift # 큐 맨 앞의 정점을 꺼낸다
    res << vet # 방문한 정점을 기록한다
    # 해당 정점의 모든 인접 정점을 순회한다
    for adj_vet in graph.adj_list[vet]
      next if visited.include?(adj_vet) # 이미 방문한 정점은 건너뛴다
      que << adj_vet # 방문하지 않은 정점만 큐에 삽입한다
      visited.add(adj_vet) # 해당 정점을 방문했다고 표시한다
    end
  end
  # 정점 순회 순서를 반환한다
  res
end

### 실행 코드 ###
if __FILE__ == $0
  # 무방향 그래프 초기화
  v = vals_to_vets([0, 1, 2, 3, 4, 5, 6, 7, 8, 9])
  edges = [
    [v[0], v[1]],
    [v[0], v[3]],
    [v[1], v[2]],
    [v[1], v[4]],
    [v[2], v[5]],
    [v[3], v[4]],
    [v[3], v[6]],
    [v[4], v[5]],
    [v[4], v[7]],
    [v[5], v[8]],
    [v[6], v[7]],
    [v[7], v[8]],
  ]
  graph = GraphAdjList.new(edges)
  puts "\n초기화한 후의 그래프"
  graph.__print__

  # 너비 우선 순회
  res = graph_bfs(graph, v.first)
  puts "\n너비 우선 순회(BFS)의 정점 순서"
  p vets_to_vals(res)
end
