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
    res.push(vet); // Отметить посещенную вершину
    visited.insert(vet); // Отметить эту вершину как посещенную
                         // Обойти все смежные вершины данной вершины
    if let Some(adj_vets) = graph.adj_list.get(&vet) {
        for &adj_vet in adj_vets {
            if visited.contains(&adj_vet) {
                continue; // Пропустить уже посещенную вершину
            }
            // Рекурсивно обходить смежные вершины
            dfs(graph, visited, res, adj_vet);
        }
    }
}

/* Обход в глубину */
// Использовать список смежности для представления графа, чтобы получить все смежные вершины заданной вершины
fn graph_dfs(graph: GraphAdjList, start_vet: Vertex) -> Vec<Vertex> {
    // Последовательность обхода вершин
    let mut res = vec![];
    // Хеш-множество для хранения уже посещенных вершин
    let mut visited = HashSet::new();
    dfs(&graph, &mut visited, &mut res, start_vet);

    res
}

/* Driver Code */
fn main() {
    /* Инициализация неориентированного графа */
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
    println!("\nГраф после инициализации");
    graph.print();

    /* Обход в глубину */
    let res = graph_dfs(graph, v[0]);
    println!("\nПоследовательность вершин при обходе в глубину (DFS)");
    println!("{:?}", vets_to_vals(res));
}
