=begin
File: graph_dfs.rb
Created Time: 2024-04-25
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require 'set'
require_relative './graph_adjacency_list'
require_relative '../utils/vertex'

### Depth-first traversal helper function ###
def dfs(graph, visited, res, vet)
  res << vet # Record the visited vertex
  visited.add(vet) # Mark this vertex as visited
  # Traverse all neighbors of this vertex
  for adj_vet in graph.adj_list[vet]
    next if visited.include?(adj_vet) # Skip vertices that have already been visited
    # Recursively visit the neighboring vertex
    dfs(graph, visited, res, adj_vet)
  end
end

### Depth-first traversal ###
def graph_dfs(graph, start_vet)
  # Represent the graph with an adjacency list to access all neighbors of a given vertex
  # Vertex traversal sequence
  res = []
  # Hash set recording visited vertices
  visited = Set.new
  dfs(graph, visited, res, start_vet)
  res
end

### Driver code ###
if __FILE__ == $0
  # Initialize the undirected graph
  v = vals_to_vets([0, 1, 2, 3, 4, 5, 6])
  edges = [
    [v[0], v[1]],
    [v[0], v[3]],
    [v[1], v[2]],
    [v[2], v[5]],
    [v[4], v[5]],
    [v[5], v[6]],
  ]
  graph = GraphAdjList.new(edges)
  puts "\nGraph after initialization:"
  graph.__print__

  # Depth-first traversal
  res = graph_dfs(graph, v[0])
  puts "\nVertex sequence from depth-first traversal (DFS):"
  p vets_to_vals(res)
end
