/*
 * File: graph_adjacency_list.rs
 * Created Time: 2023-07-12
 * Author: night-cruise (2586447362@qq.com)
 */

pub use hello_algo_rust::include::{vals_to_vets, vets_to_vals, Vertex};

use std::collections::HashMap;

/* Undirected graph type represented by an adjacency list */
pub struct GraphAdjList {
    // Adjacency list: each vertex maps to its neighbors
    pub adj_list: HashMap<Vertex, Vec<Vertex>>, // Would HashSet<Vertex> be a better choice for the values?
}

impl GraphAdjList {
    /* Constructor */
    pub fn new(edges: Vec<[Vertex; 2]>) -> Self {
        let mut graph = GraphAdjList {
            adj_list: HashMap::new(),
        };
        // Add all vertices and edges
        for edge in edges {
            graph.add_vertex(edge[0]);
            graph.add_vertex(edge[1]);
            graph.add_edge(edge[0], edge[1]);
        }

        graph
    }

    /* Get the vertex count */
    #[allow(unused)]
    pub fn size(&self) -> usize {
        self.adj_list.len()
    }

    /* Add an edge */
    pub fn add_edge(&mut self, vet1: Vertex, vet2: Vertex) {
        if vet1 == vet2 {
            panic!("value error");
        }
        // Add the edge vet1 - vet2
        self.adj_list.entry(vet1).or_default().push(vet2);
        self.adj_list.entry(vet2).or_default().push(vet1);
    }

    /* Remove an edge */
    #[allow(unused)]
    pub fn remove_edge(&mut self, vet1: Vertex, vet2: Vertex) {
        if vet1 == vet2 {
            panic!("value error");
        }
        // Remove the edge vet1 - vet2
        self.adj_list
            .entry(vet1)
            .and_modify(|v| v.retain(|&e| e != vet2));
        self.adj_list
            .entry(vet2)
            .and_modify(|v| v.retain(|&e| e != vet1));
    }

    /* Add a vertex */
    pub fn add_vertex(&mut self, vet: Vertex) {
        if self.adj_list.contains_key(&vet) {
            return;
        }
        // Add a new linked list to the adjacency list
        self.adj_list.insert(vet, vec![]);
    }

    /* Remove a vertex */
    #[allow(unused)]
    pub fn remove_vertex(&mut self, vet: Vertex) {
        // Remove the linked list for vertex vet from the adjacency list
        self.adj_list.remove(&vet);
        // Traverse the other vertices' lists and remove every edge incident to vet
        for list in self.adj_list.values_mut() {
            list.retain(|&v| v != vet);
        }
    }

    /* Print the adjacency list */
    pub fn print(&self) {
        println!("Adjacency list =");
        for (vertex, list) in &self.adj_list {
            let list = list.iter().map(|vertex| vertex.val).collect::<Vec<i32>>();
            println!("{}: {:?},", vertex.val, list);
        }
    }
}

/* Driver code */
#[allow(unused)]
fn main() {
    /* Initialize an undirected graph */
    let v = vals_to_vets(vec![1, 3, 2, 5, 4]);
    let edges = vec![
        [v[0], v[1]],
        [v[0], v[3]],
        [v[1], v[2]],
        [v[2], v[3]],
        [v[2], v[4]],
        [v[3], v[4]],
    ];

    let mut graph = GraphAdjList::new(edges);
    println!("\nGraph after initialization:");
    graph.print();

    /* Add an edge */
    // Vertices 1 and 2 are v[0] and v[2], respectively
    graph.add_edge(v[0], v[2]);
    println!("\nGraph after adding edge 1-2:");
    graph.print();

    /* Remove an edge */
    // Vertices 1 and 3 are v[0] and v[1], respectively
    graph.remove_edge(v[0], v[1]);
    println!("\nGraph after removing edge 1-3:");
    graph.print();

    /* Add a vertex */
    let v5 = Vertex { val: 6 };
    graph.add_vertex(v5);
    println!("\nGraph after adding vertex 6:");
    graph.print();

    /* Remove a vertex */
    // Vertex 3 is v[1]
    graph.remove_vertex(v[1]);
    println!("\nGraph after removing vertex 3:");
    graph.print();
}
