=begin
File: graph_bfs.rb
Created Time: 2024-04-25
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require 'set'
require_relative './graph_adjacency_list'
require_relative '../utils/vertex'

### Обход в ширину ###
def graph_bfs(graph, start_vet)
  # Список смежности позволяет получить всех соседей заданной вершины
  # Порядок обхода вершин
  res = []
  # Хеш-множество посещённых вершин
  visited = Set.new([start_vet])
  # Очередь для обхода BFS
  que = [start_vet]
  # Начать с вершины vet и повторять, пока не будут посещены все вершины
  while que.length > 0
    vet = que.shift # Извлечь первую вершину из очереди
    res << vet # Записать посещённую вершину
    # Перебрать всех соседей этой вершины
    for adj_vet in graph.adj_list[vet]
      next if visited.include?(adj_vet) # Пропустить посещённые вершины
      que << adj_vet # Добавить в очередь только непосещённые вершины
      visited.add(adj_vet) # Отметить вершину как посещённую
    end
  end
  # Вернуть порядок обхода вершин
  res
end

### Пример использования ###
if __FILE__ == $0
  # Инициализировать неориентированный граф
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
  puts "\nГраф после инициализации:"
  graph.__print__

  # Обход в ширину
  res = graph_bfs(graph, v.first)
  puts "\nПорядок обхода вершин в ширину (BFS):"
  p vets_to_vals(res)
end
