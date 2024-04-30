/**
 * File: graph_bfs.ts
 * Created Time: 2023-02-21
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

import { GraphAdjList } from './graph_adjacency_list';
import { Vertex } from '../modules/Vertex';

/* 廣度優先走訪 */
// 使用鄰接表來表示圖，以便獲取指定頂點的所有鄰接頂點
function graphBFS(graph: GraphAdjList, startVet: Vertex): Vertex[] {
    // 頂點走訪序列
    const res: Vertex[] = [];
    // 雜湊集合，用於記錄已被訪問過的頂點
    const visited: Set<Vertex> = new Set();
    visited.add(startVet);
    // 佇列用於實現 BFS
    const que = [startVet];
    // 以頂點 vet 為起點，迴圈直至訪問完所有頂點
    while (que.length) {
        const vet = que.shift(); // 佇列首頂點出隊
        res.push(vet); // 記錄訪問頂點
        // 走訪該頂點的所有鄰接頂點
        for (const adjVet of graph.adjList.get(vet) ?? []) {
            if (visited.has(adjVet)) {
                continue; // 跳過已被訪問的頂點
            }
            que.push(adjVet); // 只入列未訪問
            visited.add(adjVet); // 標記該頂點已被訪問
        }
    }
    // 返回頂點走訪序列
    return res;
}

/* Driver Code */
/* 初始化無向圖 */
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
console.log('\n初始化後，圖為');
graph.print();

/* 廣度優先走訪 */
const res = graphBFS(graph, v[0]);
console.log('\n廣度優先走訪（BFS）頂點序列為');
console.log(Vertex.vetsToVals(res));
