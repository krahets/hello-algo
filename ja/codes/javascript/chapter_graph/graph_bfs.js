/**
 * File: graph_bfs.js
 * Created Time: 2023-02-21
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

const { GraphAdjList } = require('./graph_adjacency_list');
const { Vertex } = require('../modules/Vertex');

/* 幅優先探索 */
// 指定した頂点の隣接頂点をすべて取得できるよう、グラフを隣接リストで表す
function graphBFS(graph, startVet) {
    // 頂点の訪問順
    const res = [];
    // 訪問済みの頂点を記録するハッシュ集合
    const visited = new Set();
    visited.add(startVet);
    // BFS にキューを使う
    const que = [startVet];
    // 頂点 vet から開始し、すべての頂点を訪問するまで繰り返す
    while (que.length) {
        const vet = que.shift(); // キューの先頭から頂点を取り出す
        res.push(vet); // 訪問した頂点を記録する
        // この頂点の隣接頂点をすべて調べる
        for (const adjVet of graph.adjList.get(vet) ?? []) {
            if (visited.has(adjVet)) {
                continue; // 訪問済みの頂点を飛ばす
            }
            que.push(adjVet); // 未訪問の頂点だけをキューに追加する
            visited.add(adjVet); // この頂点を訪問済みにする
        }
    }
    // 頂点を訪問順に返す
    return res;
}

/* 実行例 */
/* 無向グラフを初期化する */
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
console.log('\n初期化後のグラフ：');
graph.print();

/* 幅優先探索 */
const res = graphBFS(graph, v[0]);
console.log('\n幅優先探索（BFS）での頂点の訪問順：');
console.log(Vertex.vetsToVals(res));
