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
    res.push(vet); // 방문한 정점 기록
    visited.insert(vet); // 이 정점을 방문한 것으로 표시
                         // 현재 정점에 인접한 모든 정점 순회
    if let Some(adj_vets) = graph.adj_list.get(&vet) {
        for &adj_vet in adj_vets {
            if visited.contains(&adj_vet) {
                continue; // 이미 방문한 정점은 건너뜀
            }
            // 인접 정점을 재귀적으로 방문
            dfs(graph, visited, res, adj_vet);
        }
    }
}

/* 깊이 우선 순회 */
// 지정한 정점의 인접 정점을 모두 구할 수 있도록 인접 리스트로 그래프 표현
fn graph_dfs(graph: GraphAdjList, start_vet: Vertex) -> Vec<Vertex> {
    // 정점 방문 순서
    let mut res = vec![];
    // 방문한 정점을 기록하는 해시 집합
    let mut visited = HashSet::new();
    dfs(&graph, &mut visited, &mut res, start_vet);

    res
}

/* 실행 예제 */
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
    println!("\n초기화한 그래프:");
    graph.print();

    /* 깊이 우선 순회 */
    let res = graph_dfs(graph, v[0]);
    println!("\n깊이 우선 순회(DFS)의 정점 방문 순서:");
    println!("{:?}", vets_to_vals(res));
}
