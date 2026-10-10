=begin
File: graph_bfs.rb
Created Time: 2024-04-25
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require 'set'
require_relative './graph_adjacency_list'
require_relative '../utils/vertex'

### Breadth-first traversal ###
def graph_bfs(graph, start_vet)
  # Use adjacency list to represent the graph, in order to obtain all adjacent vertices of a specified vertex
  # Vertex traversal sequence
  res = []
  # Hash set for recording vertices that have been visited
  visited = Set.new([start_vet])
  # Queue used to implement BFS
  que = [start_vet]
  # Starting from vertex vet, loop until all vertices are visited
  while que.length > 0
    vet = que.shift # Dequeue the front vertex
    res << vet # Record visited vertex
    # Traverse all adjacent vertices of this vertex
    for adj_vet in graph.adj_list[vet]
      next if visited.include?(adj_vet) # Skip vertices that have been visited
      que << adj_vet # Only enqueue unvisited vertices
      visited.add(adj_vet) # Mark this vertex as visited
    end
  end
  # Return vertex traversal sequence
  res
end

### Driver Code ###
if __FILE__ == $0
  # Add edge
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
  puts "\nAfter initialization, graph is"
  graph.__print__

  # Breadth-first traversal
  res = graph_bfs(graph, v.first)
  puts "\nBreadth-first traversal (BFS) vertex sequence is"
  p vets_to_vals(res)
end
