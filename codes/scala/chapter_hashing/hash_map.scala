import scala.collection.mutable


/**
 * File: array_hash_map.scala
 * Author: WangBlue (wangjiping596@gmail.com)
 * Create: 2024-08-12 10:10
 */


object hash_map {
  def main(args: Array[String]): Unit = {
    /* 初始化哈希表 */
    var map: mutable.Map[Int, String] = new mutable.HashMap[Int, String]()
    /* 添加操作 */
    // 在哈希表中添加键值对 (key, value)
    map.put(12836, "小哈")
    map.put(15937, "小啰")
    map.put(16750, "小算")
    map.put(13276, "小法")
    map.put(10583, "小鸭")

    val printUtil: PrintUtil = new PrintUtil()
    println("\n添加完成后，哈希表为\nKey -> Value")
    printUtil.printHashMap(map)

    /* 查询操作 */
    // 向哈希表中输入键 key ，得到值 value
    val name = map.get(15937)
    println("\n输入学号 15937 ，查询到姓名 " + name)

    /* 删除操作 */
    // 在哈希表中删除键值对 (key, value)
    map.remove(10583)
    println("\n删除 10583 后，哈希表为\nKey -> Value")
    printUtil.printHashMap(map)

    /* 遍历哈希表 */
    println("\n遍历键值对 Key->Value")

    map.foreach{case(key, value) =>
      println(s"$key -> $value")

    }

    println("\n单独遍历键 Key")
    for (key <- map.keySet) {
      println(key)
    }
    println("\n单独遍历值 Value")
    map.values.foreach{lines =>
      println(lines)
    }
  }
}
