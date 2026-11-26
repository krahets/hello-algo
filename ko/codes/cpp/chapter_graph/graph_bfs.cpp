/**
 * File: graph_bfs.cpp
 * Created Time: 2023-03-02
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"
#include "./graph_adjacency_list.cpp"

/* 너비 우선 순회 */
// 지정한 정점의 인접 정점을 모두 구할 수 있도록 인접 리스트로 그래프 표현
vector<Vertex *> graphBFS(GraphAdjList &graph, Vertex *startVet) {
    // 정점 방문 순서
    vector<Vertex *> res;
    // 방문한 정점을 기록하는 해시 집합
    unordered_set<Vertex *> visited = {startVet};
    // BFS 구현에 사용하는 큐
    queue<Vertex *> que;
    que.push(startVet);
    // 정점 vet에서 시작해 모든 정점을 방문할 때까지 반복
    while (!que.empty()) {
        Vertex *vet = que.front();
        que.pop();          // 큐의 맨 앞 정점을 꺼냄
        res.push_back(vet); // 방문한 정점 기록
        // 현재 정점에 인접한 모든 정점 순회
        for (auto adjVet : graph.adjList[vet]) {
            if (visited.count(adjVet))
                continue;            // 이미 방문한 정점은 건너뜀
            que.push(adjVet);        // 아직 방문하지 않은 정점만 큐에 삽입
            visited.emplace(adjVet); // 이 정점을 방문한 것으로 표시
        }
    }
    // 정점 방문 순서 반환
    return res;
}

/* 실행 예제 */
int main() {
    /* 무방향 그래프 초기화 */
    vector<Vertex *> v = valsToVets({0, 1, 2, 3, 4, 5, 6, 7, 8, 9});
    vector<vector<Vertex *>> edges = {{v[0], v[1]}, {v[0], v[3]}, {v[1], v[2]}, {v[1], v[4]},
                                      {v[2], v[5]}, {v[3], v[4]}, {v[3], v[6]}, {v[4], v[5]},
                                      {v[4], v[7]}, {v[5], v[8]}, {v[6], v[7]}, {v[7], v[8]}};
    GraphAdjList graph(edges);
    cout << "\n초기화한 그래프:\\n";
    graph.print();

    /* 너비 우선 순회 */
    vector<Vertex *> res = graphBFS(graph, v[0]);
    cout << "\n너비 우선 순회(BFS)의 정점 방문 순서:" << endl;
    printVector(vetsToVals(res));

    // 메모리 해제
    for (Vertex *vet : v) {
        delete vet;
    }

    return 0;
}
