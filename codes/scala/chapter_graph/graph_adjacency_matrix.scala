import scala.collection.mutable
import scala.collection.mutable.ArrayBuffer

/**
 * File: graph_adjacency_matrix.scala
 * Author: WangBlue (wangjiping596@gmail.com)
 * Create: 2024-08-14 11:00
 */

/* 基于邻接矩阵实现的无向图类 */
class graph_adjacency_matrix {
  private var vertices: ArrayBuffer[Int] = _
  private var adjMat: ArrayBuffer[ArrayBuffer[Int]] = _

  def this(verticesList: ArrayBuffer[Int], edges: ArrayBuffer[ArrayBuffer[Int]]) = {
    this()
    // 添加顶点
    vertices = ArrayBuffer(verticesList: _*)
    adjMat = ArrayBuffer.fill(verticesList.length)(ArrayBuffer.fill(verticesList.length)(0))


    // 添加边
    // 请注意，edges 元素代表顶点索引，即对应 vertices 元素索引
    for(edge <- edges){
      addEdge(edge(0), edge(1))
    }
  }

  // 获取顶点数量
  def size: Int = vertices.size

  /* 添加顶点 */
  def addVertex(value: Int): Unit = {
    val n: Int = vertices.size
    // 向顶点列表中添加新顶点的值
    vertices += value
    // 在邻接矩阵中添加一行
    val newRow: ArrayBuffer[Int] = ArrayBuffer()
    for (j <- 0 until n) newRow += 0
    adjMat += newRow
    // 在邻接矩阵中添加一列
    adjMat.foreach(row => row += 0)
  }



  // 删除顶点
  def removeVertex(index: Int): Unit = {
    if (index < 0 || index >= size) throw new IndexOutOfBoundsException
    // 在顶点列表中移除索引 index 的顶点
    vertices.remove(index)
    // 在邻接矩阵中删除索引 index 的行
    adjMat.remove(index)
    // 在邻接矩阵中删除索引 index 的列
    adjMat.foreach(row => row.remove(index))
  }

  /* 添加边 */
  // 参数 i, j 对应 vertices 元素索引
  def addEdge(i: Int, j: Int): Unit = {
    // 索引越界与相等处理
    if (i < 0 || j < 0 || i >= size || j >= size || i == j)
      throw new IndexOutOfBoundsException
    // // 在无向图中，邻接矩阵关于主对角线对称，即满足 (i, j) == (j, i)
    adjMat(i)(j) = 1
    adjMat(j)(i) = 1
  }

  /* 删除边 */
  // 参数 i, j 对应 vertices 元素索引
  def removeEdge(i: Int, j: Int): Unit = {
    // 索引越界与相等处理
    if (i < 0 || j < 0 || i >= size || j >= size || i == j)
      throw new IndexOutOfBoundsException
    adjMat(i)(j) = 0
    adjMat(j)(i) = 0
  }
  // 打印邻接矩阵
  def print(): Unit = {
    println(s"顶点列表 = ${vertices.mkString(", ")}")
    println("邻接矩阵 =")
    val printUtil = new PrintUtil()
    printUtil.printMatrix(adjMat)
  }
}

object graph_adjacency_matrix {
  def main(args: Array[String]): Unit = {
    val vertices = ArrayBuffer(1, 3, 2, 5, 4)
    val edges = ArrayBuffer(ArrayBuffer(0, 1), ArrayBuffer(0, 3), ArrayBuffer(1, 2),
      ArrayBuffer(2, 3), ArrayBuffer(2, 4), ArrayBuffer(3, 4))
    val graph = new graph_adjacency_matrix(vertices, edges)

    println("\n初始化后，图为")
    graph.print()

    // 添加边
    // 顶点 1, 2 的索引分别为 0, 2
    graph.addEdge(0, 2)
    println("\n添加边 1-2 后，图为")
    graph.print()

    // 删除边
    // 顶点 1, 3 的索引分别为 0, 1
    graph.removeEdge(0, 1)
    println("\n删除边 1-3 后，图为")
    graph.print()

    // 添加顶点
    graph.addVertex(6)
    println("\n添加顶点 6 后，图为")
    graph.print()

    // 删除顶点
    // 顶点 3 的索引为 1
    graph.removeVertex(1)
    println("\n删除顶点 3 后，图为")
    graph.print()
  }
}
