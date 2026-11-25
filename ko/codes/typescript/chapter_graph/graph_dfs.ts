/**
 * File: graph_dfs.ts
 * Created Time: 2023-02-21
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

import { Vertex } from '../modules/Vertex';
import { GraphAdjList } from './graph_adjacency_list';

/* 깊이 우선 순회 보조 함수 */
function dfs(
    graph: GraphAdjList,
    visited: Set<Vertex>,
    res: Vertex[],
    vet: Vertex
): void {
    res.push(vet); // 방문한 정점 기록
    visited.add(vet); // 이 정점을 방문한 것으로 표시
    // 현재 정점에 인접한 모든 정점 순회
    for (const adjVet of graph.adjList.get(vet)) {
        if (visited.has(adjVet)) {
            continue; // 이미 방문한 정점은 건너뜀
        }
        // 인접 정점을 재귀적으로 방문
        dfs(graph, visited, res, adjVet);
    }
}

/* 깊이 우선 순회 */
// 지정한 정점의 인접 정점을 모두 구할 수 있도록 인접 리스트로 그래프 표현
function graphDFS(graph: GraphAdjList, startVet: Vertex): Vertex[] {
    // 정점 방문 순서
    const res: Vertex[] = [];
    // 방문한 정점을 기록하는 해시 집합
    const visited: Set<Vertex> = new Set();
    dfs(graph, visited, res, startVet);
    return res;
}

/* 실행 예제 */
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
console.log('\n초기화한 그래프:');
graph.print();

/* 깊이 우선 순회 */
const res = graphDFS(graph, v[0]);
console.log('\n깊이 우선 순회(DFS)의 정점 방문 순서:');
console.log(Vertex.vetsToVals(res));
