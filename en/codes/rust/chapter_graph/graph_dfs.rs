/*
 * File: graph_dfs.rs
 * Created Time: 2023-07-12
 * Author: night-cruise (2586447362@qq.com)
 */

mod graph_adjacency_list;

use graph_adjacency_list::GraphAdjList;
use graph_adjacency_list::{vals_to_vets, vets_to_vals, Vertex};
use std::collections::HashSet;

/* Helper for depth-first traversal */
fn dfs(graph: &GraphAdjList, visited: &mut HashSet<Vertex>, res: &mut Vec<Vertex>, vet: Vertex) {
    res.push(vet); // Record the visited vertex
    visited.insert(vet); // Mark the vertex as visited
                         // Iterate over all neighbors of this vertex
    if let Some(adj_vets) = graph.adj_list.get(&vet) {
        for &adj_vet in adj_vets {
            if visited.contains(&adj_vet) {
                continue; // Skip visited vertices
            }
            // Visit neighbors recursively
            dfs(graph, visited, res, adj_vet);
        }
    }
}

/* Depth-first traversal */
// Represent the graph with an adjacency list to look up all neighbors of a given vertex
fn graph_dfs(graph: GraphAdjList, start_vet: Vertex) -> Vec<Vertex> {
    // Vertex traversal order
    let mut res = vec![];
    // Use a hash set to track visited vertices
    let mut visited = HashSet::new();
    dfs(&graph, &mut visited, &mut res, start_vet);

    res
}

/* Driver code */
fn main() {
    /* Initialize an undirected graph */
    let v = vals_to_vets(vec![0, 1, 2, 3, 4, 5, 6]);
    let edges = vec![
        [v[0], v[1]],
        [v[0], v[3]],
        [v[1], v[2]],
        [v[2], v[5]],
        [v[4], v[5]],
        [v[5], v[6]],
    ];
    let graph = GraphAdjList::new(edges);
    println!("\nGraph after initialization:");
    graph.print();

    /* Depth-first traversal */
    let res = graph_dfs(graph, v[0]);
    println!("\nDepth-first search (DFS) visits the vertices in this order:");
    println!("{:?}", vets_to_vals(res));
}
