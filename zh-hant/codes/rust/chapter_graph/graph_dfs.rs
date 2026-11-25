/*
 * File: graph_dfs.rs
 * Created Time: 2023-07-12
 * Author: night-cruise (2586447362@qq.com)
 */

mod graph_adjacency_list;

use graph_adjacency_list::GraphAdjList;
use graph_adjacency_list::{vals_to_vets, vets_to_vals, Vertex};
use std::collections::HashSet;

/* 深度優先走訪的輔助函式 */
fn dfs(graph: &GraphAdjList, visited: &mut HashSet<Vertex>, res: &mut Vec<Vertex>, vet: Vertex) {
    res.push(vet); // 記錄走訪的頂點
    visited.insert(vet); // 將此頂點標記為已走訪
                         // 走訪此頂點的所有相鄰頂點
    if let Some(adj_vets) = graph.adj_list.get(&vet) {
        for &adj_vet in adj_vets {
            if visited.contains(&adj_vet) {
                continue; // 略過已走訪的頂點
            }
            // 遞迴走訪相鄰頂點
            dfs(graph, visited, res, adj_vet);
        }
    }
}

/* 深度優先走訪 */
// 以鄰接串列表示圖，以便取得指定頂點的所有相鄰頂點
fn graph_dfs(graph: GraphAdjList, start_vet: Vertex) -> Vec<Vertex> {
    // 頂點走訪順序
    let mut res = vec![];
    // 用雜湊集合記錄已走訪的頂點
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
    println!("\n初始化後的圖為");
    graph.print();

    /* 深度優先走訪 */
    let res = graph_dfs(graph, v[0]);
    println!("\n深度優先走訪（DFS）的頂點順序為");
    println!("{:?}", vets_to_vals(res));
}
