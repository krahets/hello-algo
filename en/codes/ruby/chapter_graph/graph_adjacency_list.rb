=begin
File: graph_adjacency_list.rb
Created Time: 2024-04-25
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/vertex'

### Undirected graph class based on adjacency list ###
class GraphAdjList
  attr_reader :adj_list
  
  ### Constructor ###
  def initialize(edges)
    # Adjacency list, key: vertex, value: all adjacent vertices of that vertex
    @adj_list = {}
    # Add all vertices and edges
    for edge in edges
      add_vertex(edge[0])
      add_vertex(edge[1])
      add_edge(edge[0], edge[1])
    end
  end

  ### Get number of vertices ###
  def size
    @adj_list.length
  end

  ### Add edge ###
  def add_edge(vet1, vet2)
    raise ArgumentError if !@adj_list.include?(vet1) || !@adj_list.include?(vet2)

    @adj_list[vet1] << vet2
    @adj_list[vet2] << vet1
  end

  ### Delete edge ###
  def remove_edge(vet1, vet2)
    raise ArgumentError if !@adj_list.include?(vet1) || !@adj_list.include?(vet2)

    # Remove edge vet1 - vet2
    @adj_list[vet1].delete(vet2)
    @adj_list[vet2].delete(vet1)
  end

  ### Add vertex ###
  def add_vertex(vet)
    return if @adj_list.include?(vet)

    # Add a new linked list in the adjacency list
    @adj_list[vet] = []
  end

  ### Delete vertex ###
  def remove_vertex(vet)
    raise ArgumentError unless @adj_list.include?(vet)

    # Remove the linked list corresponding to vertex vet in the adjacency list
    @adj_list.delete(vet)
    # Traverse the linked lists of other vertices and remove all edges containing vet
    for vertex in @adj_list
      @adj_list[vertex.first].delete(vet) if @adj_list[vertex.first].include?(vet)
    end
  end

  ### Print adjacency list ###
  def __print__
    puts 'Adjacency list ='
    for vertex in @adj_list
      tmp = @adj_list[vertex.first].map { |v| v.val }
      puts "#{vertex.first.val}: #{tmp},"
    end
  end
end

### Driver Code ###
if __FILE__ == $0
  # Add edge
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
  puts "\nAfter initialization, graph is"
  graph.__print__

  # Add edge
  # Vertices 1, 2 are v[0], v[2]
  graph.add_edge(v[0], v[2])
  puts "\nAfter adding edge 1-2, graph is"
  graph.__print__

  # Remove edge
  # Vertices 1, 3 are v[0], v[1]
  graph.remove_edge(v[0], v[1])
  puts "\nAfter removing edge 1-3, graph is"
  graph.__print__

  # Add vertex
  v5 = Vertex.new(6)
  graph.add_vertex(v5)
  puts "\nAfter adding vertex 6, graph is"
  graph.__print__

  # Remove vertex
  # Vertex 3 is v[1]
  graph.remove_vertex(v[1])
  puts "\nAfter removing vertex 3, graph is"
  graph.__print__
end
