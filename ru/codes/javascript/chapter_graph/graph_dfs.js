/**
 * File: graph_dfs.js
 * Created Time: 2023-02-21
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

const { Vertex } = require('../modules/Vertex');
const { GraphAdjList } = require('./graph_adjacency_list');

/* Обход в глубину */
// Использовать список смежности для представления графа, чтобы получить все смежные вершины заданной вершины
function dfs(graph, visited, res, vet) {
    res.push(vet); // Отметить посещенную вершину
    visited.add(vet); // Отметить эту вершину как посещенную
    // Обойти все смежные вершины данной вершины
    for (const adjVet of graph.adjList.get(vet)) {
        if (visited.has(adjVet)) {
            continue; // Пропустить уже посещенную вершину
        }
        // Рекурсивно обходить смежные вершины
        dfs(graph, visited, res, adjVet);
    }
}

/* Обход в глубину */
// Использовать список смежности для представления графа, чтобы получить все смежные вершины заданной вершины
function graphDFS(graph, startVet) {
    // Последовательность обхода вершин
    const res = [];
    // Хеш-множество для хранения уже посещенных вершин
    const visited = new Set();
    dfs(graph, visited, res, startVet);
    return res;
}

/* Driver Code */
/* Инициализация неориентированного графа */
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
console.log('\nГраф после инициализации');
graph.print();

/* Обход в глубину */
const res = graphDFS(graph, v[0]);
console.log('\nПоследовательность вершин при обходе в глубину (DFS)');
console.log(Vertex.vetsToVals(res));
