/*
 * File: graph_adjacency_list.rs
 * Created Time: 2023-07-12
 * Author: night-cruise (2586447362@qq.com)
 */

use std::collections::HashMap;

/* 顶点类型 */
#[derive(Copy, Clone, Hash, PartialEq, Eq)]
pub struct Vertex {
    pub val: i32
}

/* 输入值列表 vals ，返回顶点列表 vets */
pub fn vals_to_vets(vals: Vec<i32>) -> Vec<Vertex> {
    vals.into_iter().map(|val| Vertex { val }).collect()
}

/* 输入顶点列表 vets ，返回值列表 vals */
pub fn vets_to_vals(vets: Vec<Vertex>) -> Vec<i32> {
    vets.into_iter().map(|vet| vet.val).collect()
}

/* 基于邻接表实现的无向图类型 */
pub struct GraphAdjList {
    // 邻接表，key: 顶点，value：该顶点的所有邻接顶点
    pub adj_list: HashMap<Vertex, Vec<Vertex>>,
}

impl GraphAdjList {
    /* 构造方法 */
    pub fn new(edges: Vec<[Vertex; 2]>) -> Self {
        let mut graph = GraphAdjList {
            adj_list: HashMap::new(),
        };
        // 添加所有顶点和边
        for edge in edges {
            graph.add_vertex(edge[0]);
            graph.add_vertex(edge[1]);
            graph.add_edge(edge[0], edge[1]);
        }

        graph
    }

    /* 获取顶点数量 */
    #[allow(unused)]
    pub fn size(&self) -> usize {
        self.adj_list.len()
    }

    /* 添加边 */
    pub fn add_edge(&mut self, vet1: Vertex, vet2: Vertex) {
        if !self.adj_list.contains_key(&vet1) || !self.adj_list.contains_key(&vet2) || vet1 == vet2
        {
            panic!("value error");
        }
        // 添加边 vet1 - vet2
        self.adj_list.get_mut(&vet1).unwrap().push(vet2);
        self.adj_list.get_mut(&vet2).unwrap().push(vet1);
    }

    /* 删除边 */
    #[allow(unused)]
    pub fn remove_edge(&mut self, vet1: Vertex, vet2: Vertex) {
        if !self.adj_list.contains_key(&vet1) || !self.adj_list.contains_key(&vet2) || vet1 == vet2
        {
            panic!("value error");
        }
        // 删除边 vet1 - vet2
        self.adj_list
            .get_mut(&vet1)
            .unwrap()
            .retain(|&vet| vet != vet2);
        self.adj_list
            .get_mut(&vet2)
            .unwrap()
            .retain(|&vet| vet != vet1);
    }

    /* 添加顶点 */
    pub fn add_vertex(&mut self, vet: Vertex) {
        if self.adj_list.contains_key(&vet) {
            return;
        }
        // 在邻接表中添加一个新链表
        self.adj_list.insert(vet, vec![]);
    }

    /* 删除顶点 */
    #[allow(unused)]
    pub fn remove_vertex(&mut self, vet: Vertex) {
        if !self.adj_list.contains_key(&vet) {
            panic!("value error");
        }
        // 在邻接表中删除顶点 vet 对应的链表
        self.adj_list.remove(&vet);
        // 遍历其他顶点的链表，删除所有包含 vet 的边
        for list in self.adj_list.values_mut() {
            list.retain(|&v| v != vet);
        }
    }

    /* 打印邻接表 */
    pub fn print(&self) {
        println!("邻接表 =");
        for (vertex, list) in &self.adj_list {
            let list = list.iter().map(|vertex| vertex.val).collect::<Vec<i32>>();
            println!("{}: {:?},", vertex.val, list);
        }
    }
}

/* Driver Code */
#[allow(unused)]
fn main() {
    /* 初始化无向图 */
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
    println!("\n初始化后，图为");
    graph.print();

    /* 添加边 */
    // 顶点 1, 2 即 v[0], v[2]
    graph.add_edge(v[0], v[2]);
    println!("\n添加边 1-2 后，图为");
    graph.print();

    /* 删除边 */
    // 顶点 1, 3 即 v[0], v[1]
    graph.remove_edge(v[0], v[1]);
    println!("\n删除边 1-3 后，图为");
    graph.print();

    /* 添加顶点 */
    let v5 = Vertex { val: 6 };
    graph.add_vertex(v5);
    println!("\n添加顶点 6 后，图为");
    graph.print();

    /* 删除顶点 */
    // 顶点 3 即 v[1]
    graph.remove_vertex(v[1]);
    println!("\n删除顶点 3 后，图为");
    graph.print();
}