=begin
File: graph_dfs.rb
Created Time: 2024-04-25
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require 'set'
require_relative './graph_adjacency_list'
require_relative '../utils/vertex'

### Вспомогательная функция обхода в глубину ###
def dfs(graph, visited, res, vet)
  res << vet # Записать посещённую вершину
  visited.add(vet) # Отметить вершину как посещённую
  # Перебрать всех соседей этой вершины
  for adj_vet in graph.adj_list[vet]
    next if visited.include?(adj_vet) # Пропустить посещённые вершины
    # Рекурсивно посетить соседнюю вершину
    dfs(graph, visited, res, adj_vet)
  end
end

### Обход в глубину ###
def graph_dfs(graph, start_vet)
  # Список смежности позволяет получить всех соседей заданной вершины
  # Порядок обхода вершин
  res = []
  # Хеш-множество посещённых вершин
  visited = Set.new
  dfs(graph, visited, res, start_vet)
  res
end

### Пример использования ###
if __FILE__ == $0
  # Инициализировать неориентированный граф
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
  puts "\nГраф после инициализации:"
  graph.__print__

  # Обход в глубину
  res = graph_dfs(graph, v[0])
  puts "\nПорядок обхода вершин в глубину (DFS):"
  p vets_to_vals(res)
end
