=begin
File: graph_adjacency_matrix.rb
Created Time: 2024-04-25
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/print_util'

### Undirected graph class based on adjacency matrix ###
class GraphAdjMat
  def initialize(vertices, edges)
    ### Constructor ###
    # Vertex list, where the element represents the "vertex value" and the index represents the "vertex index"
    @vertices = []
    # Adjacency matrix, where the row and column indices correspond to the "vertex index"
    @adj_mat = []
    # Add vertex
    vertices.each { |val| add_vertex(val) }
    # Add edge
    # Note that the edges elements represent vertex indices, i.e., corresponding to the vertices element indices
    edges.each { |e| add_edge(e[0], e[1]) }
  end

  ### Get number of vertices ###
  def size
    @vertices.length
  end

  ### Add vertex ###
  def add_vertex(val)
    n = size
    # Add the value of the new vertex to the vertex list
    @vertices << val
    # Add a row to the adjacency matrix
    new_row = Array.new(n, 0)
    @adj_mat << new_row
    # Add a column to the adjacency matrix
    @adj_mat.each { |row| row << 0 }
  end

  ### Delete vertex ###
  def remove_vertex(index)
    raise IndexError if index >= size

    # Remove the vertex at index from the vertex list
    @vertices.delete_at(index)
    # Remove the row at index from the adjacency matrix
    @adj_mat.delete_at(index)
    # Remove the column at index from the adjacency matrix
    @adj_mat.each { |row| row.delete_at(index) }
  end

  ### Add edge ###
  def add_edge(i, j)
    # Parameters i, j correspond to the vertices element indices
    # Handle index out of bounds and equality
    if i < 0 || j < 0 || i >= size || j >= size || i == j
      raise IndexError
    end
    # In an undirected graph, the adjacency matrix is symmetric about the main diagonal, i.e., (i, j) == (j, i)
    @adj_mat[i][j] = 1
    @adj_mat[j][i] = 1
  end

  ### Delete edge ###
  def remove_edge(i, j)
    # Parameters i, j correspond to the vertices element indices
    # Handle index out of bounds and equality
    if i < 0 || j < 0 || i >= size || j >= size || i == j
      raise IndexError
    end
    @adj_mat[i][j] = 0
    @adj_mat[j][i] = 0
  end

  ### Print adjacency matrix ###
  def __print__
    puts "Vertex list = #{@vertices}"
    puts 'Adjacency matrix ='
    print_matrix(@adj_mat)
  end
end

### Driver Code ###
if __FILE__ == $0
  # Add edge
  # Note that the edges elements represent vertex indices, i.e., corresponding to the vertices element indices
  vertices = [1, 3, 2, 5, 4]
  edges = [[0, 1], [0, 3], [1, 2], [2, 3], [2, 4], [3, 4]]
  graph = GraphAdjMat.new(vertices, edges)
  puts "\nAfter initialization, graph is"
  graph.__print__

  # Add edge
  # Add vertex
  graph.add_edge(0, 2)
  puts "\nAfter adding edge 1-2, graph is"
  graph.__print__

  # Remove edge
  # Vertices 1, 3 have indices 0, 1 respectively
  graph.remove_edge(0, 1)
  puts "\nAfter removing edge 1-3, graph is"
  graph.__print__

  # Add vertex
  graph.add_vertex(6)
  puts "\nAfter adding vertex 6, graph is"
  graph.__print__

  # Remove vertex
  # Vertex 3 has index 1
  graph.remove_vertex(1)
  puts "\nAfter removing vertex 3, graph is"
  graph.__print__
end
