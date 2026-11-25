/**
 * File: graph_dfs.ts
 * Created Time: 2023-02-21
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

import { Vertex } from '../modules/Vertex';
import { GraphAdjList } from './graph_adjacency_list';

/* 深度優先走訪的輔助函式 */
function dfs(
    graph: GraphAdjList,
    visited: Set<Vertex>,
    res: Vertex[],
    vet: Vertex
): void {
    res.push(vet); // 記錄走訪的頂點
    visited.add(vet); // 將此頂點標記為已走訪
    // 走訪此頂點的所有相鄰頂點
    for (const adjVet of graph.adjList.get(vet)) {
        if (visited.has(adjVet)) {
            continue; // 略過已走訪的頂點
        }
        // 遞迴走訪相鄰頂點
        dfs(graph, visited, res, adjVet);
    }
}

/* 深度優先走訪 */
// 以鄰接串列表示圖，以便取得指定頂點的所有相鄰頂點
function graphDFS(graph: GraphAdjList, startVet: Vertex): Vertex[] {
    // 頂點走訪順序
    const res: Vertex[] = [];
    // 用雜湊集合記錄已走訪的頂點
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
console.log('\n初始化後的圖為');
graph.print();

/* 深度優先走訪 */
const res = graphDFS(graph, v[0]);
console.log('\n深度優先走訪（DFS）的頂點順序為');
console.log(Vertex.vetsToVals(res));
