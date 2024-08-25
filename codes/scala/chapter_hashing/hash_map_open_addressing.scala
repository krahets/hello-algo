import scala.collection.mutable.ArrayBuffer

/**
 * File: hash_map_open_addressing.scala
 * Author: WangBlue (wangjiping596@gmail.com)
 * Create: 2024-08-12 15:13
 */

class hash_map_open_addressing {
  private var size: Int = 0 // 键值对数量
  private var capacity: Int = 4 // 哈希表容量
  private val loadThres: Double = 2.0 / 3.0 // 触发扩容的负载因子阈值
  private val extendRatio: Int = 2 // 扩容倍数
  private var buckets: Array[Option[Pair]] = Array.fill(capacity)(None) // 桶数组
  private val TOMBSTONE: Option[Pair] = Some(new Pair(-1, "-1")) // 删除标记

  /* 哈希函数 */
  def hashFunc(key: Int): Int = {
    key % capacity
  }

  /* 负载因子 */
  def loadFactor(): Double = {
    size.toDouble / capacity
  }

  /* 搜索 key 对应的桶索引 */
  def findBucket(key: Int): Int = {
    var index: Int = hashFunc(key)
    var firstTombstone = -1
    // 线性探测，当遇到空桶时跳出
    while (buckets(index).isDefined) {
      // 若遇到 key ，返回对应的桶索引
      if (buckets(index).get.key == key) {
        // 若之前遇到了删除标记，则将键值对移动至该索引处
        if(firstTombstone!= -1){
          buckets(firstTombstone) = buckets(index)
          buckets(index) = TOMBSTONE
          return firstTombstone // 返回移动后的桶索引
        }
        return index // 返回桶索引
      }
      // 记录遇到的首个删除标记
      if(firstTombstone == -1 && buckets(index) == TOMBSTONE){
        firstTombstone = index
      }
      // 计算桶索引，越过尾部则返回头部
      index = (index + 1) % capacity
    }
    // 若 key 不存在，则返回添加点的索引
    if(firstTombstone == -1) index else firstTombstone
  }

  /* 查询操作 */
  def get(key: Int): String = {
    // 搜索 key 对应的桶索引
    val index: Int = findBucket(key)
    // 若找到键值对，则返回对应 val
    if(buckets(index) != null && buckets(index) != TOMBSTONE){
      return buckets(index).get.value
    }
    null // 若未找到键值对，则返回 null
  }

  /* 扩容哈希表 */
  def extend(): Unit = {
    // 暂存原哈希表
    val bucketsTmp: Array[Option[Pair]] = buckets
    // 初始化扩容后的新哈希表// 初始化扩容后的新哈希表
    capacity *= extendRatio
    buckets = Array.fill(capacity)(None)
    size = 0
    // 将键值对从原哈希表搬运至新哈希表
    for(bucket <- bucketsTmp; pair <- bucket){
      put(pair.key, pair.value)
    }
  }


  /* 添加操作 */
  def put(key: Int, value: String): Unit = {
    // 当负载因子超过阈值时，执行扩容
    if (loadFactor() > loadThres) extend()
    // 搜索 key 对应的桶索引
    var index: Int = findBucket(key)
    // 若找到键值对，则覆盖 val 并返回
    if (buckets(index).isDefined && (buckets(index) != TOMBSTONE)) {
      buckets(index).get.value = value
      return
    }

    // 若键值对不存在，则添加该键值对// 若键值对不存在，则添加该键值对
    buckets(index) = Some(new Pair(key, value))
    size += 1
  }

  /* 删除操作 */
  def remove(key: Int): Unit = {
    // 搜索 key 对应的桶索引
    var index: Int = findBucket(key)
    // 若找到键值对，则用删除标记覆盖它
    if (buckets(index) != null && (buckets(index) != TOMBSTONE)) {
      buckets(index) = TOMBSTONE
      size -= 1
    }
  }

  /* 打印哈希表 */
  def print(): Unit = {
    val result: ArrayBuffer[String] = new ArrayBuffer[String]()
    for (bucket <- buckets) {
      val temp: String = if(bucket.isEmpty) "empty"
      else bucket.map(pair => s"${pair.key} -> ${pair.value}").mkString(", ")
      result += temp
    }
    println(result.mkString(" \n"))
  }

}
object hash_map_open_addressing {
  def main(args: Array[String]): Unit = {
    /* 初始化哈希表 */
    val map: hash_map_open_addressing = new hash_map_open_addressing()
    /* 添加操作 */
    // 在哈希表中添加键值对 (key, value)
    map.put(12836, "小哈")
    map.put(15937, "小啰")
    map.put(16750, "小算")
    map.put(13276, "小法")
    map.put(10583, "小鸭")
    println("\n添加完成后，哈希表为\nKey -> Value")
    map.print()

    // 查询操作
    // 向哈希表中输入键 key ，得到值 val
    val name = map.get(13276)
    println("\n输入学号 13276 ，查询到姓名 " + name)

    // 删除操作
    // 在哈希表中删除键值对 (key, val)
    map.remove(16750)
    println("\n删除 16750 后，哈希表为\nKey -> Value")
    map.print()


  }
}

