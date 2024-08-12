

/**
 * File: simple_hash.scala
 * Author: WangBlue (wangjiping596@gmail.com)
 * Create: 2024-08-12 15:52
 */

class simple_hash {

  /* 加法哈希 */
  def addHash(key: String) = {
    var hash: Long = 0
    val MODULUS: Int = 1000000007
    for (c <- key.toCharArray) {
      hash = (hash + c.toInt) % MODULUS
    }
    hash.toInt
  }

  /* 乘法哈希 */
  def mulHash(key: String) = {
    var hash: Long = 0
    val MODULUS: Int = 1000000007
    for (c <- key.toCharArray) {
      hash = (31 * hash + c.toInt) % MODULUS
    }
    hash.toInt
  }

  /* 异或哈希 */
  def xorHash(key: String): Int = {
    var hash: Long = 0
    val MODULUS: Int = 1000000007
    for (c <- key.toCharArray) {
      hash ^= c.toInt
    }
    (hash & MODULUS).toInt
  }


  /* 旋转哈希 */
  def rotHash(key: String) = {
    var hash: Long = 0
    val MODULUS: Int = 1000000007
    for (c <- key.toCharArray) {
      hash = ((hash << 4) ^ (hash >> 28) ^ c.toInt) % MODULUS
    }
    hash.toInt
  }

}

object simple_hash {
  def main(args: Array[String]): Unit = {
    val key = "Hello 算法"

    val simpleHash = new simple_hash()
    var hash = simpleHash.addHash(key)
    println("加法哈希值为 " + hash)

    hash = simpleHash.mulHash(key)
    println("乘法哈希值为 " + hash)

    hash = simpleHash.xorHash(key)
    println("异或哈希值为 " + hash)

    hash = simpleHash.rotHash(key)
    println("旋转哈希值为 " + hash)
  }
}
