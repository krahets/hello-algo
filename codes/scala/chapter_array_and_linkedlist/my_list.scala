
/**
 * File: my_list.scala
 * Author: WangBlue (wangjiping596@gmail.com)
 * Create: 2024-08-10 18:24
 */
class my_list(initialCapacity: Int = 10) {
  // 数组（存储列表元素）
  private var arr: Array[Int] = new Array[Int](initialCapacity)
  private var size: Int = 0      // 列表容量
  private var capacity: Int = initialCapacity   // 列表长度（当前元素数量）
  private var extendRatio = 2    // 每次列表扩容的倍数



  /* 获取列表长度（当前元素数量） */
  def getSize(): Int = {
    size
  }

  /* 获取列表容量 */
  def getCapacity(): Int = {
    capacity
  }

  /* 访问元素 */
  def get(index: Int): Int = {
    if (index < 0 || index >= getSize()){
      throw new IndexOutOfBoundsException("索引越界")
    }
    arr(index)
  }

  /* 更新元素 */
  def set(index: Int, num: Int): Unit = {
    if (index < 0 || index >= getSize()){
      throw new IndexOutOfBoundsException("索引越界")
    }
    arr(index) = num
  }


  /* 列表扩容 */
  def extendCapacity(): Unit = {
    // 计算新的容量
    capacity *= extendRatio
    // 创建一个新的数组
    val newArr = new Array[Int](capacity)
    // 复制现有数组到新数组
    Array.copy(arr, 0, newArr, 0, size)
    // 替换旧数组
    arr = newArr
  }

  /* 在尾部添加元素 */
  def add(num: Int): Unit = {
    // 元素数量超出容量时，触发扩容机制
    if (size == getCapacity()){
      extendCapacity()
    }
    arr(size) = num
    // 更新元素数量
    size += 1
  }

  /* 在中间插入元素 */
  def insert(index: Int, num: Int): Unit = {
    if (index < 0 || index >= size) {
      throw new IndexOutOfBoundsException("索引越界")
    }
    // 元素数量超出容量时，触发扩容机制// 元素数量超出容量时，触发扩容机制
    if (size == getCapacity()){
      extendCapacity()
    }

    // 将索引 index 以及之后的元素都向后移动一位
    for (i <- size - 1 to index by -1){
      arr(i+1) = arr(i)
    }
    arr(index) = num
    // 更新元素数量
    size += 1
  }

  /* 删除元素 */
  def remove(index: Int): Int = {
    if (index < 0 || index >= size) {
      throw new IndexOutOfBoundsException("索引越界")
    }
    val num = arr(index)
    // 将索引 index 以及之后的元素都向前移动一位
    for (i <- index until size - 1) {
      arr(i) = arr(i + 1)
    }
    // 更新元素数量
    size -= 1
    // 返回被删除的元素// 返回被删除的元素
    num
  }

  /* 将列表转换为数组 */
  def toArray(): Array[Int] = {
    val size = getSize()

    // 仅转换有效长度范围内的列表元素
    val arr = new Array[Int](size)
    for (i <- 0 until size){
      arr(i) = get(i)
    }
    arr;
  }

}

/* Driver Code */
object my_list {
  def main(args: Array[String]): Unit = {
    val nums: my_list = new my_list()
    /* 在尾部添加元素 */
    nums.add(1)
    nums.add(3)
    nums.add(2)
    nums.add(5)
    nums.add(4)

    println("列表 nums = [" + nums.toArray().mkString(", ") +"]"+ " ,容量 = " + nums.capacity + " ，长度 = " + nums.size)

    /* 在中间插入元素 */
    nums.insert(3, 6)
    println("在索引 3 处插入数字 6 ，得到 nums = [" + nums.toArray().mkString(", ") +"]")

    /* 删除元素 */
    nums.remove(3)
    println("删除索引 3 处的元素，得到 nums = [" + nums.toArray().mkString(", ") + "]")

    /* 访问元素 */
    val num = nums.get(1)
    println("访问索引 1 处的元素，得到 num = " + num)

    /* 更新元素 */
    nums.set(1, 0)
    println("将索引 1 处的元素更新为 0 ，得到 nums = [" + nums.toArray().mkString(", ") + "]")

    /* 测试扩容机制 */
    for(i <- 0 until 10){
      // 在 i = 5 时，列表长度将超出列表容量，此时触发扩容机制
      nums.add(i)
    }
    println("扩容后的列表 nums = [" + (nums.toArray().mkString(", "))
      + "]"+ " ,容量 = " + nums.capacity + " ，长度 = " + nums.size)
  }
}
