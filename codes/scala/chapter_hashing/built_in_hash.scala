
import scala.collection.mutable.ArrayBuffer

/**
 * File: built_in_hash.scala
 * Author: WangBlue (wangjiping596@gmail.com)
 * Create: 2024-08-12 16:03
 */

object built_in_hash {
  def main(args: Array[String]): Unit = {
    // 整数的哈希值
    val num = 3
    val hashNum = num.hashCode
    println(s"整数 $num 的哈希值为 $hashNum")

    // 布尔量的哈希值
    val bol = true
    val hashBol = bol.hashCode
    println(s"布尔量 $bol 的哈希值为 $hashBol")

    // 小数的哈希值
    val dec = 3.14159
    val hashDec = dec.hashCode
    println(s"小数 $dec 的哈希值为 $hashDec")

    // 字符串的哈希值
    val str = "Hello 算法"
    val hashStr = str.hashCode
    println(s"字符串 $str 的哈希值为 $hashStr")

    // 数组的哈希值
    val arr = Array(12836, "小哈")
    val hashTup = arr.hashCode
    println(s"数组 ${arr.mkString("[", ", ", "]")} 的哈希值为 $hashTup")


    val obj = new ListNode(0)
    val hashObj = obj.hashCode
    println(s"节点对象 $obj 的哈希值为 $hashObj")

  }

}
