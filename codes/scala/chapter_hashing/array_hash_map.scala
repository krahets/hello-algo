import scala.collection.mutable.ListBuffer

/**
 * File: array_hash_map.scala
 * Author: WangBlue (wangjiping596@gmail.com)
 * Create: 2024-08-12 10:47
 */

/* 键值对 */
class Pair{
  var key: Int = _
  var value: String = _

  def this(key: Int, value: String) = {
    this()
    this.key = key
    this.value = value
  }
}


/* 基于数组实现的哈希表 */
class ArrayHashMap {
  // 初始化数组，包含 100 个桶
  private var buckets: ListBuffer[Option[Pair]] = ListBuffer.fill(100)(None)

  /* 哈希函数 */
  def hashFunc(key: Int): Int = {
    key % buckets.length
  }

  /* 查询操作 */
  def get(key: Int): String = {
    val index: Int = hashFunc(key)
    val pair: Option[Pair] = buckets(index)
    if (pair == null) {
      null
    }

    pair match {
      case Some(pair) => pair.value
      case None => "Not found"
    }
  }

  /* 添加操作 */
  def put(key: Int, value: String) = {
    val pair: Pair = new Pair(key, value)
    val optionPair: Option[Pair] = Some(pair)
    val index: Int = hashFunc(key)
    buckets(index) = optionPair
  }

  /* 删除操作 */
  def remove(key: Int): Unit = {
    val index: Int = hashFunc(key)
    // 置为 None ，代表删除
    buckets(index) = None
  }

  /* 获取所有键值对 */
  def pairSet(): ListBuffer[Pair] = {
    val pairSet = new ListBuffer[Pair]
    for (pair <- buckets) {
      if (pair.isDefined) {
        pairSet += pair.get
      }
    }
    pairSet
  }

  /* 获取所有键 */
  def keySet(): ListBuffer[Int] = {
    val keySet: ListBuffer[Int] = new ListBuffer[Int]
    for (pair <- buckets) {
      if (pair.isDefined) {
       pair.fold{
         // 如果 pair 为 None，可以选择不做任何操作或处理 None 情况
       } {
         p => keySet += p.key
       }
      }
    }
    keySet
  }

  /* 获取所有值 */
  def valueSet(): ListBuffer[String] = {
    val valueSet: ListBuffer[String] = new ListBuffer[String]
    for (pair <- buckets) {
      if (pair.isDefined ) {
        pair.fold{
          // 如果 pair 为 None，可以选择不做任何操作或处理 None 情况
        }
        {
          p => valueSet += p.value
        }
      }
    }
    valueSet
  }

  /* 打印哈希表 */
  def print(): Unit = {
    for (pair: Pair <- pairSet()) {
      println(pair.key + " -> " + pair.value)
    }
  }
}


object array_hash_map {
  def main(args: Array[String]): Unit = {
    /* 初始化哈希表 */
    val map: ArrayHashMap = new ArrayHashMap()

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
    val name = map.get(15937)
    println("\n输入学号 15937 ，查询到姓名 " + name)

    /* 删除操作 *//* 删除操作 */
    // 在哈希表中删除键值对 (key, value)/
    map.remove(10583)
    println("\n删除 10583 后，哈希表为\nKey -> Value")
    map.print()

    /* 遍历哈希表 *//* 遍历哈希表 */
    println("\n遍历键值对 Key->Value")
    for (kv: Pair <- map.pairSet()) {
      println(kv.key + " -> " + kv.value)
    }

    println("\n单独遍历键 Key")

    for (key <- map.keySet()) {
      println(key)
    }
    println("\n单独遍历值 Value")
    for (value <- map.valueSet()) {
      println(value)
    }
  }
}
