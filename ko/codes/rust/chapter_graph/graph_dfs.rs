/*
 * File: graph_dfs.rs
 * Created Time: 2023-07-12
 * Author: night-cruise (2586447362@qq.com)
 */

mod graph_adjacency_list;

use graph_adjacency_list::GraphAdjList;
use graph_adjacency_list::{vals_to_vets, vets_to_vals, Vertex};
use std::collections::HashSet;

/* 깊이 우선 순회 보조 함수 */
fn dfs(graph: &GraphAdjList, visited: &mut HashSet<Vertex>, res: &mut Vec<Vertex>, vet: Vertex) {
    res.push(vet); // 방문한 정점을 기록한다
    visited.insert(vet); // 해당 정점을 방문했다고 표시한다
                         // 해당 정점의 모든 인접 정점을 순회한다
    if let Some(adj_vets) = graph.adj_list.get(&vet) {
        for &adj_vet in adj_vets {
            if visited.contains(&adj_vet) {
                continue; // 이미 방문한 정점은 건너뛴다
            }
            // 인접 정점을 재귀적으로 방문한다
            dfs(graph, visited, res, adj_vet);
        }
    }
}

/* 깊이 우선 순회 */
// 지정한 정점의 모든 인접 정점을 얻기 쉽도록 그래프를 인접 리스트로 표현한다
fn graph_dfs(graph: GraphAdjList, start_vet: Vertex) -> Vec<Vertex> {
    // 정점 순회 순서
    let mut res = vec![];
    // 방문한 정점을 기록하는 해시 집합
    let mut visited = HashSet::new();
    dfs(&graph, &mut visited, &mut res, start_vet);

    res
}

/* 실행 코드 */
fn main() {
    /* 무방향 그래프 초기화 */
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
    println!("\n초기화한 후의 그래프");
    graph.print();

    /* 깊이 우선 순회 */
    let res = graph_dfs(graph, v[0]);
    println!("\n깊이 우선 순회(DFS)의 정점 순서");
    println!("{:?}", vets_to_vals(res));
}
