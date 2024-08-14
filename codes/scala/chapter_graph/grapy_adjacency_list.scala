import scala.collection.mutable
import scala.collection.mutable.ArrayBuffer

/**
 * File: grapy_adjacency_list.scala
 * Author: WangBlue (wangjiping596@gmail.com)
 * Create: 2024-08-14 14:34
 */

/* 基于邻接表实现的无向图类 */
class grapy_adjacency_list {
  // 邻接表，key：顶点，value：该顶点的所有邻接顶点
  var adjList: mutable.HashMap[Vertex, ArrayBuffer[Vertex]] = mutable.HashMap[Vertex, ArrayBuffer[Vertex]]()

  /* 构造方法 */
  def this(edges: ArrayBuffer[ArrayBuffer[Vertex]]) = {
    this()
    // 添加所有顶点和边
    for(edge <- edges){
      addVertex(edge(0))
      addVertex(edge(1))
      addEdge(edge(0), edge(1))
    }
  }

  /* 获取顶点数量 */
  def size(): Int = {
    return adjList.size
  }

  /* 添加边 */
  def addEdge(v1: Vertex, v2: Vertex): Unit = {
    if(!adjList.contains(v1) || !adjList.contains(v2) || v1 == v2){
      throw new IllegalArgumentException
    }
    // 添加边 vet1 - vet2
    adjList(v1) += v2
    adjList(v2) += v1
  }

  /* 删除边 */
  def removeEdge(v1: Vertex, v2: Vertex): Unit = {
    if(!adjList.contains(v1) || !adjList.contains(v2) || v1 == v2){
      throw new IllegalArgumentException
    }
    // 删除边 vet1 - vet2
    adjList(v1) -= v2
    adjList(v2) -= v1
  }

  /* 添加顶点 */
  def addVertex(v: Vertex): Unit = {
    if (adjList.contains(v)) {
      return
    }
    adjList.put(v, ArrayBuffer[Vertex]())
  }

  /* 删除顶点 */
  def removeVertex(v: Vertex): Unit = {
    if (!adjList.contains(v)) {
      throw new IllegalArgumentException
    }
    // 在邻接表中删除顶点 vet 对应的链表
    adjList.remove(v)
    // 遍历其他顶点的链表，删除所有包含 vet 的边
    for (value <- adjList.values) {
      value -= v
    }

  }

  /* 打印邻接表 */
  def print(): Unit = {
    println("邻接表 =")
    for ((key, value) <- adjList) {
      val tmp: List[Int] = value.map(_.value).toList
      println(s"${key.value}: $tmp,")
    }
  }
}

object grapy_adjacency_list {
  def main(args: Array[String]): Unit = {
    // 初始化无向图
    val vertex = new Vertex()
//    val vertexs = vertex.valsToVets(Array(1,3, 5))
//    val edges = ArrayBuffer(ArrayBuffer(vertexs(0), vertexs(1)), ArrayBuffer(vertexs(0), vertexs(2)))
//    val graph = new grapy_adjacency_list(edges)
//    println("\n初始化后，图为")
//    graph.print()

    val v = vertex.valsToVets(Array(1, 3, 2, 5, 4))
    val edges = ArrayBuffer(ArrayBuffer(v(0), v(1)), ArrayBuffer(v(0), v(3)), ArrayBuffer(v(1), v(2)),
      ArrayBuffer(v(2), v(3)), ArrayBuffer(v(2), v(4)), ArrayBuffer(v(3), v(4)))
    val graph = new grapy_adjacency_list(edges)

    println("\n初始化后，图为")
    graph.print()

    // 添加边
    graph.addEdge(v(0), v(2))
    println("\n添加边 1-2 后，图为")
    graph.print()

    // 删除边
    graph.removeEdge(v(0), v(1))
    println("\n删除边 1-3 后，图为")
    graph.print()

    // 添加顶点
    val v5 = new Vertex(6)
    graph.addVertex(v5)
    println("\n添加顶点 6 后，图为")
    graph.print()

    // 删除顶点
    graph.removeVertex(v(1))
    println("\n删除顶点 3 后，图为")
    graph.print()
  }
}















