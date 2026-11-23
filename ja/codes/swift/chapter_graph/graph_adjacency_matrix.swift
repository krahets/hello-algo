/**
 * File: graph_adjacency_matrix.swift
 * Created Time: 2023-02-01
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* 隣接行列で実装した無向グラフクラス */
class GraphAdjMat {
    private var vertices: [Int] // 頂点リスト。要素は「頂点の値」、インデックスは「頂点のインデックス」を表す
    private var adjMat: [[Int]] // 隣接行列。行と列のインデックスは「頂点のインデックス」に対応する

    /* コンストラクタ */
    init(vertices: [Int], edges: [[Int]]) {
        self.vertices = []
        adjMat = []
        // 頂点を追加する
        for val in vertices {
            addVertex(val: val)
        }
        // 辺を追加する
        // edges の要素は頂点のインデックス、すなわち vertices の要素のインデックスを表すことに注意
        for e in edges {
            addEdge(i: e[0], j: e[1])
        }
    }

    /* 頂点数を取得する */
    func size() -> Int {
        vertices.count
    }

    /* 頂点を追加する */
    func addVertex(val: Int) {
        let n = size()
        // 頂点リストに新しい頂点の値を追加する
        vertices.append(val)
        // 隣接行列に 1 行追加する
        let newRow = Array(repeating: 0, count: n)
        adjMat.append(newRow)
        // 隣接行列に 1 列追加する
        for i in adjMat.indices {
            adjMat[i].append(0)
        }
    }

    /* 頂点を削除する */
    func removeVertex(index: Int) {
        if index >= size() {
            fatalError("範囲外です")
        }
        // 頂点リストからインデックス index の頂点を削除する
        vertices.remove(at: index)
        // 隣接行列からインデックス index の行を削除する
        adjMat.remove(at: index)
        // 隣接行列からインデックス index の列を削除する
        for i in adjMat.indices {
            adjMat[i].remove(at: index)
        }
    }

    /* 辺を追加する */
    // 引数 i, j は vertices の要素のインデックスに対応する
    func addEdge(i: Int, j: Int) {
        // 添字が範囲外または互いに等しい場合の処理
        if i < 0 || j < 0 || i >= size() || j >= size() || i == j {
            fatalError("範囲外です")
        }
        // 無向グラフの隣接行列は主対角線に関して対称であり、(i, j) == (j, i) を満たす
        adjMat[i][j] = 1
        adjMat[j][i] = 1
    }

    /* 辺を削除する */
    // 引数 i, j は vertices の要素のインデックスに対応する
    func removeEdge(i: Int, j: Int) {
        // 添字が範囲外または互いに等しい場合の処理
        if i < 0 || j < 0 || i >= size() || j >= size() || i == j {
            fatalError("範囲外です")
        }
        adjMat[i][j] = 0
        adjMat[j][i] = 0
    }

    /* 隣接行列を表示する */
    func print() {
        Swift.print("頂点リスト = ", terminator: "")
        Swift.print(vertices)
        Swift.print("隣接行列 =")
        PrintUtil.printMatrix(matrix: adjMat)
    }
}

@main
enum GraphAdjacencyMatrix {
    /* 実行用コード */
    static func main() {
        /* 無向グラフを初期化する */
        // edges の要素は頂点のインデックス、すなわち vertices の要素のインデックスを表すことに注意
        let vertices = [1, 3, 2, 5, 4]
        let edges = [[0, 1], [1, 2], [2, 3], [0, 3], [2, 4], [3, 4]]
        let graph = GraphAdjMat(vertices: vertices, edges: edges)
        print("\n初期化後のグラフ")
        graph.print()

        /* 辺を追加する */
        // 頂点 1, 2 のインデックスはそれぞれ 0, 2
        graph.addEdge(i: 0, j: 2)
        print("\n辺 1-2 を追加した後のグラフ")
        graph.print()

        /* 辺を削除する */
        // 頂点 1, 3 のインデックスはそれぞれ 0, 1
        graph.removeEdge(i: 0, j: 1)
        print("\n辺 1-3 を削除した後のグラフ")
        graph.print()

        /* 頂点を追加する */
        graph.addVertex(val: 6)
        print("\n頂点 6 を追加した後のグラフ")
        graph.print()

        /* 頂点を削除する */
        // 頂点 3 のインデックスは 1
        graph.removeVertex(index: 1)
        print("\n頂点 3 を削除した後のグラフ")
        graph.print()
    }
}
