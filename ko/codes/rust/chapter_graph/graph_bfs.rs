/*
 * File: graph_bfs.rs
 * Created Time: 2023-07-12
 * Author: night-cruise (2586447362@qq.com)
 */

mod graph_adjacency_list;

use graph_adjacency_list::GraphAdjList;
use graph_adjacency_list::{vals_to_vets, vets_to_vals, Vertex};
use std::collections::{HashSet, VecDeque};

/* 너비 우선 순회 */
// 지정한 정점의 모든 인접 정점을 얻기 쉽도록 그래프를 인접 리스트로 표현한다
fn graph_bfs(graph: GraphAdjList, start_vet: Vertex) -> Vec<Vertex> {
    // 정점 순회 순서
    let mut res = vec![];
    // 방문한 정점을 기록하는 해시 집합
    let mut visited = HashSet::new();
    visited.insert(start_vet);
    // 큐를 사용하여 BFS를 구현한다
    let mut que = VecDeque::new();
    que.push_back(start_vet);
    // 정점 vet에서 시작하여 모든 정점을 방문할 때까지 반복한다
    while let Some(vet) = que.pop_front() {
        res.push(vet); // 방문한 정점을 기록한다

        // 해당 정점의 모든 인접 정점을 순회한다
        if let Some(adj_vets) = graph.adj_list.get(&vet) {
            for &adj_vet in adj_vets {
                if visited.contains(&adj_vet) {
                    continue; // 이미 방문한 정점은 건너뛴다
                }
                que.push_back(adj_vet); // 방문하지 않은 정점만 큐에 삽입한다
                visited.insert(adj_vet); // 해당 정점을 방문했다고 표시한다
            }
        }
    }
    // 정점 순회 순서를 반환한다
    res
}

/* 실행 코드 */
fn main() {
    /* 무방향 그래프 초기화 */
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
    println!("\n초기화한 후의 그래프");
    graph.print();

    /* 너비 우선 순회 */
    let res = graph_bfs(graph, v[0]);
    println!("\n너비 우선 순회(BFS)의 정점 순서");
    println!("{:?}", vets_to_vals(res));
}
