/**
 * File: graph_bfs.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_graph

import utils.Vertex
import java.util.*

/* 幅優先探索 */
// グラフを隣接リストで表し、指定した頂点の隣接頂点をすべて取得できるようにする
fun graphBFS(graph: GraphAdjList, startVet: Vertex): MutableList<Vertex?> {
    // 頂点の走査順序
    val res = mutableListOf<Vertex?>()
    // 訪問済み頂点を記録するためのハッシュ集合
    val visited = HashSet<Vertex>()
    visited.add(startVet)
    // BFS の実装にキューを用いる
    val que = LinkedList<Vertex>()
    que.offer(startVet)
    // 頂点 vet を起点に、すべての頂点を訪問し終えるまで繰り返す
    while (!que.isEmpty()) {
        val vet = que.poll() // 先頭の頂点をデキュー
        res.add(vet)         // 訪問した頂点を記録
        // この頂点のすべての隣接頂点を走査
        for (adjVet in graph.adjList[vet]!!) {
            if (visited.contains(adjVet))
                continue        // 訪問済みの頂点をスキップ
            que.offer(adjVet)   // 未訪問の頂点のみをキューに追加
            visited.add(adjVet) // この頂点を訪問済みにする
        }
    }
    // 頂点の走査順を返す
    return res
}

/* Driver Code */
fun main() {
    /* 無向グラフを初期化 */
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
    println("\n初期化後のグラフは")
    graph.print()

    /* 幅優先探索 */
    val res = graphBFS(graph, v[0]!!)
    println("\n幅優先探索（BFS）の頂点順序は")
    println(Vertex.vetsToVals(res))
}