/**
 * File: graph_dfs.ts
 * Created Time: 2023-02-21
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

import { Vertex } from '../modules/Vertex';
import { GraphAdjList } from './graph_adjacency_list';

/* 深さ優先走査の補助関数 */
function dfs(
    graph: GraphAdjList,
    visited: Set<Vertex>,
    res: Vertex[],
    vet: Vertex
): void {
    res.push(vet); // 訪問した頂点を記録
    visited.add(vet); // この頂点を訪問済みにする
    // この頂点のすべての隣接頂点を走査
    for (const adjVet of graph.adjList.get(vet)) {
        if (visited.has(adjVet)) {
            continue; // 訪問済みの頂点をスキップ
        }
        // 隣接頂点を再帰的に訪問
        dfs(graph, visited, res, adjVet);
    }
}

/* 深さ優先探索 */
// グラフを隣接リストで表し、指定した頂点の隣接頂点をすべて取得できるようにする
function graphDFS(graph: GraphAdjList, startVet: Vertex): Vertex[] {
    // 頂点の走査順序
    const res: Vertex[] = [];
    // 訪問済み頂点を記録するためのハッシュ集合
    const visited: Set<Vertex> = new Set();
    dfs(graph, visited, res, startVet);
    return res;
}

/* Driver Code */
/* 無向グラフを初期化 */
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
console.log('\n初期化後、グラフは');
graph.print();

/* 深さ優先探索 */
const res = graphDFS(graph, v[0]);
console.log('\n深さ優先探索（DFS）の頂点列は');
console.log(Vertex.vetsToVals(res));
