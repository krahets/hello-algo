/**
 * File: graph_bfs.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_graph

import utils.Vertex
import java.util.*

/* 幅優先探索 */
// 指定した頂点の隣接頂点をすべて取得できるよう、グラフを隣接リストで表す
fun graphBFS(graph: GraphAdjList, startVet: Vertex): MutableList<Vertex?> {
    // 頂点の訪問順
    val res = mutableListOf<Vertex?>()
    // 訪問済みの頂点を記録するハッシュ集合
    val visited = HashSet<Vertex>()
    visited.add(startVet)
    // BFS にキューを使う
    val que = LinkedList<Vertex>()
    que.offer(startVet)
    // 頂点 vet から開始し、すべての頂点を訪問するまで繰り返す
    while (!que.isEmpty()) {
        val vet = que.poll() // キューの先頭から頂点を取り出す
        res.add(vet)         // 訪問した頂点を記録する
        // この頂点の隣接頂点をすべて調べる
        for (adjVet in graph.adjList[vet]!!) {
            if (visited.contains(adjVet))
                continue        // 訪問済みの頂点を飛ばす
            que.offer(adjVet)   // 未訪問の頂点だけをキューに追加する
            visited.add(adjVet) // この頂点を訪問済みにする
        }
    }
    // 頂点を訪問順に返す
    return res
}

/* 実行例 */
fun main() {
    /* 無向グラフを初期化する */
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
    println("\n初期化後のグラフ：")
    graph.print()

    /* 幅優先探索 */
    val res = graphBFS(graph, v[0]!!)
    println("\n幅優先探索（BFS）での頂点の訪問順：")
    println(Vertex.vetsToVals(res))
}