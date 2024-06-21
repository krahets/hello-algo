/**
 * File: my_list.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_array_and_linkedlist

/* 列表类 */
class MyList {
    private var arr: IntArray = intArrayOf() // 数组（存储列表元素）
    private var capacity: Int = 10 // 列表容量
    private var size: Int = 0 // 列表长度（当前元素数量）
    private var extendRatio: Int = 2 // 每次列表扩容的倍数

    /* 构造方法 */
    init {
        arr = IntArray(capacity)
    }

    /* 获取列表长度（当前元素数量） */
    fun size(): Int {
        return size
    }

    /* 获取列表容量 */
    fun capacity(): Int {
        return capacity
    }

    /* 访问元素 */
    fun get(index: Int): Int {
        // 索引如果越界，则抛出异常，下同
        if (index < 0 || index >= size)
            throw IndexOutOfBoundsException("索引越界")
        return arr[index]
    }

    /* 更新元素 */
    fun set(index: Int, num: Int) {
        if (index < 0 || index >= size)
            throw IndexOutOfBoundsException("索引越界")
        arr[index] = num
    }

    /* 在尾部添加元素 */
    fun add(num: Int) {
        // 元素数量超出容量时，触发扩容机制
        if (size == capacity())
            extendCapacity()
        arr[size] = num
        // 更新元素数量
        size++
    }

    /* 在中间插入元素 */
    fun insert(index: Int, num: Int) {
        if (index < 0 || index >= size)
            throw IndexOutOfBoundsException("索引越界")
        // 元素数量超出容量时，触发扩容机制
        if (size == capacity())
            extendCapacity()
        // 将索引 index 以及之后的元素都向后移动一位
        for (j in size - 1 downTo index)
            arr[j + 1] = arr[j]
        arr[index] = num
        // 更新元素数量
        size++
    }

    /* 删除元素 */
    fun remove(index: Int): Int {
        if (index < 0 || index >= size)
            throw IndexOutOfBoundsException("索引越界")
        val num = arr[index]
        // 将将索引 index 之后的元素都向前移动一位
        for (j in index..<size - 1)
            arr[j] = arr[j + 1]
        // 更新元素数量
        size--
        // 返回被删除的元素
        return num
    }

    /* 列表扩容 */
    fun extendCapacity() {
        // 新建一个长度为原数组 extendRatio 倍的新数组，并将原数组复制到新数组
        arr = arr.copyOf(capacity() * extendRatio)
        // 更新列表容量
        capacity = arr.size
    }

    /* 将列表转换为数组 */
    fun toArray(): IntArray {
        val size = size()
        // 仅转换有效长度范围内的列表元素
        val arr = IntArray(size)
        for (i in 0..<size) {
            arr[i] = get(i)
        }
        return arr
    }
}

/* Driver Code */
fun main() {
    /* 初始化列表 */
    val nums = MyList()
    /* 在尾部添加元素 */
    nums.add(1)
    nums.add(3)
    nums.add(2)
    nums.add(5)
    nums.add(4)
    println("列表 nums = ${nums.toArray().contentToString()}，容量 = ${nums.capacity()}，长度 = ${nums.size()}")

    /* 在中间插入元素 */
    nums.insert(3, 6)
    println("在索引 3 处插入数字 6 ，得到 nums = ${nums.toArray().contentToString()}")

    /* 删除元素 */
    nums.remove(3)
    println("删除索引 3 处的元素，得到 nums = ${nums.toArray().contentToString()}")

    /* 访问元素 */
    val num = nums.get(1)
    println("访问索引 1 处的元素，得到 num = $num")

    /* 更新元素 */
    nums.set(1, 0)
    println("将索引 1 处的元素更新为 0 ，得到 nums = ${nums.toArray().contentToString()}")

    /* 测试扩容机制 */
    for (i in 0..9) {
        // 在 i = 5 时，列表长度将超出列表容量，此时触发扩容机制
        nums.add(i)
    }
    println("扩容后的列表 nums = ${nums.toArray().contentToString()}，容量 = ${nums.capacity()}，长度 =  ${nums.size()}")
}