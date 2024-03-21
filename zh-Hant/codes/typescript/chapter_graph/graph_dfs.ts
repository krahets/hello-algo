/**
 * File: graph_dfs.ts
 * Created Time: 2023-02-21
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

import { Vertex } from '../modules/Vertex';
import { GraphAdjList } from './graph_adjacency_list';

/* 深度優先走訪輔助函式 */
function dfs(
    graph: GraphAdjList,
    visited: Set<Vertex>,
    res: Vertex[],
    vet: Vertex
): void {
    res.push(vet); // 記錄訪問頂點
    visited.add(vet); // 標記該頂點已被訪問
    // 走訪該頂點的所有鄰接頂點
    for (const adjVet of graph.adjList.get(vet)) {
        if (visited.has(adjVet)) {
            continue; // 跳過已被訪問的頂點
        }
        // 遞迴訪問鄰接頂點
        dfs(graph, visited, res, adjVet);
    }
}

/* 深度優先走訪 */
// 使用鄰接表來表示圖，以便獲取指定頂點的所有鄰接頂點
function graphDFS(graph: GraphAdjList, startVet: Vertex): Vertex[] {
    // 頂點走訪序列
    const res: Vertex[] = [];
    // 雜湊表，用於記錄已被訪問過的頂點
    const visited: Set<Vertex> = new Set();
    dfs(graph, visited, res, startVet);
    return res;
}

/* Driver Code */
/* 初始化無向圖 */
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
console.log('\n初始化後，圖為');
graph.print();

/* 深度優先走訪 */
const res = graphDFS(graph, v[0]);
console.log('\n深度優先走訪（DFS）頂點序列為');
console.log(Vertex.vetsToVals(res));
