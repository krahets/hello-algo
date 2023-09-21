use std::usize;
use std::cmp::Ordering;
use std::collections::BinaryHeap;

#[derive(Copy, Clone, Eq, PartialEq)]
struct Node {
    index: usize,
    distance: u32,
}

impl Ord for Node {
    fn cmp(&self, other: &Self) -> Ordering {
        other.distance.cmp(&self.distance)
    }
}

impl PartialOrd for Node {
    fn partial_cmp(&self, other: &Self) -> Option<Ordering> {
        Some(self.cmp(other))
    }
}

struct dijkstra {
    num_vertices: usize,
    graph: Vec<Vec<u32>>,
}

impl dijkstra {
    fn new(graph: Vec<Vec<u32>>) -> Self {
        let num_vertices = graph.len();
        Self { num_vertices, graph }
    }

    fn dijkstra(&self, src: usize) -> Vec<Option<u32>> {
        let mut dist: Vec<Option<u32>> = vec![None; self.num_vertices];
        let mut heap = BinaryHeap::new();

        dist[src] = Some(0);
        heap.push(Node { index: src, distance: 0 });

        while !heap.is_empty() {
            let current_node = heap.pop().unwrap();

            if dist[current_node.index] != Some(current_node.distance) {
                continue;
            }

            for i in 0..self.num_vertices {
                if let Some(weight) = self.graph[current_node.index][i].checked_add(current_node.distance) {
                    if dist[i].map_or(true, |d| weight < d) {
                        dist[i] = Some(weight);
                        heap.push(Node { index: i, distance: weight });
                    }
                }
            }
        }

        dist
    }
}

fn main() {
    let graph = vec![
        vec![0, 2, 0, 6, 0, 0],
        vec![2, 0, 3, 8, 5, 0],
        vec![0, 3, 0, 0, 7, 0],
        vec![6, 8, 0, 0, 9, 10],
        vec![0, 5, 7, 9, 0, 1],
        vec![0, 0, 0, 10, 1, 0],
    ];

    let dijkstra = dijkstra::new(graph);
    let dist = dijkstra.dijkstra(0);

    println!("顶点   距离");
    for i in 0..dist.len() {
        println!("{}     {}", i, dist[i].unwrap());
    }
}
