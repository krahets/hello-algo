/**
 * File: graph_adjacency_matrix.swift
 * Created Time: 2023-02-01
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* 隣接行列に基づく無向グラフクラス */
class GraphAdjMat {
    private var vertices: [Int] // 頂点リスト。要素は「頂点値」、インデックスは「頂点インデックス」を表す
    private var adjMat: [[Int]] // 隣接行列。行・列のインデックスは「頂点インデックス」に対応

    /* コンストラクタ */
    init(vertices: [Int], edges: [[Int]]) {
        self.vertices = []
        adjMat = []
        // 頂点を追加
        for val in vertices {
            addVertex(val: val)
        }
        // 辺を追加
        // 注意：edges の各要素は頂点インデックスを表し、vertices の要素インデックスに対応する
        for e in edges {
            addEdge(i: e[0], j: e[1])
        }
    }

    /* 頂点数を取得 */
    func size() -> Int {
        vertices.count
    }

    /* 頂点を追加 */
    func addVertex(val: Int) {
        let n = size()
        // 頂点リストに新しい頂点の値を追加
        vertices.append(val)
        // 隣接行列に 1 行追加
        let newRow = Array(repeating: 0, count: n)
        adjMat.append(newRow)
        // 隣接行列に 1 列追加
        for i in adjMat.indices {
            adjMat[i].append(0)
        }
    }

    /* 頂点を削除 */
    func removeVertex(index: Int) {
        if index >= size() {
            fatalError("範囲外")
        }
        // 頂点リストから index の頂点を削除する
        vertices.remove(at: index)
        // 隣接行列で index 行を削除する
        adjMat.remove(at: index)
        // 隣接行列で index 列を削除する
        for i in adjMat.indices {
            adjMat[i].remove(at: index)
        }
    }

    /* 辺を追加 */
    // 引数 i, j は vertices の要素インデックスに対応する
    func addEdge(i: Int, j: Int) {
        // インデックスの範囲外と等値の処理
        if i < 0 || j < 0 || i >= size() || j >= size() || i == j {
            fatalError("範囲外")
        }
        // 無向グラフでは、隣接行列は主対角線に関して対称、すなわち (i, j) == (j, i) を満たす
        adjMat[i][j] = 1
        adjMat[j][i] = 1
    }

    /* 辺を削除 */
    // 引数 i, j は vertices の要素インデックスに対応する
    func removeEdge(i: Int, j: Int) {
        // インデックスの範囲外と等値の処理
        if i < 0 || j < 0 || i >= size() || j >= size() || i == j {
            fatalError("範囲外")
        }
        adjMat[i][j] = 0
        adjMat[j][i] = 0
    }

    /* 隣接行列を出力 */
    func print() {
        Swift.print("頂点リスト = ", terminator: "")
        Swift.print(vertices)
        Swift.print("隣接行列 =")
        PrintUtil.printMatrix(matrix: adjMat)
    }
}

@main
enum GraphAdjacencyMatrix {
    /* Driver Code */
    static func main() {
        /* 無向グラフを初期化 */
        // edges の要素は頂点インデックス、すなわち vertices の要素インデックスに対応する点に注意
        let vertices = [1, 3, 2, 5, 4]
        let edges = [[0, 1], [1, 2], [2, 3], [0, 3], [2, 4], [3, 4]]
        let graph = GraphAdjMat(vertices: vertices, edges: edges)
        print("\n初期化後のグラフ")
        graph.print()

        /* 辺を追加 */
        // 頂点 1, 2 のインデックスはそれぞれ 0, 2
        graph.addEdge(i: 0, j: 2)
        print("\n辺 1-2 を追加後のグラフ")
        graph.print()

        /* 辺を削除 */
        // 頂点 1, 3 のインデックスはそれぞれ 0, 1
        graph.removeEdge(i: 0, j: 1)
        print("\n辺 1-3 を削除後のグラフ")
        graph.print()

        /* 頂点を追加 */
        graph.addVertex(val: 6)
        print("\n頂点 6 を追加後のグラフ")
        graph.print()

        /* 頂点を削除 */
        // 頂点 3 のインデックスは 1
        graph.removeVertex(index: 1)
        print("\n頂点 3 を削除後のグラフ")
        graph.print()
    }
}
