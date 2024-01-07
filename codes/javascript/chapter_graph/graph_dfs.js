/**
 * File: graph_dfs.js
 * Created Time: 2023-02-21
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

const { Vertex } = require('../modules/Vertex');
const { GraphAdjList } = require('./graph_adjacency_list');

/* 深度优先遍历 */
// 使用邻接表来表示图，以便获取指定顶点的所有邻接顶点
function dfs(graph, visited, res, vet) {
    res.push(vet); // 记录访问顶点
    visited.add(vet); // 标记该顶点已被访问
    // 遍历该顶点的所有邻接顶点
    for (const adjVet of graph.adjList.get(vet)) {
        if (visited.has(adjVet)) {
            continue; // 跳过已被访问的顶点
        }
        // 递归访问邻接顶点
        dfs(graph, visited, res, adjVet);
    }
}

/* 深度优先遍历 */
// 使用邻接表来表示图，以便获取指定顶点的所有邻接顶点
function graphDFS(graph, startVet) {
    // 顶点遍历序列
    const res = [];
    // 哈希表，用于记录已被访问过的顶点
    const visited = new Set();
    dfs(graph, visited, res, startVet);
    return res;
}

/* Driver Code */
/* 初始化无向图 */
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
console.log('\n初始化后，图为');
graph.print();

/* 深度优先遍历 */
const res = graphDFS(graph, v[0]);
console.log('\n深度优先遍历（DFS）顶点序列为');
console.log(Vertex.vetsToVals(res));
