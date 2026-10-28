/**
 * File: graph_adjacency_matrix.cpp
 * Created Time: 2023-02-09
 * Author: what-is-me (whatisme@outlook.jp)
 */

#include "../utils/common.hpp"

/* 인접 행렬로 구현한 무방향 그래프 클래스 */
class GraphAdjMat {
    vector<int> vertices;       // 정점 리스트의 원소는 정점 값을, 인덱스는 정점 인덱스를 나타낸다
    vector<vector<int>> adjMat; // 인접 행렬의 행과 열 인덱스는 정점 인덱스에 해당한다

  public:
    /* 생성자 */
    GraphAdjMat(const vector<int> &vertices, const vector<vector<int>> &edges) {
        // 정점 추가
        for (int val : vertices) {
            addVertex(val);
        }
        // 간선 추가
        // edges의 원소는 정점 인덱스, 즉 vertices 원소의 인덱스를 나타낸다
        for (const vector<int> &edge : edges) {
            addEdge(edge[0], edge[1]);
        }
    }

    /* 정점 개수 반환 */
    int size() const {
        return vertices.size();
    }

    /* 정점 추가 */
    void addVertex(int val) {
        int n = size();
        // 정점 리스트에 새 정점의 값을 추가한다
        vertices.push_back(val);
        // 인접 행렬에 행 하나를 추가한다
        adjMat.emplace_back(vector<int>(n, 0));
        // 인접 행렬에 열 하나를 추가한다
        for (vector<int> &row : adjMat) {
            row.push_back(0);
        }
    }

    /* 정점 삭제 */
    void removeVertex(int index) {
        if (index >= size()) {
            throw out_of_range("정점이 존재하지 않는다");
        }
        // 정점 리스트에서 인덱스 index의 정점을 제거한다
        vertices.erase(vertices.begin() + index);
        // 인접 행렬에서 인덱스 index의 행을 삭제한다
        adjMat.erase(adjMat.begin() + index);
        // 인접 행렬에서 인덱스 index의 열을 삭제한다
        for (vector<int> &row : adjMat) {
            row.erase(row.begin() + index);
        }
    }

    /* 간선 추가 */
    // 매개변수 i, j는 vertices 원소의 인덱스에 해당한다
    void addEdge(int i, int j) {
        // 인덱스가 범위를 벗어나거나 서로 같은 경우를 처리한다
        if (i < 0 || j < 0 || i >= size() || j >= size() || i == j) {
            throw out_of_range("정점이 존재하지 않는다");
        }
        // 무방향 그래프의 인접 행렬은 주대각선에 대해 대칭이며, (i, j) == (j, i)를 만족한다
        adjMat[i][j] = 1;
        adjMat[j][i] = 1;
    }

    /* 간선 삭제 */
    // 매개변수 i, j는 vertices 원소의 인덱스에 해당한다
    void removeEdge(int i, int j) {
        // 인덱스가 범위를 벗어나거나 서로 같은 경우를 처리한다
        if (i < 0 || j < 0 || i >= size() || j >= size() || i == j) {
            throw out_of_range("정점이 존재하지 않는다");
        }
        adjMat[i][j] = 0;
        adjMat[j][i] = 0;
    }

    /* 인접 행렬 출력 */
    void print() {
        cout << "정점 리스트 = ";
        printVector(vertices);
        cout << "인접 행렬 =" << endl;
        printVectorMatrix(adjMat);
    }
};

/* 실행 코드 */
int main() {
    /* 무방향 그래프 초기화 */
    // edges의 원소는 정점 인덱스, 즉 vertices 원소의 인덱스를 나타낸다
    vector<int> vertices = {1, 3, 2, 5, 4};
    vector<vector<int>> edges = {{0, 1}, {0, 3}, {1, 2}, {2, 3}, {2, 4}, {3, 4}};
    GraphAdjMat graph(vertices, edges);
    cout << "\n초기화한 후의 그래프" << endl;
    graph.print();

    /* 간선 추가 */
    // 정점 1, 2의 인덱스는 각각 0, 2이다
    graph.addEdge(0, 2);
    cout << "\n간선 1-2를 추가한 후의 그래프" << endl;
    graph.print();

    /* 간선 삭제 */
    // 정점 1, 3의 인덱스는 각각 0, 1이다
    graph.removeEdge(0, 1);
    cout << "\n간선 1-3을 삭제한 후의 그래프" << endl;
    graph.print();

    /* 정점 추가 */
    graph.addVertex(6);
    cout << "\n정점 6을 추가한 후의 그래프" << endl;
    graph.print();

    /* 정점 삭제 */
    // 정점 3의 인덱스는 1이다
    graph.removeVertex(1);
    cout << "\n정점 3을 삭제한 후의 그래프" << endl;
    graph.print();

    return 0;
}
