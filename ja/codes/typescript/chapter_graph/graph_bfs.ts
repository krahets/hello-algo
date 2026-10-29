/**
 * File: graph_bfs.ts
 * Created Time: 2023-02-21
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

import { GraphAdjList } from './graph_adjacency_list';
import { Vertex } from '../modules/Vertex';

/* 幅優先走査 */
// 指定した頂点に隣接する全頂点を取得しやすいように、グラフを隣接リストで表す
function graphBFS(graph: GraphAdjList, startVet: Vertex): Vertex[] {
    // 頂点の走査順序
    const res: Vertex[] = [];
    // 訪問済みの頂点を記録するハッシュ集合
    const visited: Set<Vertex> = new Set();
    visited.add(startVet);
    // BFS の実装にキューを使う
    const que = [startVet];
    // 頂点 vet を始点として、すべての頂点を訪問するまで繰り返す
    while (que.length) {
        const vet = que.shift(); // キューの先頭の頂点をデキューする
        res.push(vet); // 訪問した頂点を記録する
        // この頂点に隣接する全頂点を走査する
        for (const adjVet of graph.adjList.get(vet) ?? []) {
            if (visited.has(adjVet)) {
                continue; // 訪問済みの頂点をスキップする
            }
            que.push(adjVet); // 未訪問のものだけをエンキューする
            visited.add(adjVet); // この頂点を訪問済みにする
        }
    }
    // 頂点の走査順序を返す
    return res;
}

/* 実行用コード */
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
console.log('\n初期化後のグラフ');
graph.print();

/* 幅優先走査 */
const res = graphBFS(graph, v[0]);
console.log('\n幅優先走査（BFS）の頂点の順序');
console.log(Vertex.vetsToVals(res));
