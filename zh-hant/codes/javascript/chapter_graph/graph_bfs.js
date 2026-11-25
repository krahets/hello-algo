/**
 * File: graph_bfs.js
 * Created Time: 2023-02-21
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

const { GraphAdjList } = require('./graph_adjacency_list');
const { Vertex } = require('../modules/Vertex');

/* 廣度優先走訪 */
// 以鄰接串列表示圖，以便取得指定頂點的所有相鄰頂點
function graphBFS(graph, startVet) {
    // 頂點走訪順序
    const res = [];
    // 用雜湊集合記錄已走訪的頂點
    const visited = new Set();
    visited.add(startVet);
    // 使用佇列實作 BFS
    const que = [startVet];
    // 從頂點 vet 出發，反覆執行，直到走訪完所有頂點
    while (que.length) {
        const vet = que.shift(); // 取出佇列前端的頂點
        res.push(vet); // 記錄走訪的頂點
        // 走訪此頂點的所有相鄰頂點
        for (const adjVet of graph.adjList.get(vet) ?? []) {
            if (visited.has(adjVet)) {
                continue; // 略過已走訪的頂點
            }
            que.push(adjVet); // 只將尚未走訪的頂點加入佇列
            visited.add(adjVet); // 將此頂點標記為已走訪
        }
    }
    // 回傳頂點的走訪順序
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
console.log('\n初始化後的圖為');
graph.print();

/* 廣度優先走訪 */
const res = graphBFS(graph, v[0]);
console.log('\n廣度優先走訪（BFS）的頂點順序為');
console.log(Vertex.vetsToVals(res));
