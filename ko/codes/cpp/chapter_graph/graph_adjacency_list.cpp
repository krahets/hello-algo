/**
 * File: graph_adjacency_list.cpp
 * Created Time: 2023-02-09
 * Author: what-is-me (whatisme@outlook.jp), krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 인접 리스트로 구현한 무방향 그래프 클래스 */
class GraphAdjList {
  public:
    // 인접 리스트의 key는 정점, value는 해당 정점의 모든 인접 정점
    unordered_map<Vertex *, vector<Vertex *>> adjList;

    /* vector에서 지정한 노드 삭제 */
    void remove(vector<Vertex *> &vec, Vertex *vet) {
        for (int i = 0; i < vec.size(); i++) {
            if (vec[i] == vet) {
                vec.erase(vec.begin() + i);
                break;
            }
        }
    }

    /* 생성자 */
    GraphAdjList(const vector<vector<Vertex *>> &edges) {
        // 모든 정점과 간선 추가
        for (const vector<Vertex *> &edge : edges) {
            addVertex(edge[0]);
            addVertex(edge[1]);
            addEdge(edge[0], edge[1]);
        }
    }

    /* 정점 수 구하기 */
    int size() {
        return adjList.size();
    }

    /* 간선 추가 */
    void addEdge(Vertex *vet1, Vertex *vet2) {
        if (!adjList.count(vet1) || !adjList.count(vet2) || vet1 == vet2)
            throw invalid_argument("해당 정점이 없음");
        // 간선 vet1 - vet2 추가
        adjList[vet1].push_back(vet2);
        adjList[vet2].push_back(vet1);
    }

    /* 간선 삭제 */
    void removeEdge(Vertex *vet1, Vertex *vet2) {
        if (!adjList.count(vet1) || !adjList.count(vet2) || vet1 == vet2)
            throw invalid_argument("해당 정점이 없음");
        // 간선 vet1 - vet2 삭제
        remove(adjList[vet1], vet2);
        remove(adjList[vet2], vet1);
    }

    /* 정점 추가 */
    void addVertex(Vertex *vet) {
        if (adjList.count(vet))
            return;
        // 인접 리스트에 새 연결 리스트 추가
        adjList[vet] = vector<Vertex *>();
    }

    /* 정점 삭제 */
    void removeVertex(Vertex *vet) {
        if (!adjList.count(vet))
            throw invalid_argument("해당 정점이 없음");
        // 인접 리스트에서 정점 vet에 해당하는 연결 리스트 삭제
        adjList.erase(vet);
        // 다른 정점들의 연결 리스트를 순회하며 vet에 연결된 간선을 모두 삭제
        for (auto &adj : adjList) {
            remove(adj.second, vet);
        }
    }

    /* 인접 리스트 출력 */
    void print() {
        cout << "인접 리스트 =" << endl;
        for (auto &adj : adjList) {
            const auto &key = adj.first;
            const auto &vec = adj.second;
            cout << key->val << ": ";
            printVector(vetsToVals(vec));
        }
    }
};

// 테스트 예제는 graph_adjacency_list_test.cpp 참고
