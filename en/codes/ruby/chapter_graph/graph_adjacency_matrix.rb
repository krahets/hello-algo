=begin
File: graph_adjacency_matrix.rb
Created Time: 2024-04-25
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/print_util'

### Undirected graph class implemented with an adjacency matrix ###
class GraphAdjMat
  def initialize(vertices, edges)
    ### Constructor ###
    # Vertex list: elements are vertex values, and indices are vertex indices
    @vertices = []
    # Adjacency matrix: row and column indices correspond to vertex indices
    @adj_mat = []
    # Add a vertex
    vertices.each { |val| add_vertex(val) }
    # Add an edge
    # Note that the entries in edges are vertex indices, corresponding to element indices in vertices
    edges.each { |e| add_edge(e[0], e[1]) }
  end

  ### Get the number of vertices ###
  def size
    @vertices.length
  end

  ### Add a vertex ###
  def add_vertex(val)
    n = size
    # Append the new vertex value to the vertex list
    @vertices << val
    # Add a row to the adjacency matrix
    new_row = Array.new(n, 0)
    @adj_mat << new_row
    # Add a column to the adjacency matrix
    @adj_mat.each { |row| row << 0 }
  end

  ### Remove a vertex ###
  def remove_vertex(index)
    raise IndexError if index >= size

    # Remove the vertex at index `index` from the vertex list
    @vertices.delete_at(index)
    # Remove row `index` from the adjacency matrix
    @adj_mat.delete_at(index)
    # Remove column `index` from the adjacency matrix
    @adj_mat.each { |row| row.delete_at(index) }
  end

  ### Add an edge ###
  def add_edge(i, j)
    # Parameters i and j are element indices in vertices
    # Handle out-of-bounds or equal indices
    if i < 0 || j < 0 || i >= size || j >= size || i == j
      raise IndexError
    end
    # For an undirected graph, the adjacency matrix is symmetric about its main diagonal: entries (i, j) and (j, i) are equal
    @adj_mat[i][j] = 1
    @adj_mat[j][i] = 1
  end

  ### Remove an edge ###
  def remove_edge(i, j)
    # Parameters i and j are element indices in vertices
    # Handle out-of-bounds or equal indices
    if i < 0 || j < 0 || i >= size || j >= size || i == j
      raise IndexError
    end
    @adj_mat[i][j] = 0
    @adj_mat[j][i] = 0
  end

  ### Print the adjacency matrix ###
  def __print__
    puts "Vertex list = #{@vertices}"
    puts 'Adjacency matrix ='
    print_matrix(@adj_mat)
  end
end

### Driver code ###
if __FILE__ == $0
  # Initialize the undirected graph
  # Note that the entries in edges are vertex indices, corresponding to element indices in vertices
  vertices = [1, 3, 2, 5, 4]
  edges = [[0, 1], [0, 3], [1, 2], [2, 3], [2, 4], [3, 4]]
  graph = GraphAdjMat.new(vertices, edges)
  puts "\nGraph after initialization:"
  graph.__print__

  # Add an edge
  # Vertices 1 and 2 have indices 0 and 2, respectively
  graph.add_edge(0, 2)
  puts "\nGraph after adding edge 1-2:"
  graph.__print__

  # Remove an edge
  # The indices of vertices 1 and 3 are 0 and 1, respectively
  graph.remove_edge(0, 1)
  puts "\nGraph after removing edge 1-3:"
  graph.__print__

  # Add a vertex
  graph.add_vertex(6)
  puts "\nGraph after adding vertex 6:"
  graph.__print__

  # Remove a vertex
  # Vertex 3 has index 1
  graph.remove_vertex(1)
  puts "\nGraph after removing vertex 3:"
  graph.__print__
end
