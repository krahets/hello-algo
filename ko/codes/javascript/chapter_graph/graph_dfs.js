/**
 * File: graph_dfs.js
 * Created Time: 2023-02-21
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

const { Vertex } = require('../modules/Vertex');
const { GraphAdjList } = require('./graph_adjacency_list');

/* 깊이 우선 순회 */
// 지정한 정점의 모든 인접 정점을 얻기 쉽도록 그래프를 인접 리스트로 표현한다
function dfs(graph, visited, res, vet) {
    res.push(vet); // 방문한 정점을 기록한다
    visited.add(vet); // 해당 정점을 방문했다고 표시한다
    // 해당 정점의 모든 인접 정점을 순회한다
    for (const adjVet of graph.adjList.get(vet)) {
        if (visited.has(adjVet)) {
            continue; // 이미 방문한 정점은 건너뛴다
        }
        // 인접 정점을 재귀적으로 방문한다
        dfs(graph, visited, res, adjVet);
    }
}

/* 깊이 우선 순회 */
// 지정한 정점의 모든 인접 정점을 얻기 쉽도록 그래프를 인접 리스트로 표현한다
function graphDFS(graph, startVet) {
    // 정점 순회 순서
    const res = [];
    // 방문한 정점을 기록하는 해시 집합
    const visited = new Set();
    dfs(graph, visited, res, startVet);
    return res;
}

/* 실행 코드 */
/* 무방향 그래프 초기화 */
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
console.log('\n초기화한 후의 그래프');
graph.print();

/* 깊이 우선 순회 */
const res = graphDFS(graph, v[0]);
console.log('\n깊이 우선 순회(DFS)의 정점 순서');
console.log(Vertex.vetsToVals(res));
