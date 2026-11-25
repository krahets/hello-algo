/*
 * File: graph_bfs.rs
 * Created Time: 2023-07-12
 * Author: night-cruise (2586447362@qq.com)
 */

mod graph_adjacency_list;

use graph_adjacency_list::GraphAdjList;
use graph_adjacency_list::{vals_to_vets, vets_to_vals, Vertex};
use std::collections::{HashSet, VecDeque};

/* Обход в ширину */
// Список смежности позволяет получить всех соседей заданной вершины
fn graph_bfs(graph: GraphAdjList, start_vet: Vertex) -> Vec<Vertex> {
    // Порядок обхода вершин
    let mut res = vec![];
    // Хеш-множество посещённых вершин
    let mut visited = HashSet::new();
    visited.insert(start_vet);
    // Очередь для обхода BFS
    let mut que = VecDeque::new();
    que.push_back(start_vet);
    // Начать с вершины vet и повторять, пока не будут посещены все вершины
    while let Some(vet) = que.pop_front() {
        res.push(vet); // Записать посещённую вершину

        // Перебрать всех соседей этой вершины
        if let Some(adj_vets) = graph.adj_list.get(&vet) {
            for &adj_vet in adj_vets {
                if visited.contains(&adj_vet) {
                    continue; // Пропустить посещённые вершины
                }
                que.push_back(adj_vet); // Добавить в очередь только непосещённые вершины
                visited.insert(adj_vet); // Отметить вершину как посещённую
            }
        }
    }
    // Вернуть порядок обхода вершин
    res
}

/* Пример использования */
fn main() {
    /* Инициализировать неориентированный граф */
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
    println!("\nГраф после инициализации:");
    graph.print();

    /* Обход в ширину */
    let res = graph_bfs(graph, v[0]);
    println!("\nПорядок обхода вершин в ширину (BFS):");
    println!("{:?}", vets_to_vals(res));
}
