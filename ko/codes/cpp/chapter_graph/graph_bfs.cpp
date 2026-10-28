/**
 * File: graph_bfs.cpp
 * Created Time: 2023-03-02
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"
#include "./graph_adjacency_list.cpp"

/* 너비 우선 순회 */
// 지정한 정점의 모든 인접 정점을 얻기 쉽도록 그래프를 인접 리스트로 표현한다
vector<Vertex *> graphBFS(GraphAdjList &graph, Vertex *startVet) {
    // 정점 순회 순서
    vector<Vertex *> res;
    // 방문한 정점을 기록하는 해시 집합
    unordered_set<Vertex *> visited = {startVet};
    // 큐를 사용하여 BFS를 구현한다
    queue<Vertex *> que;
    que.push(startVet);
    // 정점 vet에서 시작하여 모든 정점을 방문할 때까지 반복한다
    while (!que.empty()) {
        Vertex *vet = que.front();
        que.pop();          // 큐 맨 앞의 정점을 꺼낸다
        res.push_back(vet); // 방문한 정점을 기록한다
        // 해당 정점의 모든 인접 정점을 순회한다
        for (auto adjVet : graph.adjList[vet]) {
            if (visited.count(adjVet))
                continue;            // 이미 방문한 정점은 건너뛴다
            que.push(adjVet);        // 방문하지 않은 정점만 큐에 삽입한다
            visited.emplace(adjVet); // 해당 정점을 방문했다고 표시한다
        }
    }
    // 정점 순회 순서를 반환한다
    return res;
}

/* 실행 코드 */
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
    cout << "\n너비 우선 순회(BFS)의 정점 순서" << endl;
    printVector(vetsToVals(res));

    // 메모리 해제
    for (Vertex *vet : v) {
        delete vet;
    }

    return 0;
}
