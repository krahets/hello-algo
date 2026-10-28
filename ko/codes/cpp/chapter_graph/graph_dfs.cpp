/**
 * File: graph_dfs.cpp
 * Created Time: 2023-03-02
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"
#include "./graph_adjacency_list.cpp"

/* 깊이 우선 순회 보조 함수 */
void dfs(GraphAdjList &graph, unordered_set<Vertex *> &visited, vector<Vertex *> &res, Vertex *vet) {
    res.push_back(vet);   // 방문한 정점을 기록한다
    visited.emplace(vet); // 해당 정점을 방문했다고 표시한다
    // 해당 정점의 모든 인접 정점을 순회한다
    for (Vertex *adjVet : graph.adjList[vet]) {
        if (visited.count(adjVet))
            continue; // 이미 방문한 정점은 건너뛴다
        // 인접 정점을 재귀적으로 방문한다
        dfs(graph, visited, res, adjVet);
    }
}

/* 깊이 우선 순회 */
// 지정한 정점의 모든 인접 정점을 얻기 쉽도록 그래프를 인접 리스트로 표현한다
vector<Vertex *> graphDFS(GraphAdjList &graph, Vertex *startVet) {
    // 정점 순회 순서
    vector<Vertex *> res;
    // 방문한 정점을 기록하는 해시 집합
    unordered_set<Vertex *> visited;
    dfs(graph, visited, res, startVet);
    return res;
}

/* 실행 코드 */
int main() {
    /* 무방향 그래프 초기화 */
    vector<Vertex *> v = valsToVets(vector<int>{0, 1, 2, 3, 4, 5, 6});
    vector<vector<Vertex *>> edges = {{v[0], v[1]}, {v[0], v[3]}, {v[1], v[2]},
                                      {v[2], v[5]}, {v[4], v[5]}, {v[5], v[6]}};
    GraphAdjList graph(edges);
    cout << "\n초기화한 후의 그래프" << endl;
    graph.print();

    /* 깊이 우선 순회 */
    vector<Vertex *> res = graphDFS(graph, v[0]);
    cout << "\n깊이 우선 순회(DFS)의 정점 순서" << endl;
    printVector(vetsToVals(res));

    // 메모리 해제
    for (Vertex *vet : v) {
        delete vet;
    }

    return 0;
}
