/**
 * File: graph_dfs.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_graph

import utils.Vertex

/* 深度優先走訪的輔助函式 */
fun dfs(
    graph: GraphAdjList,
    visited: MutableSet<Vertex?>,
    res: MutableList<Vertex?>,
    vet: Vertex?
) {
    res.add(vet)     // 記錄走訪的頂點
    visited.add(vet) // 將此頂點標記為已走訪
    // 走訪此頂點的所有相鄰頂點
    for (adjVet in graph.adjList[vet]!!) {
        if (visited.contains(adjVet))
            continue  // 略過已走訪的頂點
        // 遞迴走訪相鄰頂點
        dfs(graph, visited, res, adjVet)
    }
}

/* 深度優先走訪 */
// 以鄰接串列表示圖，以便取得指定頂點的所有相鄰頂點
fun graphDFS(graph: GraphAdjList, startVet: Vertex?): MutableList<Vertex?> {
    // 頂點走訪順序
    val res = mutableListOf<Vertex?>()
    // 用雜湊集合記錄已走訪的頂點
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
    println("\n初始化後的圖為")
    graph.print()

    /* 深度優先走訪 */
    val res = graphDFS(graph, v[0])
    println("\n深度優先走訪（DFS）的頂點順序為")
    println(Vertex.vetsToVals(res))
}