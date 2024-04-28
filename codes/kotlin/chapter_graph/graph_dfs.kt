/**
 * File: graph_dfs.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_graph

import utils.Vertex

/* 深度优先遍历辅助函数 */
fun dfs(
    graph: GraphAdjList,
    visited: MutableSet<Vertex?>,
    res: MutableList<Vertex?>,
    vet: Vertex?
) {
    res.add(vet)     // 记录访问顶点
    visited.add(vet) // 标记该顶点已被访问
    // 遍历该顶点的所有邻接顶点
    for (adjVet in graph.adjList[vet]!!) {
        if (visited.contains(adjVet))
            continue  // 跳过已被访问的顶点
        // 递归访问邻接顶点
        dfs(graph, visited, res, adjVet)
    }
}

/* 深度优先遍历 */
// 使用邻接表来表示图，以便获取指定顶点的所有邻接顶点
fun graphDFS(graph: GraphAdjList, startVet: Vertex?): MutableList<Vertex?> {
    // 顶点遍历序列
    val res = mutableListOf<Vertex?>()
    // 哈希集合，用于记录已被访问过的顶点
    val visited = HashSet<Vertex?>()
    dfs(graph, visited, res, startVet)
    return res
}

/* Driver Code */
fun main() {
    /* 初始化无向图 */
    val v = Vertex.valsToVets(intArrayOf(0, 1, 2, 3, 4, 5, 6))
    val edges = arrayOf(
        arrayOf(v[0], v[1]),
        arrayOf(v[0], v[3]),
        arrayOf(v[1], v[2]),
        arrayOf(v[2], v[5]),
        arrayOf(v[4], v[5]),
        arrayOf(v[5], v[6])
    )
    val graph = GraphAdjList(edges)
    println("\n初始化后，图为")
    graph.print()

    /* 深度优先遍历 */
    val res = graphDFS(graph, v[0])
    println("\n深度优先遍历（DFS）顶点序列为")
    println(Vertex.vetsToVals(res))
}