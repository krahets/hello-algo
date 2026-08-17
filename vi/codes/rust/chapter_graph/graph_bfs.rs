/*
 * File: graph_bfs.rs
 * Created Time: 2023-07-12
 * Author: night-cruise (2586447362@qq.com)
 */

mod graph_adjacency_list;

use graph_adjacency_list::GraphAdjList;
use graph_adjacency_list::{vals_to_vets, vets_to_vals, Vertex};
use std::collections::{HashSet, VecDeque};

/* Breadth-first traversal */
// Use adjacency list to represent the graph, in order to obtain all adjacent vertices of a specified vertex
fn graph_bfs(graph: GraphAdjList, start_vet: Vertex) -> Vec<Vertex> {
    // Vertex traversal sequence
    let mut res = vec![];
    // Hash set for recording vertices that have been visited
    let mut visited = HashSet::new();
    visited.insert(start_vet);
    // Queue used to implement BFS
    let mut que = VecDeque::new();
    que.push_back(start_vet);
    // Starting from vertex vet, loop until all vertices are visited
    while let Some(vet) = que.pop_front() {
        res.push(vet); // Record visited vertex

        // Traverse all adjacent vertices of this vertex
        if let Some(adj_vets) = graph.adj_list.get(&vet) {
            for &adj_vet in adj_vets {
                if visited.contains(&adj_vet) {
                    continue; // Skip vertices that have been visited
                }
                que.push_back(adj_vet); // Only enqueue unvisited vertices
                visited.insert(adj_vet); // Mark this vertex as visited
            }
        }
    }
    // Return vertex traversal sequence
    res
}

/* Driver Code */
fn main() {
    /* Add edge */
    let v = vals_to_vets(vec![0, 1, 2, 3, 4, 5, 6, 7, 8, 9]);
    let edges = vec![
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
    ];
    let graph = GraphAdjList::new(edges);
    println!("\nAfter initialization, graph is");
    graph.print();

    /* Breadth-first traversal */
    let res = graph_bfs(graph, v[0]);
    println!("\nBreadth-first traversal (BFS) vertex sequence is");
    println!("{:?}", vets_to_vals(res));
}
