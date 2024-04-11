/**
 * File: graph_dfs.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_graph

import utils.Vertex

/* 深度優先走訪輔助函式 */
fun dfs(
    graph: GraphAdjList,
    visited: MutableSet<Vertex?>,
    res: MutableList<Vertex?>,
    vet: Vertex?
) {
    res.add(vet)     // 記錄訪問頂點
    visited.add(vet) // 標記該頂點已被訪問
    // 走訪該頂點的所有鄰接頂點
    for (adjVet in graph.adjList[vet]!!) {
        if (visited.contains(adjVet))
            continue  // 跳過已被訪問的頂點
        // 遞迴訪問鄰接頂點
        dfs(graph, visited, res, adjVet)
    }
}

/* 深度優先走訪 */
// 使用鄰接表來表示圖，以便獲取指定頂點的所有鄰接頂點
fun graphDFS(graph: GraphAdjList, startVet: Vertex?): MutableList<Vertex?> {
    // 頂點走訪序列
    val res = mutableListOf<Vertex?>()
    // 雜湊表，用於記錄已被訪問過的頂點
    val visited = HashSet<Vertex?>()
    dfs(graph, visited, res, startVet)
    return res
}

/* Driver Code */
fun main() {
    /* 初始化無向圖 */
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
    println("\n初始化後，圖為")
    graph.print()

    /* 深度優先走訪 */
    val res = graphDFS(graph, v[0])
    println("\n深度優先走訪（DFS）頂點序列為")
    println(Vertex.vetsToVals(res))
}