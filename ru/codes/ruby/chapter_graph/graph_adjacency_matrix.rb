=begin
File: graph_adjacency_matrix.rb
Created Time: 2024-04-25
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/print_util'

### Неориентированный граф на матрице смежности ###
class GraphAdjMat
  def initialize(vertices, edges)
    ### Конструктор ###
    # Список вершин: элементы — значения вершин, позиции — их индексы
    @vertices = []
    # Матрица смежности: индексы строк и столбцов соответствуют индексам вершин
    @adj_mat = []
    # Добавить вершину
    vertices.each { |val| add_vertex(val) }
    # Добавить ребро
    # Элементы edges содержат индексы вершин, то есть индексы элементов vertices
    edges.each { |e| add_edge(e[0], e[1]) }
  end

  ### Получить число вершин ###
  def size
    @vertices.length
  end

  ### Добавить вершину ###
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

  ### Удалить вершину ###
  def remove_vertex(index)
    raise IndexError if index >= size

    # Удалить из списка вершин вершину с индексом index
    @vertices.delete_at(index)
    # Удалить из матрицы смежности строку с индексом index
    @adj_mat.delete_at(index)
    # Удалить из матрицы смежности столбец с индексом index
    @adj_mat.each { |row| row.delete_at(index) }
  end

  ### Добавить ребро ###
  def add_edge(i, j)
    # Параметры i и j — индексы элементов vertices
    # Проверить выход индексов за границы и их совпадение
    if i < 0 || j < 0 || i >= size || j >= size || i == j
      raise IndexError
    end
    # Матрица смежности неориентированного графа симметрична относительно главной диагонали: (i, j) == (j, i)
    @adj_mat[i][j] = 1
    @adj_mat[j][i] = 1
  end

  ### Удалить ребро ###
  def remove_edge(i, j)
    # Параметры i и j — индексы элементов vertices
    # Проверить выход индексов за границы и их совпадение
    if i < 0 || j < 0 || i >= size || j >= size || i == j
      raise IndexError
    end
    @adj_mat[i][j] = 0
    @adj_mat[j][i] = 0
  end

  ### Вывести матрицу смежности ###
  def __print__
    puts "Список вершин = #{@vertices}"
    puts 'Матрица смежности ='
    print_matrix(@adj_mat)
  end
end

### Пример использования ###
if __FILE__ == $0
  # Инициализировать неориентированный граф
  # Элементы edges содержат индексы вершин, то есть индексы элементов vertices
  vertices = [1, 3, 2, 5, 4]
  edges = [[0, 1], [0, 3], [1, 2], [2, 3], [2, 4], [3, 4]]
  graph = GraphAdjMat.new(vertices, edges)
  puts "\nГраф после инициализации:"
  graph.__print__

  # Добавить ребро
  # Индексы вершин 1 и 2 равны 0 и 2 соответственно
  graph.add_edge(0, 2)
  puts "\nГраф после добавления ребра 1–2:"
  graph.__print__

  # Удалить ребро
  # Индексы вершин 1 и 3 равны 0 и 1 соответственно
  graph.remove_edge(0, 1)
  puts "\nГраф после удаления ребра 1–3:"
  graph.__print__

  # Добавить вершину
  graph.add_vertex(6)
  puts "\nГраф после добавления вершины 6:"
  graph.__print__

  # Удалить вершину
  # Индекс вершины 3 равен 1
  graph.remove_vertex(1)
  puts "\nГраф после удаления вершины 3:"
  graph.__print__
end
