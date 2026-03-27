=begin
File: graph_adjacency_matrix.rb
Created Time: 2024-04-25
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/print_util'

# ## Класс неориентированного графа на основе матрицы смежности ###
class GraphAdjMat
  def initialize(vertices, edges)
    # ## Конструктор ###
    # Список вершин: элементы представляют «значения вершин», а индексы — «индексы вершин»
    @vertices = []
    # Матрица смежности, где индексы строк и столбцов соответствуют «индексам вершин»
    @adj_mat = []
    # Добавление вершины
    vertices.each { |val| add_vertex(val) }
    # Добавить ребра
    # Обратите внимание: элементы edges представляют собой индексы вершин, то есть соответствуют индексам элементов vertices
    edges.each { |e| add_edge(e[0], e[1]) }
  end

  # ## Получение числа вершин ###
  def size
    @vertices.length
  end

  # ## Добавление вершины ###
  def add_vertex(val)
    n = size
    # Добавить значение новой вершины в список вершин
    @vertices << val
    # Добавить строку в матрицу смежности
    new_row = Array.new(n, 0)
    @adj_mat << new_row
    # Добавить столбец в матрицу смежности
    @adj_mat.each { |row| row << 0 }
  end

  # ## Удаление вершины ###
  def remove_vertex(index)
    raise IndexError if index >= size

    # Удалить вершину с индексом index из списка вершин
    @vertices.delete_at(index)
    # Удалить строку с индексом index из матрицы смежности
    @adj_mat.delete_at(index)
    # Удалить столбец с индексом index из матрицы смежности
    @adj_mat.each { |row| row.delete_at(index) }
  end

  # ## Добавление ребра ###
  def add_edge(i, j)
    # Параметры i и j соответствуют индексам элементов vertices
    # Обработка выхода индекса за границы и случая равенства
    if i < 0 || j < 0 || i >= size || j >= size || i == j
      raise IndexError
    end
    # В неориентированном графе матрица смежности симметрична относительно главной диагонали, то есть выполняется (i, j) == (j, i)
    @adj_mat[i][j] = 1
    @adj_mat[j][i] = 1
  end

  # ## Удаление ребра ###
  def remove_edge(i, j)
    # Параметры i и j соответствуют индексам элементов vertices
    # Обработка выхода индекса за границы и случая равенства
    if i < 0 || j < 0 || i >= size || j >= size || i == j
      raise IndexError
    end
    @adj_mat[i][j] = 0
    @adj_mat[j][i] = 0
  end

  # ## Вывести матрицу смежности ###
  def __print__
    puts "Список вершин = #{@vertices}"
    puts 'Матрица смежности ='
    print_matrix(@adj_mat)
  end
end

### Driver Code ###
if __FILE__ == $0
  # Инициализация неориентированного графа
  # Обратите внимание: элементы edges представляют индексы вершин, то есть соответствуют индексам элементов vertices
  vertices = [1, 3, 2, 5, 4]
  edges = [[0, 1], [0, 3], [1, 2], [2, 3], [2, 4], [3, 4]]
  graph = GraphAdjMat.new(vertices, edges)
  puts "\nГраф после инициализации"
  graph.__print__

  # Добавление ребра
  # Индексы вершин 1 и 2 равны 0 и 2 соответственно
  graph.add_edge(0, 2)
  puts "\nГраф после добавления ребра 1-2"
  graph.__print__

  # Удалить ребро
  # Индексы вершин 1 и 3 равны 0 и 1
  graph.remove_edge(0, 1)
  puts "\nГраф после удаления ребра 1-3"
  graph.__print__

  # Добавление вершины
  graph.add_vertex(6)
  puts "\nГраф после добавления вершины 6"
  graph.__print__

  # Удаление вершины
  # Индекс вершины 3 равен 1
  graph.remove_vertex(1)
  puts "\nГраф после удаления вершины 3"
  graph.__print__
end
