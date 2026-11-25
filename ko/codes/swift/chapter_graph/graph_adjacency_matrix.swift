/**
 * File: graph_adjacency_matrix.swift
 * Created Time: 2023-02-01
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* 인접 행렬로 구현한 무방향 그래프 클래스 */
class GraphAdjMat {
    private var vertices: [Int] // 정점 리스트의 원소는 정점 값을, 인덱스는 정점 인덱스를 나타냄
    private var adjMat: [[Int]] // 인접 행렬의 행과 열 인덱스는 정점 인덱스에 해당

    /* 생성자 */
    init(vertices: [Int], edges: [[Int]]) {
        self.vertices = []
        adjMat = []
        // 정점 추가
        for val in vertices {
            addVertex(val: val)
        }
        // 간선 추가
        // edges의 원소는 정점 인덱스, 즉 vertices의 원소 인덱스를 나타냄
        for e in edges {
            addEdge(i: e[0], j: e[1])
        }
    }

    /* 정점 수 구하기 */
    func size() -> Int {
        vertices.count
    }

    /* 정점 추가 */
    func addVertex(val: Int) {
        let n = size()
        // 정점 리스트에 새 정점의 값 추가
        vertices.append(val)
        // 인접 행렬에 행 하나 추가
        let newRow = Array(repeating: 0, count: n)
        adjMat.append(newRow)
        // 인접 행렬에 열 하나 추가
        for i in adjMat.indices {
            adjMat[i].append(0)
        }
    }

    /* 정점 삭제 */
    func removeVertex(index: Int) {
        if index >= size() {
            fatalError("범위 초과")
        }
        // 정점 리스트에서 인덱스가 index인 정점 삭제
        vertices.remove(at: index)
        // 인접 행렬에서 인덱스가 index인 행 삭제
        adjMat.remove(at: index)
        // 인접 행렬에서 인덱스가 index인 열 삭제
        for i in adjMat.indices {
            adjMat[i].remove(at: index)
        }
    }

    /* 간선 추가 */
    // 매개변수 i, j는 vertices의 원소 인덱스
    func addEdge(i: Int, j: Int) {
        // 인덱스가 범위를 벗어나거나 서로 같은 경우 처리
        if i < 0 || j < 0 || i >= size() || j >= size() || i == j {
            fatalError("범위 초과")
        }
        // 무방향 그래프의 인접 행렬은 주대각선을 기준으로 대칭이므로 (i, j) == (j, i)
        adjMat[i][j] = 1
        adjMat[j][i] = 1
    }

    /* 간선 삭제 */
    // 매개변수 i, j는 vertices의 원소 인덱스
    func removeEdge(i: Int, j: Int) {
        // 인덱스가 범위를 벗어나거나 서로 같은 경우 처리
        if i < 0 || j < 0 || i >= size() || j >= size() || i == j {
            fatalError("범위 초과")
        }
        adjMat[i][j] = 0
        adjMat[j][i] = 0
    }

    /* 인접 행렬 출력 */
    func print() {
        Swift.print("정점 리스트 = ", terminator: "")
        Swift.print(vertices)
        Swift.print("인접 행렬 =")
        PrintUtil.printMatrix(matrix: adjMat)
    }
}

@main
enum GraphAdjacencyMatrix {
    /* 실행 예제 */
    static func main() {
        /* 무방향 그래프 초기화 */
        // edges의 원소는 정점 인덱스, 즉 vertices의 원소 인덱스를 나타냄
        let vertices = [1, 3, 2, 5, 4]
        let edges = [[0, 1], [1, 2], [2, 3], [0, 3], [2, 4], [3, 4]]
        let graph = GraphAdjMat(vertices: vertices, edges: edges)
        print("\n초기화한 그래프:")
        graph.print()

        /* 간선 추가 */
        // 정점 1과 2의 인덱스는 각각 0과 2
        graph.addEdge(i: 0, j: 2)
        print("\n간선 1-2를 추가한 그래프:")
        graph.print()

        /* 간선 삭제 */
        // 정점 1과 3의 인덱스는 각각 0과 1
        graph.removeEdge(i: 0, j: 1)
        print("\n간선 1-3을 삭제한 그래프:")
        graph.print()

        /* 정점 추가 */
        graph.addVertex(val: 6)
        print("\n정점 6을 추가한 그래프:")
        graph.print()

        /* 정점 삭제 */
        // 정점 3의 인덱스는 1
        graph.removeVertex(index: 1)
        print("\n정점 3을 삭제한 그래프:")
        graph.print()
    }
}
