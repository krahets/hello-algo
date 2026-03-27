/**
 * File: graph_bfs.ts
 * Created Time: 2023-02-21
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

import { GraphAdjList } from './graph_adjacency_list';
import { Vertex } from '../modules/Vertex';

/* Обход в ширину */
// Использовать список смежности для представления графа, чтобы получить все смежные вершины заданной вершины
function graphBFS(graph: GraphAdjList, startVet: Vertex): Vertex[] {
    // Последовательность обхода вершин
    const res: Vertex[] = [];
    // Хеш-множество для хранения уже посещенных вершин
    const visited: Set<Vertex> = new Set();
    visited.add(startVet);
    // Очередь используется для реализации BFS
    const que = [startVet];
    // Начиная с вершины vet, продолжать цикл, пока не будут посещены все вершины
    while (que.length) {
        const vet = que.shift(); // Извлечь головную вершину из очереди
        res.push(vet); // Отметить посещенную вершину
        // Обойти все смежные вершины данной вершины
        for (const adjVet of graph.adjList.get(vet) ?? []) {
            if (visited.has(adjVet)) {
                continue; // Пропустить уже посещенную вершину
            }
            que.push(adjVet); // Помещать в очередь только непосещенные вершины
            visited.add(adjVet); // Отметить эту вершину как посещенную
        }
    }
    // Вернуть последовательность обхода вершин
    return res;
}

/* Driver Code */
/* Инициализация неориентированного графа */
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
console.log('\nПосле инициализации граф имеет вид');
graph.print();

/* Обход в ширину */
const res = graphBFS(graph, v[0]);
console.log('\nПоследовательность вершин при обходе в ширину (BFS)');
console.log(Vertex.vetsToVals(res));
