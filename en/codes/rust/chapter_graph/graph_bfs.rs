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
// Represent the graph with an adjacency list to look up all neighbors of a given vertex
fn graph_bfs(graph: GraphAdjList, start_vet: Vertex) -> Vec<Vertex> {
    // Vertex traversal order
    let mut res = vec![];
    // Use a hash set to track visited vertices
    let mut visited = HashSet::new();
    visited.insert(start_vet);
    // Use a queue for BFS
    let mut que = VecDeque::new();
    que.push_back(start_vet);
    // Starting at vertex vet, loop until all reachable vertices have been visited
    while let Some(vet) = que.pop_front() {
        res.push(vet); // Record the visited vertex

        // Iterate over all neighbors of this vertex
        if let Some(adj_vets) = graph.adj_list.get(&vet) {
            for &adj_vet in adj_vets {
                if visited.contains(&adj_vet) {
                    continue; // Skip visited vertices
                }
                que.push_back(adj_vet); // Enqueue only unvisited vertices
                visited.insert(adj_vet); // Mark the vertex as visited
            }
        }
    }
    // Return the vertex traversal order
    res
}

/* Driver code */
fn main() {
    /* Initialize an undirected graph */
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
    println!("\nGraph after initialization:");
    graph.print();

    /* Breadth-first traversal */
    let res = graph_bfs(graph, v[0]);
    println!("\nBreadth-first search (BFS) visits the vertices in this order:");
    println!("{:?}", vets_to_vals(res));
}
