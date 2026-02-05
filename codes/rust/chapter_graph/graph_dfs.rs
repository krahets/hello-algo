/*
 * File: graph_dfs.rs
 * Created Time: 2023-07-12
 * Author: night-cruise (2586447362@qq.com)
 */

use std::collections::HashSet;

pub type Vertex = i32;
pub type GraphAdjList = hello_algo_rust::graph_adjacency_list::GraphAdjList<Vertex>;

/* 深度优先遍历辅助函数 */
fn dfs(graph: &GraphAdjList, visited: &mut HashSet<Vertex>, res: &mut Vec<Vertex>, vet: Vertex) {
    // 记录访问顶点
    res.push(vet);
    // 标记该顶点已被访问
    visited.insert(vet);
    // 遍历该顶点的所有邻接顶点
    if let Some(adj_vets) = graph.get(&vet) {
        for &adj_vet in adj_vets {
            if visited.contains(&adj_vet) {
                // 跳过已被访问的顶点
                continue;
            }
            // 递归访问邻接顶点
            dfs(graph, visited, res, adj_vet);
        }
    }
}

/* 深度优先遍历 */
// 使用邻接表来表示图，以便获取指定顶点的所有邻接顶点
pub fn graph_dfs(graph: GraphAdjList, start_vet: Vertex) -> Vec<Vertex> {
    // 顶点遍历序列
    let mut res = vec![];
    // 哈希集合，用于记录已被访问过的顶点
    let mut visited = HashSet::new();
    dfs(&graph, &mut visited, &mut res, start_vet);

    res
}

/* Driver Code */
fn main() {
    /* 初始化无向图 */
    let v = [0, 1, 2, 3, 4, 5, 6];
    let edges = vec![
        [v[0], v[1]],
        [v[0], v[3]],
        [v[1], v[2]],
        [v[2], v[5]],
        [v[4], v[5]],
        [v[5], v[6]],
    ];
    let graph = GraphAdjList::new(edges);
    println!("初始化后，图为");
    println!("{graph}");

    println!();

    /* 深度优先遍历 */
    let res = graph_dfs(graph, v[0]);
    println!("深度优先遍历（DFS）顶点序列为");
    println!("{res:?}");
}
