/*
 * File: graph_bfs.rs
 * Created Time: 2023-07-12
 * Author: night-cruise (2586447362@qq.com)
 */

mod graph_adjacency_list;

use graph_adjacency_list::GraphAdjList;
use graph_adjacency_list::{vals_to_vets, vets_to_vals, Vertex};
use std::collections::{HashSet, VecDeque};

/* 幅優先走査 */
// 指定した頂点に隣接する全頂点を取得しやすいように、グラフを隣接リストで表す
fn graph_bfs(graph: GraphAdjList, start_vet: Vertex) -> Vec<Vertex> {
    // 頂点の走査順序
    let mut res = vec![];
    // 訪問済みの頂点を記録するハッシュ集合
    let mut visited = HashSet::new();
    visited.insert(start_vet);
    // BFS の実装にキューを使う
    let mut que = VecDeque::new();
    que.push_back(start_vet);
    // 頂点 vet を始点として、すべての頂点を訪問するまで繰り返す
    while let Some(vet) = que.pop_front() {
        res.push(vet); // 訪問した頂点を記録する

        // この頂点に隣接する全頂点を走査する
        if let Some(adj_vets) = graph.adj_list.get(&vet) {
            for &adj_vet in adj_vets {
                if visited.contains(&adj_vet) {
                    continue; // 訪問済みの頂点をスキップする
                }
                que.push_back(adj_vet); // 未訪問の頂点だけをエンキューする
                visited.insert(adj_vet); // この頂点を訪問済みにする
            }
        }
    }
    // 頂点の走査順序を返す
    res
}

/* 実行用コード */
fn main() {
    /* 無向グラフを初期化する */
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
    println!("\n初期化後のグラフ");
    graph.print();

    /* 幅優先走査 */
    let res = graph_bfs(graph, v[0]);
    println!("\n幅優先走査（BFS）の頂点の順序");
    println!("{:?}", vets_to_vals(res));
}
