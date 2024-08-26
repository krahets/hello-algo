import scala.collection.mutable.ArrayBuffer

/**
 * File: graph_bfs.scala
 * Author: WangBlue (wangjiping596@gmail.com)
 * Create: 2024-08-14 16:28
 */

class graph_bfs {
  /* 广度优先遍历 */
  // 使用邻接表来表示图，以便获取指定顶点的所有邻接顶点
  def graphBFS(graph: graph_adjacency_list, startVet: Vertex): ArrayBuffer[Vertex] = {
    // 顶点遍历序列
    val res: ArrayBuffer[Vertex] = new ArrayBuffer[Vertex]
    // 哈希集合，用于记录已被访问过的顶点
    val visited = scala.collection.mutable.Set[Vertex]()
    visited += startVet

    // 队列用于实现 BFS
    val queue = scala.collection.mutable.Queue[Vertex]()
    queue.enqueue(startVet)
    // 以顶点 vet 为起点，循环直至访问完所有顶点
    while (queue.nonEmpty) {
      val vet = queue.dequeue() // 队首顶点出队
      res += vet // 记录访问顶点
      // 遍历该顶点的所有邻接顶点
      for (adjVet <- graph.adjList(vet)) {
        if (!visited.contains(adjVet)) {
          visited += adjVet // 标记该顶点已被访问
          queue.enqueue(adjVet) // 只入队未访问的顶点
        }
      }
    }
    res
  }
}

object graph_bfs {
  def main(args: Array[String]): Unit = {
    // 定义顶点
    val v = new Vertex().valsToVets(Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9))

    // 定义边
    val edges = ArrayBuffer(
      ArrayBuffer(v(0), v(1)), ArrayBuffer(v(0), v(3)), ArrayBuffer(v(1), v(2)), ArrayBuffer(v(1), v(4)),
      ArrayBuffer(v(2), v(5)), ArrayBuffer(v(3), v(4)), ArrayBuffer(v(3), v(6)), ArrayBuffer(v(4), v(5)),
      ArrayBuffer(v(4), v(7)), ArrayBuffer(v(5), v(8)), ArrayBuffer(v(6), v(7)), ArrayBuffer(v(7), v(8))
    )

    // 初始化图

    val graph = new graph_adjacency_list(edges)
    println("\n初始化后，图为")
    graph.print()


    // 广度优先遍历
    val res: ArrayBuffer[Vertex] = new graph_bfs().graphBFS(graph, v(0))
    println("\n广度优先遍历（BFS）顶点序列为")
    println(new Vertex().vetsToVals(res))

  }
}

