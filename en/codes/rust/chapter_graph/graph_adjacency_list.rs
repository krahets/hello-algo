/*
 * File: graph_adjacency_list.rs
 * Created Time: 2023-07-12
 * Author: night-cruise (2586447362@qq.com)
 */

include!("../include/vertex.rs");

use std::collections::HashMap;

/* Type of undirected graph implemented based on adjacency list */
pub struct GraphAdjList {
    // Adjacency list, key: vertex, value: all adjacent vertices of that vertex
    pub adj_list: HashMap<Vertex, Vec<Vertex>>,
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

    /* Get the number of vertices */
    #[allow(unused)]
    pub fn size(&self) -> usize {
        self.adj_list.len()
    }

    /* Add edge */
    pub fn add_edge(&mut self, vet1: Vertex, vet2: Vertex) {
        if !self.adj_list.contains_key(&vet1) || !self.adj_list.contains_key(&vet2) || vet1 == vet2
        {
            panic!("value error");
        }
        // Add edge vet1 - vet2
        self.adj_list.get_mut(&vet1).unwrap().push(vet2);
        self.adj_list.get_mut(&vet2).unwrap().push(vet1);
    }

    /* Remove edge */
    #[allow(unused)]
    pub fn remove_edge(&mut self, vet1: Vertex, vet2: Vertex) {
        if !self.adj_list.contains_key(&vet1) || !self.adj_list.contains_key(&vet2) || vet1 == vet2
        {
            panic!("value error");
        }
        // Remove edge vet1 - vet2
        self.adj_list
            .get_mut(&vet1)
            .unwrap()
            .retain(|&vet| vet != vet2);
        self.adj_list
            .get_mut(&vet2)
            .unwrap()
            .retain(|&vet| vet != vet1);
    }

    /* Add vertex */
    pub fn add_vertex(&mut self, vet: Vertex) {
        if self.adj_list.contains_key(&vet) {
            return;
        }
        // Add a new linked list to the adjacency list
        self.adj_list.insert(vet, vec![]);
    }

    /* Remove vertex */
    #[allow(unused)]
    pub fn remove_vertex(&mut self, vet: Vertex) {
        if !self.adj_list.contains_key(&vet) {
            panic!("value error");
        }
        // Remove the vertex vet's corresponding linked list from the adjacency list
        self.adj_list.remove(&vet);
        // Traverse other vertices' linked lists, removing all edges containing vet
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

/* Driver Code */
#[allow(unused)]
fn main() {
    /* Initialize undirected graph */
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
    println!("\nAfter initialization, the graph is");
    graph.print();

    /* Add edge */
    // Vertices 1, 2 i.e., v[0], v[2]
    graph.add_edge(v[0], v[2]);
    println!("\nAfter adding edge 1-2, the graph is");
    graph.print();

    /* Remove edge */
    // Vertices 1, 3 i.e., v[0], v[1]
    graph.remove_edge(v[0], v[1]);
    println!("\nAfter removing edge 1-3, the graph is");
    graph.print();

    /* Add vertex */
    let v5 = Vertex { val: 6 };
    graph.add_vertex(v5);
    println!("\nAfter adding vertex 6, the graph is");
    graph.print();

    /* Remove vertex */
    // Vertex 3 i.e., v[1]
    graph.remove_vertex(v[1]);
    println!("\nAfter removing vertex 3, the graph is");
    graph.print();
}
