/*
 * File: graph_adjacency_list.rs
 * Created Time: 2023-07-12
 * Author: night-cruise (2586447362@qq.com)
 */

include!("../include/vertex.rs");

use std::collections::HashMap;

/* 基於鄰接表實現的無向圖型別 */
pub struct GraphAdjList {
    // 鄰接表，key：頂點，value：該頂點的所有鄰接頂點
    pub adj_list: HashMap<Vertex, Vec<Vertex>>,
}

impl GraphAdjList {
    /* 建構子 */
    pub fn new(edges: Vec<[Vertex; 2]>) -> Self {
        let mut graph = GraphAdjList {
            adj_list: HashMap::new(),
        };
        // 新增所有頂點和邊
        for edge in edges {
            graph.add_vertex(edge[0]);
            graph.add_vertex(edge[1]);
            graph.add_edge(edge[0], edge[1]);
        }

        graph
    }

    /* 獲取頂點數量 */
    #[allow(unused)]
    pub fn size(&self) -> usize {
        self.adj_list.len()
    }

    /* 新增邊 */
    pub fn add_edge(&mut self, vet1: Vertex, vet2: Vertex) {
        if !self.adj_list.contains_key(&vet1) || !self.adj_list.contains_key(&vet2) || vet1 == vet2
        {
            panic!("value error");
        }
        // 新增邊 vet1 - vet2
        self.adj_list.get_mut(&vet1).unwrap().push(vet2);
        self.adj_list.get_mut(&vet2).unwrap().push(vet1);
    }

    /* 刪除邊 */
    #[allow(unused)]
    pub fn remove_edge(&mut self, vet1: Vertex, vet2: Vertex) {
        if !self.adj_list.contains_key(&vet1) || !self.adj_list.contains_key(&vet2) || vet1 == vet2
        {
            panic!("value error");
        }
        // 刪除邊 vet1 - vet2
        self.adj_list
            .get_mut(&vet1)
            .unwrap()
            .retain(|&vet| vet != vet2);
        self.adj_list
            .get_mut(&vet2)
            .unwrap()
            .retain(|&vet| vet != vet1);
    }

    /* 新增頂點 */
    pub fn add_vertex(&mut self, vet: Vertex) {
        if self.adj_list.contains_key(&vet) {
            return;
        }
        // 在鄰接表中新增一個新鏈結串列
        self.adj_list.insert(vet, vec![]);
    }

    /* 刪除頂點 */
    #[allow(unused)]
    pub fn remove_vertex(&mut self, vet: Vertex) {
        if !self.adj_list.contains_key(&vet) {
            panic!("value error");
        }
        // 在鄰接表中刪除頂點 vet 對應的鏈結串列
        self.adj_list.remove(&vet);
        // 走訪其他頂點的鏈結串列，刪除所有包含 vet 的邊
        for list in self.adj_list.values_mut() {
            list.retain(|&v| v != vet);
        }
    }

    /* 列印鄰接表 */
    pub fn print(&self) {
        println!("鄰接表 =");
        for (vertex, list) in &self.adj_list {
            let list = list.iter().map(|vertex| vertex.val).collect::<Vec<i32>>();
            println!("{}: {:?},", vertex.val, list);
        }
    }
}

/* Driver Code */
#[allow(unused)]
fn main() {
    /* 初始化無向圖 */
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
    println!("\n初始化後，圖為");
    graph.print();

    /* 新增邊 */
    // 頂點 1, 2 即 v[0], v[2]
    graph.add_edge(v[0], v[2]);
    println!("\n新增邊 1-2 後，圖為");
    graph.print();

    /* 刪除邊 */
    // 頂點 1, 3 即 v[0], v[1]
    graph.remove_edge(v[0], v[1]);
    println!("\n刪除邊 1-3 後，圖為");
    graph.print();

    /* 新增頂點 */
    let v5 = Vertex { val: 6 };
    graph.add_vertex(v5);
    println!("\n新增頂點 6 後，圖為");
    graph.print();

    /* 刪除頂點 */
    // 頂點 3 即 v[1]
    graph.remove_vertex(v[1]);
    println!("\n刪除頂點 3 後，圖為");
    graph.print();
}
