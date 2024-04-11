/**
 * File: graph_bfs.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_graph

import utils.Vertex
import java.util.*

/* 廣度優先走訪 */
// 使用鄰接表來表示圖，以便獲取指定頂點的所有鄰接頂點
fun graphBFS(graph: GraphAdjList, startVet: Vertex): MutableList<Vertex?> {
    // 頂點走訪序列
    val res = mutableListOf<Vertex?>()
    // 雜湊表，用於記錄已被訪問過的頂點
    val visited = HashSet<Vertex>()
    visited.add(startVet)
    // 佇列用於實現 BFS
    val que = LinkedList<Vertex>()
    que.offer(startVet)
    // 以頂點 vet 為起點，迴圈直至訪問完所有頂點
    while (!que.isEmpty()) {
        val vet = que.poll() // 佇列首頂點出隊
        res.add(vet)         // 記錄訪問頂點
        // 走訪該頂點的所有鄰接頂點
        for (adjVet in graph.adjList[vet]!!) {
            if (visited.contains(adjVet))
                continue        // 跳過已被訪問的頂點
            que.offer(adjVet)   // 只入列未訪問的頂點
            visited.add(adjVet) // 標記該頂點已被訪問
        }
    }
    // 返回頂點走訪序列
    return res
}

/* Driver Code */
fun main() {
    /* 初始化無向圖 */
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
    println("\n初始化後，圖為")
    graph.print()

    /* 廣度優先走訪 */
    val res = graphBFS(graph, v[0]!!)
    println("\n廣度優先走訪（BFS）頂點序列為")
    println(Vertex.vetsToVals(res))
}