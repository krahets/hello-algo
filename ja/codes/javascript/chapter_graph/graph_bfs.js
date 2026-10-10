/**
 * File: graph_bfs.js
 * Created Time: 2023-02-21
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

const { GraphAdjList } = require('./graph_adjacency_list');
const { Vertex } = require('../modules/Vertex');

/* 幅優先探索 */
// グラフを隣接リストで表し、指定した頂点の隣接頂点をすべて取得できるようにする
function graphBFS(graph, startVet) {
    // 頂点の走査順序
    const res = [];
    // 訪問済み頂点を記録するためのハッシュ集合
    const visited = new Set();
    visited.add(startVet);
    // BFS の実装にキューを用いる
    const que = [startVet];
    // 頂点 vet を起点に、すべての頂点を訪問し終えるまで繰り返す
    while (que.length) {
        const vet = que.shift(); // 先頭の頂点をデキュー
        res.push(vet); // 訪問した頂点を記録
        // この頂点のすべての隣接頂点を走査
        for (const adjVet of graph.adjList.get(vet) ?? []) {
            if (visited.has(adjVet)) {
                continue; // 訪問済みの頂点をスキップ
            }
            que.push(adjVet); // 未訪問の頂点のみをキューに追加
            visited.add(adjVet); // この頂点を訪問済みにする
        }
    }
    // 頂点の走査順を返す
    return res;
}

/* Driver Code */
/* 無向グラフを初期化 */
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
console.log('\n初期化後のグラフは');
graph.print();

/* 幅優先探索 */
const res = graphBFS(graph, v[0]);
console.log('\n幅優先探索（BFS）の頂点列は');
console.log(Vertex.vetsToVals(res));
