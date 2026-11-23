=begin
File: graph_adjacency_list.rb
Created Time: 2024-04-25
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/vertex'

### Undirected graph class implemented with an adjacency list ###
class GraphAdjList
  attr_reader :adj_list
  
  ### Constructor ###
  def initialize(edges)
    # Adjacency list: key is a vertex, value is the list of all its neighbors
    @adj_list = {}
    # Add all vertices and edges
    for edge in edges
      add_vertex(edge[0])
      add_vertex(edge[1])
      add_edge(edge[0], edge[1])
    end
  end

  ### Get the number of vertices ###
  def size
    @adj_list.length
  end

  ### Add an edge ###
  def add_edge(vet1, vet2)
    raise ArgumentError if !@adj_list.include?(vet1) || !@adj_list.include?(vet2)

    @adj_list[vet1] << vet2
    @adj_list[vet2] << vet1
  end

  ### Remove an edge ###
  def remove_edge(vet1, vet2)
    raise ArgumentError if !@adj_list.include?(vet1) || !@adj_list.include?(vet2)

    # Remove edge vet1 - vet2
    @adj_list[vet1].delete(vet2)
    @adj_list[vet2].delete(vet1)
  end

  ### Add a vertex ###
  def add_vertex(vet)
    return if @adj_list.include?(vet)

    # Add a new neighbor list to the adjacency list
    @adj_list[vet] = []
  end

  ### Remove a vertex ###
  def remove_vertex(vet)
    raise ArgumentError unless @adj_list.include?(vet)

    # Remove the neighbor list for vertex vet from the adjacency list
    @adj_list.delete(vet)
    # Traverse the other neighbor lists and remove all edges incident to vet
    for vertex in @adj_list
      @adj_list[vertex.first].delete(vet) if @adj_list[vertex.first].include?(vet)
    end
  end

  ### Print the adjacency list ###
  def __print__
    puts 'Adjacency list ='
    for vertex in @adj_list
      tmp = @adj_list[vertex.first].map { |v| v.val }
      puts "#{vertex.first.val}: #{tmp},"
    end
  end
end

### Driver code ###
if __FILE__ == $0
  # Initialize the undirected graph
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
  puts "\nGraph after initialization:"
  graph.__print__

  # Add an edge
  # Vertices 1 and 2 are v[0] and v[2]
  graph.add_edge(v[0], v[2])
  puts "\nGraph after adding edge 1-2:"
  graph.__print__

  # Remove an edge
  # Vertices 1 and 3 are v[0] and v[1]
  graph.remove_edge(v[0], v[1])
  puts "\nGraph after removing edge 1-3:"
  graph.__print__

  # Add a vertex
  v5 = Vertex.new(6)
  graph.add_vertex(v5)
  puts "\nGraph after adding vertex 6:"
  graph.__print__

  # Remove a vertex
  # Vertex 3 is v[1]
  graph.remove_vertex(v[1])
  puts "\nGraph after removing vertex 3:"
  graph.__print__
end
