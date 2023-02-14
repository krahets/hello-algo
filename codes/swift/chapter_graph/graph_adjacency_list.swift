/**
 * File: graph_adjacency_list.swift
 * Created Time: 2023-02-01
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 顶点类 */
class Vertex: Hashable {
    var val: Int

    init(val: Int) {
        self.val = val
    }

    static func == (lhs: Vertex, rhs: Vertex) -> Bool {
        lhs.val == rhs.val
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(val)
    }
}

/* 基于邻接表实现的无向图类 */
class GraphAdjList {
    // 邻接表，使用哈希表来代替链表，以提升删除边、删除顶点的效率
    // 请注意，adjList 中的元素是 Vertex 对象
    private var adjList: [Vertex: Set<Vertex>]

    /* 构造方法 */
    init(edges: [[Vertex]]) {
        adjList = [:]
        // 添加所有顶点和边
        for edge in edges {
            addVertex(vet: edge[0])
            addVertex(vet: edge[1])
            addEdge(vet1: edge[0], vet2: edge[1])
        }
    }

    /* 获取顶点数量 */
    func size() -> Int {
        adjList.count
    }

    /* 添加边 */
    func addEdge(vet1: Vertex, vet2: Vertex) {
        if adjList[vet1] == nil || adjList[vet2] == nil || vet1 == vet2 {
            fatalError("参数错误")
        }
        // 添加边 vet1 - vet2
        adjList[vet1]?.insert(vet2)
        adjList[vet2]?.insert(vet1)
    }

    /* 删除边 */
    func removeEdge(vet1: Vertex, vet2: Vertex) {
        if adjList[vet1] == nil || adjList[vet2] == nil || vet1 == vet2 {
            fatalError("参数错误")
        }
        // 删除边 vet1 - vet2
        adjList[vet1]?.remove(vet2)
        adjList[vet2]?.remove(vet1)
    }

    /* 添加顶点 */
    func addVertex(vet: Vertex) {
        if adjList[vet] != nil {
            return
        }
        // 在邻接表中添加一个新链表
        adjList[vet] = []
    }

    /* 删除顶点 */
    func removeVertex(vet: Vertex) {
        if adjList[vet] == nil {
            fatalError("参数错误")
        }
        // 在邻接表中删除顶点 vet 对应的链表
        adjList.removeValue(forKey: vet)
        // 遍历其它顶点的链表，删除所有包含 vet 的边
        for key in adjList.keys {
            adjList[key]?.remove(vet)
        }
    }

    /* 打印邻接表 */
    func print() {
        Swift.print("邻接表 =")
        for entry in adjList {
            var tmp: [Int] = []
            for vertex in entry.value {
                tmp.append(vertex.val)
            }
            Swift.print("\(entry.key.val): \(tmp),")
        }
    }
}

@main
enum GraphAdjacencyList {
    /* Driver Code */
    static func main() {
        /* 初始化无向图 */
        let v0 = Vertex(val: 1)
        let v1 = Vertex(val: 3)
        let v2 = Vertex(val: 2)
        let v3 = Vertex(val: 5)
        let v4 = Vertex(val: 4)
        let edges = [[v0, v1], [v1, v2], [v2, v3], [v0, v3], [v2, v4], [v3, v4]]
        let graph = GraphAdjList(edges: edges)
        print("\n初始化后，图为")
        graph.print()

        /* 添加边 */
        // 顶点 1, 2 即 v0, v2
        graph.addEdge(vet1: v0, vet2: v2)
        print("\n添加边 1-2 后，图为")
        graph.print()

        /* 删除边 */
        // 顶点 1, 3 即 v0, v1
        graph.removeEdge(vet1: v0, vet2: v1)
        print("\n删除边 1-3 后，图为")
        graph.print()

        /* 添加顶点 */
        let v5 = Vertex(val: 6)
        graph.addVertex(vet: v5)
        print("\n添加顶点 6 后，图为")
        graph.print()

        /* 删除顶点 */
        // 顶点 3 即 v1
        graph.removeVertex(vet: v1)
        print("\n删除顶点 3 后，图为")
        graph.print()
    }
}
