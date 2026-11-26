/**
 * File: graph_dfs.ts
 * Created Time: 2023-02-21
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

import { Vertex } from '../modules/Vertex';
import { GraphAdjList } from './graph_adjacency_list';

/* Вспомогательная функция обхода в глубину */
function dfs(
    graph: GraphAdjList,
    visited: Set<Vertex>,
    res: Vertex[],
    vet: Vertex
): void {
    res.push(vet); // Записать посещённую вершину
    visited.add(vet); // Отметить вершину как посещённую
    // Перебрать всех соседей этой вершины
    for (const adjVet of graph.adjList.get(vet)) {
        if (visited.has(adjVet)) {
            continue; // Пропустить посещённые вершины
        }
        // Рекурсивно посетить соседнюю вершину
        dfs(graph, visited, res, adjVet);
    }
}

/* Обход в глубину */
// Список смежности позволяет получить всех соседей заданной вершины
function graphDFS(graph: GraphAdjList, startVet: Vertex): Vertex[] {
    // Порядок обхода вершин
    const res: Vertex[] = [];
    // Хеш-множество посещённых вершин
    const visited: Set<Vertex> = new Set();
    dfs(graph, visited, res, startVet);
    return res;
}

/* Пример использования */
/* Инициализировать неориентированный граф */
const v = Vertex.valsToVets([0, 1, 2, 3, 4, 5, 6]);
const edges = [
    [v[0], v[1]],
    [v[0], v[3]],
    [v[1], v[2]],
    [v[2], v[5]],
    [v[4], v[5]],
    [v[5], v[6]],
];
const graph = new GraphAdjList(edges);
console.log('\nГраф после инициализации:');
graph.print();

/* Обход в глубину */
const res = graphDFS(graph, v[0]);
console.log('\nПорядок обхода вершин в глубину (DFS):');
console.log(Vertex.vetsToVals(res));
