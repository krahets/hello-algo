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
  # 지정한 정점의 인접 정점을 모두 구할 수 있도록 인접 리스트로 그래프 표현
  # 정점 방문 순서
  res = []
  # 방문한 정점을 기록하는 해시 집합
  visited = Set.new([start_vet])
  # BFS 구현에 사용하는 큐
  que = [start_vet]
  # 정점 vet에서 시작해 모든 정점을 방문할 때까지 반복
  while que.length > 0
    vet = que.shift # 큐의 맨 앞 정점을 꺼냄
    res << vet # 방문한 정점 기록
    # 현재 정점에 인접한 모든 정점 순회
    for adj_vet in graph.adj_list[vet]
      next if visited.include?(adj_vet) # 이미 방문한 정점은 건너뜀
      que << adj_vet # 아직 방문하지 않은 정점만 큐에 삽입
      visited.add(adj_vet) # 이 정점을 방문한 것으로 표시
    end
  end
  # 정점 방문 순서 반환
  res
end

### 실행 예제 ###
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
  puts "\n초기화한 그래프:"
  graph.__print__

  # 너비 우선 순회
  res = graph_bfs(graph, v.first)
  puts "\n너비 우선 순회(BFS)의 정점 방문 순서:"
  p vets_to_vals(res)
end
