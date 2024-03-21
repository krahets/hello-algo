/**
 * File: graph_adjacency_matrix.swift
 * Created Time: 2023-02-01
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* 基于邻接矩阵实现的无向图类 */
class GraphAdjMat {
    private var vertices: [Int] // 顶点列表，元素代表“顶点值”，索引代表“顶点索引”
    private var adjMat: [[Int]] // 邻接矩阵，行列索引对应“顶点索引”

    /* 构造方法 */
    init(vertices: [Int], edges: [[Int]]) {
        self.vertices = []
        adjMat = []
        // 添加顶点
        for val in vertices {
            addVertex(val: val)
        }
        // 添加边
        // 请注意，edges 元素代表顶点索引，即对应 vertices 元素索引
        for e in edges {
            addEdge(i: e[0], j: e[1])
        }
    }

    /* 获取顶点数量 */
    func size() -> Int {
        vertices.count
    }

    /* 添加顶点 */
    func addVertex(val: Int) {
        let n = size()
        // 向顶点列表中添加新顶点的值
        vertices.append(val)
        // 在邻接矩阵中添加一行
        let newRow = Array(repeating: 0, count: n)
        adjMat.append(newRow)
        // 在邻接矩阵中添加一列
        for i in adjMat.indices {
            adjMat[i].append(0)
        }
    }

    /* 删除顶点 */
    func removeVertex(index: Int) {
        if index >= size() {
            fatalError("越界")
        }
        // 在顶点列表中移除索引 index 的顶点
        vertices.remove(at: index)
        // 在邻接矩阵中删除索引 index 的行
        adjMat.remove(at: index)
        // 在邻接矩阵中删除索引 index 的列
        for i in adjMat.indices {
            adjMat[i].remove(at: index)
        }
    }

    /* 添加边 */
    // 参数 i, j 对应 vertices 元素索引
    func addEdge(i: Int, j: Int) {
        // 索引越界与相等处理
        if i < 0 || j < 0 || i >= size() || j >= size() || i == j {
            fatalError("越界")
        }
        // 在无向图中，邻接矩阵关于主对角线对称，即满足 (i, j) == (j, i)
        adjMat[i][j] = 1
        adjMat[j][i] = 1
    }

    /* 删除边 */
    // 参数 i, j 对应 vertices 元素索引
    func removeEdge(i: Int, j: Int) {
        // 索引越界与相等处理
        if i < 0 || j < 0 || i >= size() || j >= size() || i == j {
            fatalError("越界")
        }
        adjMat[i][j] = 0
        adjMat[j][i] = 0
    }

    /* 打印邻接矩阵 */
    func print() {
        Swift.print("顶点列表 = ", terminator: "")
        Swift.print(vertices)
        Swift.print("邻接矩阵 =")
        PrintUtil.printMatrix(matrix: adjMat)
    }
}

@main
enum GraphAdjacencyMatrix {
    /* Driver Code */
    static func main() {
        /* 初始化无向图 */
        // 请注意，edges 元素代表顶点索引，即对应 vertices 元素索引
        let vertices = [1, 3, 2, 5, 4]
        let edges = [[0, 1], [1, 2], [2, 3], [0, 3], [2, 4], [3, 4]]
        let graph = GraphAdjMat(vertices: vertices, edges: edges)
        print("\n初始化后，图为")
        graph.print()

        /* 添加边 */
        // 顶点 1, 2 的索引分别为 0, 2
        graph.addEdge(i: 0, j: 2)
        print("\n添加边 1-2 后，图为")
        graph.print()

        /* 删除边 */
        // 顶点 1, 3 的索引分别为 0, 1
        graph.removeEdge(i: 0, j: 1)
        print("\n删除边 1-3 后，图为")
        graph.print()

        /* 添加顶点 */
        graph.addVertex(val: 6)
        print("\n添加顶点 6 后，图为")
        graph.print()

        /* 删除顶点 */
        // 顶点 3 的索引为 1
        graph.removeVertex(index: 1)
        print("\n删除顶点 3 后，图为")
        graph.print()
    }
}
