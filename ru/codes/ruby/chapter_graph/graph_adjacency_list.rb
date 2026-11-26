=begin
File: graph_adjacency_list.rb
Created Time: 2024-04-25
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/vertex'

### Неориентированный граф на списках смежности ###
class GraphAdjList
  attr_reader :adj_list
  
  ### Конструктор ###
  def initialize(edges)
    # Список смежности: ключ — вершина, значение — все её соседи
    @adj_list = {}
    # Добавить все вершины и рёбра
    for edge in edges
      add_vertex(edge[0])
      add_vertex(edge[1])
      add_edge(edge[0], edge[1])
    end
  end

  ### Получить число вершин ###
  def size
    @adj_list.length
  end

  ### Добавить ребро ###
  def add_edge(vet1, vet2)
    raise ArgumentError if !@adj_list.include?(vet1) || !@adj_list.include?(vet2) || vet1 == vet2

    @adj_list[vet1] << vet2
    @adj_list[vet2] << vet1
  end

  ### Удалить ребро ###
  def remove_edge(vet1, vet2)
    raise ArgumentError if !@adj_list.include?(vet1) || !@adj_list.include?(vet2) || vet1 == vet2

    # Удалить ребро vet1 — vet2
    @adj_list[vet1].delete(vet2)
    @adj_list[vet2].delete(vet1)
  end

  ### Добавить вершину ###
  def add_vertex(vet)
    return if @adj_list.include?(vet)

    # Добавить новый связный список в список смежности
    @adj_list[vet] = []
  end

  ### Удалить вершину ###
  def remove_vertex(vet)
    raise ArgumentError unless @adj_list.include?(vet)

    # Удалить из списка смежности список вершины vet
    @adj_list.delete(vet)
    # Обойти списки остальных вершин и удалить все рёбра, инцидентные vet
    for vertex in @adj_list
      @adj_list[vertex.first].delete(vet) if @adj_list[vertex.first].include?(vet)
    end
  end

  ### Вывести список смежности ###
  def __print__
    puts 'Список смежности ='
    for vertex in @adj_list
      tmp = @adj_list[vertex.first].map { |v| v.val }
      puts "#{vertex.first.val}: #{tmp},"
    end
  end
end

### Пример использования ###
if __FILE__ == $0
  # Инициализировать неориентированный граф
  v = vals_to_vets([1, 3, 2, 5, 4])
  edges = [
    [v[0], v[1]],
    [v[0], v[3]],
    [v[1], v[2]],
    [v[2], v[3]],
    [v[2], v[4]],
    [v[3], v[4]],
  ]
  graph = GraphAdjList.new(edges)
  puts "\nГраф после инициализации:"
  graph.__print__

  # Добавить ребро
  # Вершинам 1 и 2 соответствуют v[0] и v[2]
  graph.add_edge(v[0], v[2])
  puts "\nГраф после добавления ребра 1–2:"
  graph.__print__

  # Удалить ребро
  # Вершинам 1 и 3 соответствуют v[0] и v[1]
  graph.remove_edge(v[0], v[1])
  puts "\nГраф после удаления ребра 1–3:"
  graph.__print__

  # Добавить вершину
  v5 = Vertex.new(6)
  graph.add_vertex(v5)
  puts "\nГраф после добавления вершины 6:"
  graph.__print__

  # Удалить вершину
  # Вершине 3 соответствует v[1]
  graph.remove_vertex(v[1])
  puts "\nГраф после удаления вершины 3:"
  graph.__print__
end
