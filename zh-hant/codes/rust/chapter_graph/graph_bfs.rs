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
// 使用鄰接表來表示圖，以便獲取指定頂點的所有鄰接頂點
fn graph_bfs(graph: GraphAdjList, start_vet: Vertex) -> Vec<Vertex> {
    // 頂點走訪序列
    let mut res = vec![];
    // 雜湊表，用於記錄已被訪問過的頂點
    let mut visited = HashSet::new();
    visited.insert(start_vet);
    // 佇列用於實現 BFS
    let mut que = VecDeque::new();
    que.push_back(start_vet);
    // 以頂點 vet 為起點，迴圈直至訪問完所有頂點
    while !que.is_empty() {
        let vet = que.pop_front().unwrap(); // 佇列首頂點出隊
        res.push(vet); // 記錄訪問頂點

        // 走訪該頂點的所有鄰接頂點
        if let Some(adj_vets) = graph.adj_list.get(&vet) {
            for &adj_vet in adj_vets {
                if visited.contains(&adj_vet) {
                    continue; // 跳過已被訪問的頂點
                }
                que.push_back(adj_vet); // 只入列未訪問的頂點
                visited.insert(adj_vet); // 標記該頂點已被訪問
            }
        }
    }
    // 返回頂點走訪序列
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
    println!("\n初始化後，圖為");
    graph.print();

    /* 廣度優先走訪 */
    let res = graph_bfs(graph, v[0]);
    println!("\n廣度優先走訪（BFS）頂點序列為");
    println!("{:?}", vets_to_vals(res));
}
