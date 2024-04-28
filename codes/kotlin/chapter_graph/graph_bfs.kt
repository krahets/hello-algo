/**
 * File: graph_bfs.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_graph

import utils.Vertex
import java.util.*

/* 广度优先遍历 */
// 使用邻接表来表示图，以便获取指定顶点的所有邻接顶点
fun graphBFS(graph: GraphAdjList, startVet: Vertex): MutableList<Vertex?> {
    // 顶点遍历序列
    val res = mutableListOf<Vertex?>()
    // 哈希集合，用于记录已被访问过的顶点
    val visited = HashSet<Vertex>()
    visited.add(startVet)
    // 队列用于实现 BFS
    val que = LinkedList<Vertex>()
    que.offer(startVet)
    // 以顶点 vet 为起点，循环直至访问完所有顶点
    while (!que.isEmpty()) {
        val vet = que.poll() // 队首顶点出队
        res.add(vet)         // 记录访问顶点
        // 遍历该顶点的所有邻接顶点
        for (adjVet in graph.adjList[vet]!!) {
            if (visited.contains(adjVet))
                continue        // 跳过已被访问的顶点
            que.offer(adjVet)   // 只入队未访问的顶点
            visited.add(adjVet) // 标记该顶点已被访问
        }
    }
    // 返回顶点遍历序列
    return res
}

/* Driver Code */
fun main() {
    /* 初始化无向图 */
    val v = Vertex.valsToVets(intArrayOf(0, 1, 2, 3, 4, 5, 6, 7, 8, 9))
    val edges = arrayOf(
        arrayOf(v[0], v[1]),
        arrayOf(v[0], v[3]),
        arrayOf(v[1], v[2]),
        arrayOf(v[1], v[4]),
        arrayOf(v[2], v[5]),
        arrayOf(v[3], v[4]),
        arrayOf(v[3], v[6]),
        arrayOf(v[4], v[5]),
        arrayOf(v[4], v[7]),
        arrayOf(v[5], v[8]),
        arrayOf(v[6], v[7]),
        arrayOf(v[7], v[8])
    )
    val graph = GraphAdjList(edges)
    println("\n初始化后，图为")
    graph.print()

    /* 广度优先遍历 */
    val res = graphBFS(graph, v[0]!!)
    println("\n广度优先遍历（BFS）顶点序列为")
    println(Vertex.vetsToVals(res))
}