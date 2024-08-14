import scala.collection.mutable.ArrayBuffer

/**
 * File: Vertex.scala
 * Author: WangBlue (wangjiping596@gmail.com)
 * Create: 2024-08-14 14:39
 */

/* 顶点类 */
class Vertex {
  var value: Int = 0 // 顶点值

  def this(value: Int) = {
    this()
    this.value = value
  }

  /* 输入值列表 vals ，返回顶点列表 vets */
  def valsToVets(vals: Array[Int]): Array[Vertex] = {
    vals.map(v => new Vertex(v))
  }

  /* 输入顶点列表 vets ，返回值列表 vals */
  def vetsToVals(vets: ArrayBuffer[Vertex]): ArrayBuffer[Int] = {
    vets.map(v => v.value)
  }

}
