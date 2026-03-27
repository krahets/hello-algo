=begin
File: graph_dfs.rb
Created Time: 2024-04-25
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require 'set'
require_relative './graph_adjacency_list'
require_relative '../utils/vertex'

# ## Вспомогательная функция обхода в глубину ###
def dfs(graph, visited, res, vet)
  res << vet # Отметить посещенную вершину
  visited.add(vet) # Отметить эту вершину как посещенную
  # Обойти все смежные вершины данной вершины
  for adj_vet in graph.adj_list[vet]
    next if visited.include?(adj_vet) # Пропустить уже посещенную вершину
    # Рекурсивно обходить смежные вершины
    dfs(graph, visited, res, adj_vet)
  end
end

# ## Обход в глубину ###
def graph_dfs(graph, start_vet)
  # Использовать список смежности для представления графа, чтобы получать все смежные вершины заданной вершины
  # Последовательность обхода вершин
  res = []
  # Хеш-множество для хранения уже посещенных вершин
  visited = Set.new
  dfs(graph, visited, res, start_vet)
  res
end

### Driver Code ###
if __FILE__ == $0
  # Инициализация неориентированного графа
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
  puts "\nГраф после инициализации"
  graph.__print__

  # Обход в глубину
  res = graph_dfs(graph, v[0])
  puts "\nПоследовательность вершин при обходе в глубину (DFS)"
  p vets_to_vals(res)
end
