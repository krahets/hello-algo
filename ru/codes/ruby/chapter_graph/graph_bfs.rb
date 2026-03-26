=begin
File: graph_bfs.rb
Created Time: 2024-04-25
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require 'set'
require_relative './graph_adjacency_list'
require_relative '../utils/vertex'

# ## обход в ширину ###
def graph_bfs(graph, start_vet)
  # Использовать список смежности для представления графа, чтобы получать все соседние вершины заданной вершины
  # Последовательность обхода вершин
  res = []
  # Хеш-множество для записи уже посещенных вершин
  visited = Set.new([start_vet])
  # Очередь используется для реализации BFS
  que = [start_vet]
  # Начиная с вершины vet, продолжать цикл, пока не будут посещены все вершины
  while que.length > 0
    vet = que.shift # Извлечь из очереди вершину из головы
    res << vet # Записать посещенную вершину
    # Обойти все смежные вершины этой вершины
    for adj_vet in graph.adj_list[vet]
      next if visited.include?(adj_vet) # Пропустить уже посещенную вершину
      que << adj_vet # Помещать в очередь только непосещенные вершины
      visited.add(adj_vet) # Пометить эту вершину как посещенную
    end
  end
  # Вернуть последовательность обхода вершин
  res
end

### Driver Code ###
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
  puts "\nПосле инициализации граф имеет вид"
  graph.__print__

  # Обход в ширину
  res = graph_bfs(graph, v.first)
  puts "\nПоследовательность вершин при обходе в ширину (BFS)"
  p vets_to_vals(res)
end
