=begin
File: graph_adjacency_list.rb
Created Time: 2024-04-25
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/vertex'

# ## Класс неориентированного графа на основе списка смежности ###
class GraphAdjList
  attr_reader :adj_list
  
  # ## Конструктор ###
  def initialize(edges)
    # Список смежности, key: вершина, value: все смежные с ней вершины
    @adj_list = {}
    # Добавить все вершины и ребра
    for edge in edges
      add_vertex(edge[0])
      add_vertex(edge[1])
      add_edge(edge[0], edge[1])
    end
  end

  # ## Получить количество вершин ###
  def size
    @adj_list.length
  end

  # ## Добавить ребро ###
  def add_edge(vet1, vet2)
    raise ArgumentError if !@adj_list.include?(vet1) || !@adj_list.include?(vet2)

    @adj_list[vet1] << vet2
    @adj_list[vet2] << vet1
  end

  # ## Удалить ребро ###
  def remove_edge(vet1, vet2)
    raise ArgumentError if !@adj_list.include?(vet1) || !@adj_list.include?(vet2)

    # Удалить ребро vet1 - vet2
    @adj_list[vet1].delete(vet2)
    @adj_list[vet2].delete(vet1)
  end

  # ## Добавить вершину ###
  def add_vertex(vet)
    return if @adj_list.include?(vet)

    # Добавить новый связный список в список смежности
    @adj_list[vet] = []
  end

  # ## Удалить вершину ###
  def remove_vertex(vet)
    raise ArgumentError unless @adj_list.include?(vet)

    # Удалить из списка смежности связный список, соответствующий вершине vet
    @adj_list.delete(vet)
    # Обойти списки других вершин и удалить все ребра, содержащие vet
    for vertex in @adj_list
      @adj_list[vertex.first].delete(vet) if @adj_list[vertex.first].include?(vet)
    end
  end

  # ## Вывести список смежности ###
  def __print__
    puts 'Список смежности ='
    for vertex in @adj_list
      tmp = @adj_list[vertex.first].map { |v| v.val }
      puts "#{vertex.first.val}: #{tmp},"
    end
  end
end

### Driver Code ###
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
  puts "\nПосле инициализации граф имеет вид"
  graph.__print__

  # Добавить ребро
  # вершина 1, 2 то есть v[0], v[2]
  graph.add_edge(v[0], v[2])
  puts "\nПосле добавления ребра 1-2 граф имеет вид"
  graph.__print__

  # Удалить ребро
  # вершина 1, 3 то есть v[0], v[1]
  graph.remove_edge(v[0], v[1])
  puts "\nПосле удаления ребра 1-3 граф имеет вид"
  graph.__print__

  # Добавить вершину
  v5 = Vertex.new(6)
  graph.add_vertex(v5)
  puts "\nПосле добавления вершины 6 граф имеет вид"
  graph.__print__

  # Удалить вершину
  # вершина 3 то есть v[1]
  graph.remove_vertex(v[1])
  puts "\nПосле удаления вершины 3 граф имеет вид"
  graph.__print__
end
