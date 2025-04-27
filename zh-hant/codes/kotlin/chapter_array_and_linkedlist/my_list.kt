/**
 * File: my_list.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_array_and_linkedlist

/* 串列類別 */
class MyList {
    private var arr: IntArray = intArrayOf() // 陣列（儲存串列元素）
    private var capacity: Int = 10 // 串列容量
    private var size: Int = 0 // 串列長度（當前元素數量）
    private var extendRatio: Int = 2 // 每次串列擴容的倍數

    /* 建構子 */
    init {
        arr = IntArray(capacity)
    }

    /* 獲取串列長度（當前元素數量） */
    fun size(): Int {
        return size
    }

    /* 獲取串列容量 */
    fun capacity(): Int {
        return capacity
    }

    /* 訪問元素 */
    fun get(index: Int): Int {
        // 索引如果越界，則丟擲異常，下同
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

    /* 在尾部新增元素 */
    fun add(num: Int) {
        // 元素數量超出容量時，觸發擴容機制
        if (size == capacity())
            extendCapacity()
        arr[size] = num
        // 更新元素數量
        size++
    }

    /* 在中間插入元素 */
    fun insert(index: Int, num: Int) {
        if (index < 0 || index >= size)
            throw IndexOutOfBoundsException("索引越界")
        // 元素數量超出容量時，觸發擴容機制
        if (size == capacity())
            extendCapacity()
        // 將索引 index 以及之後的元素都向後移動一位
        for (j in size - 1 downTo index)
            arr[j + 1] = arr[j]
        arr[index] = num
        // 更新元素數量
        size++
    }

    /* 刪除元素 */
    fun remove(index: Int): Int {
        if (index < 0 || index >= size)
            throw IndexOutOfBoundsException("索引越界")
        val num = arr[index]
        // 將將索引 index 之後的元素都向前移動一位
        for (j in index..<size - 1)
            arr[j] = arr[j + 1]
        // 更新元素數量
        size--
        // 返回被刪除的元素
        return num
    }

    /* 串列擴容 */
    fun extendCapacity() {
        // 新建一個長度為原陣列 extendRatio 倍的新陣列，並將原陣列複製到新陣列
        arr = arr.copyOf(capacity() * extendRatio)
        // 更新串列容量
        capacity = arr.size
    }

    /* 將串列轉換為陣列 */
    fun toArray(): IntArray {
        val size = size()
        // 僅轉換有效長度範圍內的串列元素
        val arr = IntArray(size)
        for (i in 0..<size) {
            arr[i] = get(i)
        }
        return arr
    }
}

/* Driver Code */
fun main() {
    /* 初始化串列 */
    val nums = MyList()
    /* 在尾部新增元素 */
    nums.add(1)
    nums.add(3)
    nums.add(2)
    nums.add(5)
    nums.add(4)
    println("串列 nums = ${nums.toArray().contentToString()}，容量 = ${nums.capacity()}，長度 = ${nums.size()}")

    /* 在中間插入元素 */
    nums.insert(3, 6)
    println("在索引 3 處插入數字 6 ，得到 nums = ${nums.toArray().contentToString()}")

    /* 刪除元素 */
    nums.remove(3)
    println("刪除索引 3 處的元素，得到 nums = ${nums.toArray().contentToString()}")

    /* 訪問元素 */
    val num = nums.get(1)
    println("訪問索引 1 處的元素，得到 num = $num")

    /* 更新元素 */
    nums.set(1, 0)
    println("將索引 1 處的元素更新為 0 ，得到 nums = ${nums.toArray().contentToString()}")

    /* 測試擴容機制 */
    for (i in 0..9) {
        // 在 i = 5 時，串列長度將超出串列容量，此時觸發擴容機制
        nums.add(i)
    }
    println("擴容後的串列 nums = ${nums.toArray().contentToString()}，容量 = ${nums.capacity()}，長度 =  ${nums.size()}")
}