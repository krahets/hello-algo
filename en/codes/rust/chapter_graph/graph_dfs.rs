/*
 * File: graph_dfs.rs
 * Created Time: 2023-07-12
 * Author: night-cruise (2586447362@qq.com)
 */

mod graph_adjacency_list;

use graph_adjacency_list::GraphAdjList;
use graph_adjacency_list::{vals_to_vets, vets_to_vals, Vertex};
use std::collections::HashSet;

/* Depth-first traversal helper function */
fn dfs(graph: &GraphAdjList, visited: &mut HashSet<Vertex>, res: &mut Vec<Vertex>, vet: Vertex) {
    res.push(vet); // Record visited vertex
    visited.insert(vet); // Mark this vertex as visited
                         // Traverse all adjacent vertices of this vertex
    if let Some(adj_vets) = graph.adj_list.get(&vet) {
        for &adj_vet in adj_vets {
            if visited.contains(&adj_vet) {
                continue; // Skip vertices that have been visited
            }
            // Recursively visit adjacent vertices
            dfs(graph, visited, res, adj_vet);
        }
    }
}

/* Depth-first traversal */
// Use adjacency list to represent the graph, in order to obtain all adjacent vertices of a specified vertex
fn graph_dfs(graph: GraphAdjList, start_vet: Vertex) -> Vec<Vertex> {
    // Vertex traversal sequence
    let mut res = vec![];
    // Hash set for recording vertices that have been visited
    let mut visited = HashSet::new();
    dfs(&graph, &mut visited, &mut res, start_vet);

    res
}

/* Driver Code */
fn main() {
    /* Add edge */
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
    println!("\nAfter initialization, graph is");
    graph.print();

    /* Depth-first traversal */
    let res = graph_dfs(graph, v[0]);
    println!("\nDepth-first traversal (DFS) vertex sequence is");
    println!("{:?}", vets_to_vals(res));
}
