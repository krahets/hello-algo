/**
 * File: graph_bfs.ts
 * Created Time: 2023-02-21
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

import { GraphAdjList } from './graph_adjacency_list';
import { Vertex } from '../modules/Vertex';

/* 广度优先遍历 */
// 使用邻接表来表示图，以便获取指定顶点的所有邻接顶点
function graphBFS(graph: GraphAdjList, startVet: Vertex): Vertex[] {
    // 顶点遍历序列
    const res: Vertex[] = [];
    // 哈希表，用于记录已被访问过的顶点
    const visited: Set<Vertex> = new Set();
    visited.add(startVet);
    // 队列用于实现 BFS
    const que = [startVet];
    // 以顶点 vet 为起点，循环直至访问完所有顶点
    while (que.length) {
        const vet = que.shift(); // 队首顶点出队
        res.push(vet); // 记录访问顶点
        // 遍历该顶点的所有邻接顶点
        for (const adjVet of graph.adjList.get(vet) ?? []) {
            if (visited.has(adjVet)) {
                continue; // 跳过已被访问的顶点
            }
            que.push(adjVet); // 只入队未访问
            visited.add(adjVet); // 标记该顶点已被访问
        }
    }
    // 返回顶点遍历序列
    return res;
}

/* Driver Code */
/* 初始化无向图 */
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
console.log('\n初始化后，图为');
graph.print();

/* 广度优先遍历 */
const res = graphBFS(graph, v[0]);
console.log('\n广度优先遍历（BFS）顶点序列为');
console.log(Vertex.vetsToVals(res));
