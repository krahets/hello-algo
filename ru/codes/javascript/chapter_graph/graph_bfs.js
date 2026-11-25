/**
 * File: graph_bfs.js
 * Created Time: 2023-02-21
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

const { GraphAdjList } = require('./graph_adjacency_list');
const { Vertex } = require('../modules/Vertex');

/* Обход в ширину */
// Список смежности позволяет получить всех соседей заданной вершины
function graphBFS(graph, startVet) {
    // Порядок обхода вершин
    const res = [];
    // Хеш-множество посещённых вершин
    const visited = new Set();
    visited.add(startVet);
    // Очередь для обхода BFS
    const que = [startVet];
    // Начать с вершины vet и повторять, пока не будут посещены все вершины
    while (que.length) {
        const vet = que.shift(); // Извлечь первую вершину из очереди
        res.push(vet); // Записать посещённую вершину
        // Перебрать всех соседей этой вершины
        for (const adjVet of graph.adjList.get(vet) ?? []) {
            if (visited.has(adjVet)) {
                continue; // Пропустить посещённые вершины
            }
            que.push(adjVet); // Добавить в очередь только непосещённые вершины
            visited.add(adjVet); // Отметить вершину как посещённую
        }
    }
    // Вернуть порядок обхода вершин
    return res;
}

/* Пример использования */
/* Инициализировать неориентированный граф */
const v = Vertex.valsToVets([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]);
const edges = [
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
const graph = new GraphAdjList(edges);
console.log('\nГраф после инициализации:');
graph.print();

/* Обход в ширину */
const res = graphBFS(graph, v[0]);
console.log('\nПорядок обхода вершин в ширину (BFS):');
console.log(Vertex.vetsToVals(res));
