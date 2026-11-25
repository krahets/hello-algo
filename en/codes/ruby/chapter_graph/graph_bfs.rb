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
  # Represent the graph with an adjacency list to look up all neighbors of a given vertex
  # Vertex traversal order
  res = []
  # Use a hash set to track visited vertices
  visited = Set.new([start_vet])
  # Use a queue for BFS
  que = [start_vet]
  # Starting at vertex vet, loop until all reachable vertices have been visited
  while que.length > 0
    vet = que.shift # Dequeue the front vertex
    res << vet # Record the visited vertex
    # Iterate over all neighbors of this vertex
    for adj_vet in graph.adj_list[vet]
      next if visited.include?(adj_vet) # Skip visited vertices
      que << adj_vet # Enqueue only unvisited vertices
      visited.add(adj_vet) # Mark the vertex as visited
    end
  end
  # Return the vertex traversal order
  res
end

### Driver code ###
if __FILE__ == $0
  # Initialize an undirected graph
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
  puts "\nGraph after initialization:"
  graph.__print__

  # Breadth-first traversal
  res = graph_bfs(graph, v.first)
  puts "\nBreadth-first search (BFS) visits the vertices in this order:"
  p vets_to_vals(res)
end
