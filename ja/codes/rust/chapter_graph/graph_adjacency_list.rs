/*
 * File: graph_adjacency_list.rs
 * Created Time: 2023-07-12
 * Author: night-cruise (2586447362@qq.com)
 */

pub use hello_algo_rust::include::{vals_to_vets, vets_to_vals, Vertex};

use std::collections::HashMap;

/* 隣接リストに基づく無向グラフ型 */
pub struct GraphAdjList {
    // 隣接リスト。key は頂点、value はその頂点に隣接する全頂点
    pub adj_list: HashMap<Vertex, Vec<Vertex>>, // maybe HashSet<Vertex> for value part is better?
}

impl GraphAdjList {
    /* コンストラクタ */
    pub fn new(edges: Vec<[Vertex; 2]>) -> Self {
        let mut graph = GraphAdjList {
            adj_list: HashMap::new(),
        };
        // すべての頂点と辺を追加
        for edge in edges {
            graph.add_vertex(edge[0]);
            graph.add_vertex(edge[1]);
            graph.add_edge(edge[0], edge[1]);
        }

        graph
    }

    /* 頂点数を取得 */
    #[allow(unused)]
    pub fn size(&self) -> usize {
        self.adj_list.len()
    }

    /* 辺を追加 */
    pub fn add_edge(&mut self, vet1: Vertex, vet2: Vertex) {
        if vet1 == vet2 {
            panic!("value error");
        }
        // 辺 vet1 - vet2 を追加
        self.adj_list.entry(vet1).or_default().push(vet2);
        self.adj_list.entry(vet2).or_default().push(vet1);
    }

    /* 辺を削除 */
    #[allow(unused)]
    pub fn remove_edge(&mut self, vet1: Vertex, vet2: Vertex) {
        if vet1 == vet2 {
            panic!("value error");
        }
        // 辺 vet1 - vet2 を削除
        self.adj_list
            .entry(vet1)
            .and_modify(|v| v.retain(|&e| e != vet2));
        self.adj_list
            .entry(vet2)
            .and_modify(|v| v.retain(|&e| e != vet1));
    }

    /* 頂点を追加 */
    pub fn add_vertex(&mut self, vet: Vertex) {
        if self.adj_list.contains_key(&vet) {
            return;
        }
        // 隣接リストに新しいリストを追加
        self.adj_list.insert(vet, vec![]);
    }

    /* 頂点を削除 */
    #[allow(unused)]
    pub fn remove_vertex(&mut self, vet: Vertex) {
        // 隣接リストから頂点 vet に対応するリストを削除
        self.adj_list.remove(&vet);
        // 他の頂点のリストを走査し、vet を含むすべての辺を削除
        for list in self.adj_list.values_mut() {
            list.retain(|&v| v != vet);
        }
    }

    /* 隣接リストを出力 */
    pub fn print(&self) {
        println!("隣接リスト =");
        for (vertex, list) in &self.adj_list {
            let list = list.iter().map(|vertex| vertex.val).collect::<Vec<i32>>();
            println!("{}: {:?},", vertex.val, list);
        }
    }
}

/* Driver Code */
#[allow(unused)]
fn main() {
    /* 無向グラフを初期化 */
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
    println!("\n初期化後、グラフは");
    graph.print();

    /* 辺を追加 */
    // 頂点 1, 2 は v[0], v[2]
    graph.add_edge(v[0], v[2]);
    println!("\n辺 1-2 を追加した後、グラフは");
    graph.print();

    /* 辺を削除 */
    // 頂点 1, 3 は v[0], v[1]
    graph.remove_edge(v[0], v[1]);
    println!("\n辺 1-3 を削除した後、グラフは");
    graph.print();

    /* 頂点を追加 */
    let v5 = Vertex { val: 6 };
    graph.add_vertex(v5);
    println!("\n頂点 6 を追加した後、グラフは");
    graph.print();

    /* 頂点を削除 */
    // 頂点 3 は v[1]
    graph.remove_vertex(v[1]);
    println!("\n頂点 3 を削除した後、グラフは");
    graph.print();
}
