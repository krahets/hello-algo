/**
 * File: graph_bfs.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_graph

import utils.Vertex
import java.util.*

/* 廣度優先走訪 */
// 以鄰接串列表示圖，以便取得指定頂點的所有相鄰頂點
fun graphBFS(graph: GraphAdjList, startVet: Vertex): MutableList<Vertex?> {
    // 頂點走訪順序
    val res = mutableListOf<Vertex?>()
    // 用雜湊集合記錄已走訪的頂點
    val visited = HashSet<Vertex>()
    visited.add(startVet)
    // 使用佇列實作 BFS
    val que = LinkedList<Vertex>()
    que.offer(startVet)
    // 從頂點 vet 出發，反覆執行，直到走訪完所有頂點
    while (!que.isEmpty()) {
        val vet = que.poll() // 取出佇列前端的頂點
        res.add(vet)         // 記錄走訪的頂點
        // 走訪此頂點的所有相鄰頂點
        for (adjVet in graph.adjList[vet]!!) {
            if (visited.contains(adjVet))
                continue        // 略過已走訪的頂點
            que.offer(adjVet)   // 只將尚未走訪的頂點加入佇列
            visited.add(adjVet) // 將此頂點標記為已走訪
        }
    }
    // 回傳頂點的走訪順序
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
    println("\n初始化後的圖為")
    graph.print()

    /* 廣度優先走訪 */
    val res = graphBFS(graph, v[0]!!)
    println("\n廣度優先走訪（BFS）的頂點順序為")
    println(Vertex.vetsToVals(res))
}