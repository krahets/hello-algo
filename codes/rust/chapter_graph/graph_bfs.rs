/*
 * File: graph_bfs.rs
 * Created Time: 2023-07-12
 * Author: night-cruise (2586447362@qq.com)
 */

mod graph_adjacency_list;

use graph_adjacency_list::GraphAdjList;
use graph_adjacency_list::{vals_to_vets, vets_to_vals, Vertex};
use std::collections::{HashSet, VecDeque};

/* 广度优先遍历 */
// 使用邻接表来表示图，以便获取指定顶点的所有邻接顶点
fn graph_bfs(graph: GraphAdjList, start_vet: Vertex) -> Vec<Vertex> {
    // 顶点遍历序列
    let mut res = vec![];
    // 哈希集合，用于记录已被访问过的顶点
    let mut visited = HashSet::new();
    visited.insert(start_vet);
    // 队列用于实现 BFS
    let mut que = VecDeque::new();
    que.push_back(start_vet);
    // 以顶点 vet 为起点，循环直至访问完所有顶点
    while !que.is_empty() {
        let vet = que.pop_front().unwrap(); // 队首顶点出队
        res.push(vet); // 记录访问顶点

        // 遍历该顶点的所有邻接顶点
        if let Some(adj_vets) = graph.adj_list.get(&vet) {
            for &adj_vet in adj_vets {
                if visited.contains(&adj_vet) {
                    continue; // 跳过已被访问的顶点
                }
                que.push_back(adj_vet); // 只入队未访问的顶点
                visited.insert(adj_vet); // 标记该顶点已被访问
            }
        }
    }
    // 返回顶点遍历序列
    res
}

/* Driver Code */
fn main() {
    /* 初始化无向图 */
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
    println!("\n初始化后，图为");
    graph.print();

    /* 广度优先遍历 */
    let res = graph_bfs(graph, v[0]);
    println!("\n广度优先遍历（BFS）顶点序列为");
    println!("{:?}", vets_to_vals(res));
}
