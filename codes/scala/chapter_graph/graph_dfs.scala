import scala.collection.mutable
import scala.collection.mutable.ArrayBuffer

/**
 * File: graph_dfs.scala
 * Author: WangBlue (wangjiping596@gmail.com)
 * Create: 2024-08-14 17:02
 */

class graph_dfs {
  def dfs(graph: graph_adjacency_list, visited: mutable.HashSet[Vertex],
          res:ArrayBuffer[Vertex], vet: Vertex ) : Unit = {
    res += vet      // 记录访问顶点
    visited += vet  // 标记访问过的顶点
    // 遍历该顶点的所有邻接顶点
    for(adjVet <- graph.adjList(vet)) {
      if(!visited.contains(adjVet)) {
        // 递归访问邻接顶点
        dfs(graph, visited, res, adjVet)
      }
    }

  }


  /* 深度优先遍历 */
  // 使用邻接表来表示图，以便获取指定顶点的所有邻接顶点
  def graphDFS(graph: graph_adjacency_list, startVet: Vertex): ArrayBuffer[Vertex] = {
    // 顶点遍历序列
    val res: ArrayBuffer[Vertex] = new ArrayBuffer[Vertex]()
    // 哈希集合，用于记录已被访问过的顶点
    val visited: mutable.HashSet[Vertex] = mutable.HashSet[Vertex]()
    dfs(graph, visited, res, startVet)
    res
  }
}

object graph_dfs {
  def main(args: Array[String]): Unit = {
    val v: Array[Vertex] = new Vertex().valsToVets(Array(0, 1, 2, 3, 4, 5, 6))
    val edges = ArrayBuffer(
      ArrayBuffer(v(0), v(1)), ArrayBuffer(v(0), v(3)), ArrayBuffer(v(1), v(2)),
      ArrayBuffer(v(2), v(5)), ArrayBuffer(v(4), v(5)), ArrayBuffer(v(5), v(6)),
    )

    val graph = new graph_adjacency_list(edges)
    println("\n初始化后，图为")
    graph.print()

    /* 深度优先遍历 */
    val res = new graph_dfs().graphDFS(graph, v(0))
    System.out.println("\n深度优先遍历（DFS）顶点序列为")
    println(new Vertex().vetsToVals(res))

  }
}








