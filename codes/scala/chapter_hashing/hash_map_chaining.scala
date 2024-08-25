import scala.collection.mutable.ArrayBuffer

/**
 * File: hash_map_chaining.scala
 * Author: WangBlue (wangjiping596@gmail.com)
 * Create: 2024-08-12 11:32
 */

/* 链式地址哈希表 */
class hash_map_chaining(
                         private var size: Int = 0, // 键值对数量
                         private var capacity: Int = 4, // 哈希表容量
                         private var loadThres: Double = 1.5, // 触发扩容的负载因子阈值
                         private var extendRatio: Int = 2 // 扩容倍数
                       )
{
  private var buckets: ArrayBuffer[ArrayBuffer[Pair]] =
    ArrayBuffer.fill(capacity)(ArrayBuffer.empty[Pair])



  /* 哈希函数 */
  def hashFunc(key: Int): Int = {
    key % capacity
  }

  /* 负载因子 */
  def loadFactor(): Double = {
    size.toDouble / capacity
  }

  /* 扩容哈希表 */
  def extend(): Unit = {
    // 暂存原哈希表
    var oldBuckets = buckets
    // 初始化扩容后的新哈希表
    capacity *= extendRatio
    buckets = ArrayBuffer.fill(capacity)(ArrayBuffer.empty[Pair])

    // 重新插入原数据
    for (bucket <- oldBuckets; pair <- bucket) {
      put(pair.key, pair.value)
    }
  }


  /* 查询操作 */
  def get(key: Int): String = {
    val index = hashFunc(key)
    val bucket: ArrayBuffer[Pair] = buckets(index)
    // 遍历桶，若找到 key ，则返回对应 val
    for (pair <- bucket) {
      if (pair.key == key) {
        return pair.value
      }
    }
    // 若未找到 key ，则返回 null
    null
  }

  /* 添加操作 */
  def put(key: Int, value: String): Unit = {
    // 当负载因子超过阈值时，执行扩容
    if (loadFactor() > loadThres) {
      extend()
    }

    val index = hashFunc(key)
    val bucket = buckets(index)


    // 遍历桶，若遇到指定 key，则更新对应 val 并返回
    for (pair <- bucket) {
      if (pair.key == key) {
        pair.value = value
        return
      }
    }

    // 若无该 key，则将键值对添加至尾部
    val newPair = new Pair(key, value)
    bucket += newPair
    size += 1
  }


  /* 删除操作 */
  def remove(key: Int): Unit = {
    val index = hashFunc(key)
    val bucket = buckets(index)

    // 查找并删除匹配的键值对
    val pairToRemove = bucket.find(_.key == key)
    pairToRemove.foreach{
      pair =>
        bucket -= pair
        size -= 1
    }
  }

  /* 打印哈希表 */
  def print(): Unit = {
    val result: ArrayBuffer[String] = new ArrayBuffer[String]()
    for (bucket <- buckets) {
      val temp: String = bucket.map(
        pair => s"${pair.key} -> ${pair.value}").mkString(", " )
      result += temp
    }
    println(result.mkString("\n"))
  }
}

object hash_map_chaining {
  def main(args: Array[String]): Unit = {
    /* 初始化哈希表 */
    val map: hash_map_chaining = new hash_map_chaining()
    /* 添加操作 */
    // 在哈希表中添加键值对 (key, value)
    map.put(12836, "小哈")
    map.put(15937, "小啰")
    map.put(16750, "小算")
    map.put(13276, "小法")
    map.put(10583, "小鸭")
    println("\n添加完成后，哈希表为\nKey -> Value")
    map.print()

    /* 查询操作 */
    // 向哈希表中输入键 key ，得到值 value
    val name: String = map.get(13276)
    println("\n输入学号 13276 ，查询到姓名 " + name)

    /* 删除操作 */
    // 在哈希表中删除键值对 (key, value)
    map.remove(12836)
    println("\n删除 12836 后，哈希表为\nKey -> Value")
    map.print()

  }
}
