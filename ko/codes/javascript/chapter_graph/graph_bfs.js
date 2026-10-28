/**
 * File: graph_bfs.js
 * Created Time: 2023-02-21
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

const { GraphAdjList } = require('./graph_adjacency_list');
const { Vertex } = require('../modules/Vertex');

/* 너비 우선 순회 */
// 지정한 정점의 모든 인접 정점을 얻기 쉽도록 그래프를 인접 리스트로 표현한다
function graphBFS(graph, startVet) {
    // 정점 순회 순서
    const res = [];
    // 방문한 정점을 기록하는 해시 집합
    const visited = new Set();
    visited.add(startVet);
    // 큐를 사용하여 BFS를 구현한다
    const que = [startVet];
    // 정점 vet에서 시작하여 모든 정점을 방문할 때까지 반복한다
    while (que.length) {
        const vet = que.shift(); // 큐 맨 앞의 정점을 꺼낸다
        res.push(vet); // 방문한 정점을 기록한다
        // 해당 정점의 모든 인접 정점을 순회한다
        for (const adjVet of graph.adjList.get(vet) ?? []) {
            if (visited.has(adjVet)) {
                continue; // 이미 방문한 정점은 건너뛴다
            }
            que.push(adjVet); // 방문하지 않은 정점만 큐에 삽입한다
            visited.add(adjVet); // 해당 정점을 방문했다고 표시한다
        }
    }
    // 정점 순회 순서를 반환한다
    return res;
}

/* 실행 코드 */
/* 무방향 그래프 초기화 */
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
console.log('\n초기화한 후의 그래프');
graph.print();

/* 너비 우선 순회 */
const res = graphBFS(graph, v[0]);
console.log('\n너비 우선 순회(BFS)의 정점 순서');
console.log(Vertex.vetsToVals(res));
