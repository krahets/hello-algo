/*
 * File: graph_bfs.rs
 * Created Time: 2023-07-12
 * Author: night-cruise (2586447362@qq.com)
 */

mod graph_adjacency_list;

use graph_adjacency_list::GraphAdjList;
use graph_adjacency_list::{vals_to_vets, vets_to_vals, Vertex};
use std::collections::{HashSet, VecDeque};

/* 廣度優先走訪 */
// 以鄰接串列表示圖，以便取得指定頂點的所有相鄰頂點
fn graph_bfs(graph: GraphAdjList, start_vet: Vertex) -> Vec<Vertex> {
    // 頂點走訪順序
    let mut res = vec![];
    // 用雜湊集合記錄已走訪的頂點
    let mut visited = HashSet::new();
    visited.insert(start_vet);
    // 使用佇列實作 BFS
    let mut que = VecDeque::new();
    que.push_back(start_vet);
    // 從頂點 vet 出發，反覆執行，直到走訪完所有頂點
    while let Some(vet) = que.pop_front() {
        res.push(vet); // 記錄走訪的頂點

        // 走訪此頂點的所有相鄰頂點
        if let Some(adj_vets) = graph.adj_list.get(&vet) {
            for &adj_vet in adj_vets {
                if visited.contains(&adj_vet) {
                    continue; // 略過已走訪的頂點
                }
                que.push_back(adj_vet); // 只將尚未走訪的頂點加入佇列
                visited.insert(adj_vet); // 將此頂點標記為已走訪
            }
        }
    }
    // 回傳頂點的走訪順序
    res
}

/* Driver Code */
fn main() {
    /* 初始化無向圖 */
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
    println!("\n初始化後的圖為");
    graph.print();

    /* 廣度優先走訪 */
    let res = graph_bfs(graph, v[0]);
    println!("\n廣度優先走訪（BFS）的頂點順序為");
    println!("{:?}", vets_to_vals(res));
}
