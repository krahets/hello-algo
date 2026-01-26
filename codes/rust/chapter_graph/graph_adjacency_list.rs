/*
 * File: graph_adjacency_list.rs
 * Created Time: 2023-07-12
 * Author: night-cruise (2586447362@qq.com)
 */

use std::collections::{HashMap, HashSet};

pub type Vertex = i32;

/* 基于邻接表实现的无向图类型 */
pub struct GraphAdjList {
    // 邻接表，key：顶点，value：该顶点的所有邻接顶点
    // 这里不使用 Vec，因为 HashSet 可以自动去重，且添加和删除顶点的时间复杂度为 O(1)。
    // 而使用 Vec 时，如果不去重，添加顶点的时间复杂度为 O(1)，但空间开销会增大，如果去重，
    // 添加顶点的时间复杂度为 O(n)，不管哪种情况，其删除顶点的时间复杂度都为 O(n)。
    adj_list: HashMap<Vertex, HashSet<Vertex>>,
}

impl GraphAdjList {
    /* 构造方法 */
    pub fn new(edges: Vec<[Vertex; 2]>) -> Self {
        let adj_list = HashMap::new();
        let mut graph = Self { adj_list };
        // 添加所有顶点和边
        for [vet1, vet2] in edges {
            // 添加边的时候会自动添加顶点
            graph.add_edge(vet1, vet2);
        }
        graph
    }

    /* 获取顶点数量 */
    pub fn size(&self) -> usize {
        self.adj_list.len()
    }

    /* 获取顶点的所有邻居的引用 */
    pub fn get(&self, vet: &Vertex) -> Option<&HashSet<Vertex>> {
        self.adj_list.get(vet)
    }

    /* 获取顶点的所有邻居的可变引用 */
    pub fn get_mut(&mut self, vet: &Vertex) -> Option<&mut HashSet<Vertex>> {
        self.adj_list.get_mut(vet)
    }

    /* 添加边 */
    pub fn add_edge(&mut self, vet1: Vertex, vet2: Vertex) {
        if vet1 == vet2 {
            // 相等时不应视为错误，而应视为 noop
            return;
        }
        // 添加边 vet1 - vet2
        self.adj_list.entry(vet1).or_default().insert(vet2);
        self.adj_list.entry(vet2).or_default().insert(vet1);
    }

    /* 删除边 */
    pub fn remove_edge(&mut self, vet1: &Vertex, vet2: &Vertex) {
        if vet1 == vet2 {
            return;
        }
        // 删除边 vet1 - vet2
        if let Some(neighbors) = self.adj_list.get_mut(vet1) {
            neighbors.remove(vet2);
        }
        if let Some(neighbors) = self.adj_list.get_mut(vet2) {
            neighbors.remove(vet1);
        }
    }

    /* 添加顶点 */
    pub fn add_vertex(&mut self, vet: Vertex) {
        // 在邻接表中添加一个新链表
        self.adj_list.entry(vet).or_default();
    }

    /* 删除顶点 */
    pub fn remove_vertex(&mut self, vet: &Vertex) {
        // 在邻接表中删除顶点 vet 对应的链表
        if let Some(neighbors) = self.adj_list.remove(vet) {
            for neighbor in &neighbors {
                // 遍历 vet 的邻居，删除所有包含 vet 的边
                if let Some(neighbors) = self.adj_list.get_mut(neighbor) {
                    neighbors.remove(vet);
                }
            }
        }
    }

    /* 打印邻接表 */
    pub fn print(&self) {
        if self.adj_list.is_empty() {
            println!("[]");
            return;
        }
        println!("[");
        for (vet, neighbors) in &self.adj_list {
            print!("  {vet}: ");
            let mut iter = neighbors.iter();
            let Some(first) = iter.next() else {
                println!("[]");
                continue;
            };
            print!("[{first}");
            for neighbor in iter {
                print!(", {neighbor}");
            }
            println!("]");
        }
        println!("]");
    }
}

/* Driver Code */
fn main() {
    /* 初始化无向图 */
    let v = [1, 3, 2, 5, 4];
    let edges = vec![
        [v[0], v[1]],
        [v[0], v[3]],
        [v[1], v[2]],
        [v[2], v[3]],
        [v[2], v[4]],
        [v[3], v[4]],
    ];

    let mut graph = GraphAdjList::new(edges);
    println!("初始化后，图为");
    graph.print();

    println!();

    /* 添加边 */
    // 顶点 1, 2 即 v[0], v[2]
    graph.add_edge(v[0], v[2]);
    println!("添加边 1-2 后，图为");
    graph.print();

    println!();

    /* 删除边 */
    // 顶点 1, 3 即 v[0], v[1]
    graph.remove_edge(&v[0], &v[1]);
    println!("删除边 1-3 后，图为");
    graph.print();

    println!();

    /* 添加顶点 */
    let v5 = 6;
    graph.add_vertex(v5);
    println!("添加顶点 6 后，图为");
    graph.print();

    println!();

    /* 删除顶点 */
    // 顶点 3 即 v[1]
    graph.remove_vertex(&v[1]);
    println!("删除顶点 3 后，图为");
    graph.print();
}
