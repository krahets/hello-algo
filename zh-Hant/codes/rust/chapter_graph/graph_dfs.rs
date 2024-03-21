/*
 * File: graph_dfs.rs
 * Created Time: 2023-07-12
 * Author: night-cruise (2586447362@qq.com)
 */

mod graph_adjacency_list;

use graph_adjacency_list::GraphAdjList;
use graph_adjacency_list::{vals_to_vets, vets_to_vals, Vertex};
use std::collections::HashSet;

/* 深度優先走訪輔助函式 */
fn dfs(graph: &GraphAdjList, visited: &mut HashSet<Vertex>, res: &mut Vec<Vertex>, vet: Vertex) {
    res.push(vet); // 記錄訪問頂點
    visited.insert(vet); // 標記該頂點已被訪問
                         // 走訪該頂點的所有鄰接頂點
    if let Some(adj_vets) = graph.adj_list.get(&vet) {
        for &adj_vet in adj_vets {
            if visited.contains(&adj_vet) {
                continue; // 跳過已被訪問的頂點
            }
            // 遞迴訪問鄰接頂點
            dfs(graph, visited, res, adj_vet);
        }
    }
}

/* 深度優先走訪 */
// 使用鄰接表來表示圖，以便獲取指定頂點的所有鄰接頂點
fn graph_dfs(graph: GraphAdjList, start_vet: Vertex) -> Vec<Vertex> {
    // 頂點走訪序列
    let mut res = vec![];
    // 雜湊表，用於記錄已被訪問過的頂點
    let mut visited = HashSet::new();
    dfs(&graph, &mut visited, &mut res, start_vet);

    res
}

/* Driver Code */
fn main() {
    /* 初始化無向圖 */
    let v = vals_to_vets(vec![0, 1, 2, 3, 4, 5, 6]);
    let edges = vec![
        [v[0], v[1]],
        [v[0], v[3]],
        [v[1], v[2]],
        [v[2], v[5]],
        [v[4], v[5]],
        [v[5], v[6]],
    ];
    let graph = GraphAdjList::new(edges);
    println!("\n初始化後，圖為");
    graph.print();

    /* 深度優先走訪 */
    let res = graph_dfs(graph, v[0]);
    println!("\n深度優先走訪（DFS）頂點序列為");
    println!("{:?}", vets_to_vals(res));
}
