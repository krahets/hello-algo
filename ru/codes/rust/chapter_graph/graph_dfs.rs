/*
 * File: graph_dfs.rs
 * Created Time: 2023-07-12
 * Author: night-cruise (2586447362@qq.com)
 */

mod graph_adjacency_list;

use graph_adjacency_list::GraphAdjList;
use graph_adjacency_list::{vals_to_vets, vets_to_vals, Vertex};
use std::collections::HashSet;

/* Вспомогательная функция обхода в глубину */
fn dfs(graph: &GraphAdjList, visited: &mut HashSet<Vertex>, res: &mut Vec<Vertex>, vet: Vertex) {
    res.push(vet); // Записать посещённую вершину
    visited.insert(vet); // Отметить вершину как посещённую
                         // Перебрать всех соседей этой вершины
    if let Some(adj_vets) = graph.adj_list.get(&vet) {
        for &adj_vet in adj_vets {
            if visited.contains(&adj_vet) {
                continue; // Пропустить посещённые вершины
            }
            // Рекурсивно посетить соседнюю вершину
            dfs(graph, visited, res, adj_vet);
        }
    }
}

/* Обход в глубину */
// Список смежности позволяет получить всех соседей заданной вершины
fn graph_dfs(graph: GraphAdjList, start_vet: Vertex) -> Vec<Vertex> {
    // Порядок обхода вершин
    let mut res = vec![];
    // Хеш-множество посещённых вершин
    let mut visited = HashSet::new();
    dfs(&graph, &mut visited, &mut res, start_vet);

    res
}

/* Пример использования */
fn main() {
    /* Инициализировать неориентированный граф */
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
    println!("\nГраф после инициализации:");
    graph.print();

    /* Обход в глубину */
    let res = graph_dfs(graph, v[0]);
    println!("\nПорядок обхода вершин в глубину (DFS):");
    println!("{:?}", vets_to_vals(res));
}
