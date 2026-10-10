/*
 * File: graph_dfs.rs
 * Created Time: 2023-07-12
 * Author: night-cruise (2586447362@qq.com)
 */

mod graph_adjacency_list;

use graph_adjacency_list::GraphAdjList;
use graph_adjacency_list::{vals_to_vets, vets_to_vals, Vertex};
use std::collections::HashSet;

/* 深さ優先走査の補助関数 */
fn dfs(graph: &GraphAdjList, visited: &mut HashSet<Vertex>, res: &mut Vec<Vertex>, vet: Vertex) {
    res.push(vet); // 訪問した頂点を記録
    visited.insert(vet); // この頂点を訪問済みにする
                         // この頂点のすべての隣接頂点を走査
    if let Some(adj_vets) = graph.adj_list.get(&vet) {
        for &adj_vet in adj_vets {
            if visited.contains(&adj_vet) {
                continue; // 訪問済みの頂点をスキップ
            }
            // 隣接頂点を再帰的に訪問
            dfs(graph, visited, res, adj_vet);
        }
    }
}

/* 深さ優先探索 */
// グラフを隣接リストで表し、指定した頂点の隣接頂点をすべて取得できるようにする
fn graph_dfs(graph: GraphAdjList, start_vet: Vertex) -> Vec<Vertex> {
    // 頂点の走査順序
    let mut res = vec![];
    // 訪問済み頂点を記録するためのハッシュ集合
    let mut visited = HashSet::new();
    dfs(&graph, &mut visited, &mut res, start_vet);

    res
}

/* Driver Code */
fn main() {
    /* 無向グラフを初期化 */
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
    println!("\n初期化後、グラフは");
    graph.print();

    /* 深さ優先探索 */
    let res = graph_dfs(graph, v[0]);
    println!("\n深さ優先探索（DFS）の頂点順序は");
    println!("{:?}", vets_to_vals(res));
}
