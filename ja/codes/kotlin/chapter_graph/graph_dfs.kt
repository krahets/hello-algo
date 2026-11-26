/**
 * File: graph_dfs.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_graph

import utils.Vertex

/* 深さ優先探索の補助関数 */
fun dfs(
    graph: GraphAdjList,
    visited: MutableSet<Vertex?>,
    res: MutableList<Vertex?>,
    vet: Vertex?
) {
    res.add(vet)     // 訪問した頂点を記録する
    visited.add(vet) // この頂点を訪問済みにする
    // この頂点の隣接頂点をすべて調べる
    for (adjVet in graph.adjList[vet]!!) {
        if (visited.contains(adjVet))
            continue  // 訪問済みの頂点を飛ばす
        // 隣接頂点を再帰的に訪問する
        dfs(graph, visited, res, adjVet)
    }
}

/* 深さ優先探索 */
// 指定した頂点の隣接頂点をすべて取得できるよう、グラフを隣接リストで表す
fun graphDFS(graph: GraphAdjList, startVet: Vertex?): MutableList<Vertex?> {
    // 頂点の訪問順
    val res = mutableListOf<Vertex?>()
    // 訪問済みの頂点を記録するハッシュ集合
    val visited = HashSet<Vertex?>()
    dfs(graph, visited, res, startVet)
    return res
}

/* 実行例 */
fun main() {
    /* 無向グラフを初期化する */
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
    println("\n初期化後のグラフ：")
    graph.print()

    /* 深さ優先探索 */
    val res = graphDFS(graph, v[0])
    println("\n深さ優先探索（DFS）での頂点の訪問順：")
    println(Vertex.vetsToVals(res))
}