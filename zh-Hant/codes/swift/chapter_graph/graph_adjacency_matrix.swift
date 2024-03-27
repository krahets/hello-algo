/**
 * File: graph_adjacency_matrix.swift
 * Created Time: 2023-02-01
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* 基於鄰接矩陣實現的無向圖類別 */
class GraphAdjMat {
    private var vertices: [Int] // 頂點串列，元素代表“頂點值”，索引代表“頂點索引”
    private var adjMat: [[Int]] // 鄰接矩陣，行列索引對應“頂點索引”

    /* 建構子 */
    init(vertices: [Int], edges: [[Int]]) {
        self.vertices = []
        adjMat = []
        // 新增頂點
        for val in vertices {
            addVertex(val: val)
        }
        // 新增邊
        // 請注意，edges 元素代表頂點索引，即對應 vertices 元素索引
        for e in edges {
            addEdge(i: e[0], j: e[1])
        }
    }

    /* 獲取頂點數量 */
    func size() -> Int {
        vertices.count
    }

    /* 新增頂點 */
    func addVertex(val: Int) {
        let n = size()
        // 向頂點串列中新增新頂點的值
        vertices.append(val)
        // 在鄰接矩陣中新增一行
        let newRow = Array(repeating: 0, count: n)
        adjMat.append(newRow)
        // 在鄰接矩陣中新增一列
        for i in adjMat.indices {
            adjMat[i].append(0)
        }
    }

    /* 刪除頂點 */
    func removeVertex(index: Int) {
        if index >= size() {
            fatalError("越界")
        }
        // 在頂點串列中移除索引 index 的頂點
        vertices.remove(at: index)
        // 在鄰接矩陣中刪除索引 index 的行
        adjMat.remove(at: index)
        // 在鄰接矩陣中刪除索引 index 的列
        for i in adjMat.indices {
            adjMat[i].remove(at: index)
        }
    }

    /* 新增邊 */
    // 參數 i, j 對應 vertices 元素索引
    func addEdge(i: Int, j: Int) {
        // 索引越界與相等處理
        if i < 0 || j < 0 || i >= size() || j >= size() || i == j {
            fatalError("越界")
        }
        // 在無向圖中，鄰接矩陣關於主對角線對稱，即滿足 (i, j) == (j, i)
        adjMat[i][j] = 1
        adjMat[j][i] = 1
    }

    /* 刪除邊 */
    // 參數 i, j 對應 vertices 元素索引
    func removeEdge(i: Int, j: Int) {
        // 索引越界與相等處理
        if i < 0 || j < 0 || i >= size() || j >= size() || i == j {
            fatalError("越界")
        }
        adjMat[i][j] = 0
        adjMat[j][i] = 0
    }

    /* 列印鄰接矩陣 */
    func print() {
        Swift.print("頂點串列 = ", terminator: "")
        Swift.print(vertices)
        Swift.print("鄰接矩陣 =")
        PrintUtil.printMatrix(matrix: adjMat)
    }
}

@main
enum GraphAdjacencyMatrix {
    /* Driver Code */
    static func main() {
        /* 初始化無向圖 */
        // 請注意，edges 元素代表頂點索引，即對應 vertices 元素索引
        let vertices = [1, 3, 2, 5, 4]
        let edges = [[0, 1], [1, 2], [2, 3], [0, 3], [2, 4], [3, 4]]
        let graph = GraphAdjMat(vertices: vertices, edges: edges)
        print("\n初始化後，圖為")
        graph.print()

        /* 新增邊 */
        // 頂點 1, 2 的索引分別為 0, 2
        graph.addEdge(i: 0, j: 2)
        print("\n新增邊 1-2 後，圖為")
        graph.print()

        /* 刪除邊 */
        // 頂點 1, 3 的索引分別為 0, 1
        graph.removeEdge(i: 0, j: 1)
        print("\n刪除邊 1-3 後，圖為")
        graph.print()

        /* 新增頂點 */
        graph.addVertex(val: 6)
        print("\n新增頂點 6 後，圖為")
        graph.print()

        /* 刪除頂點 */
        // 頂點 3 的索引為 1
        graph.removeVertex(index: 1)
        print("\n刪除頂點 3 後，圖為")
        graph.print()
    }
}
