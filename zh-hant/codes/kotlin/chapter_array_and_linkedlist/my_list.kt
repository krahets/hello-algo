/**
 * File: my_list.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_array_and_linkedlist

/* 列表類別 */
class MyList {
    private var arr: IntArray = intArrayOf() // 陣列（用來儲存列表元素）
    private var capacity: Int = 10 // 列表容量
    private var size: Int = 0 // 列表長度（目前的元素數量）
    private var extendRatio: Int = 2 // 每次擴充列表容量的倍數

    /* 建構方法 */
    init {
        arr = IntArray(capacity)
    }

    /* 取得列表長度（目前的元素數量） */
    fun size(): Int {
        return size
    }

    /* 取得列表容量 */
    fun capacity(): Int {
        return capacity
    }

    /* 存取元素 */
    fun get(index: Int): Int {
        // 若索引超出範圍，就拋出例外，以下同理
        if (index < 0 || index >= size)
            throw IndexOutOfBoundsException("索引超出範圍")
        return arr[index]
    }

    /* 更新元素 */
    fun set(index: Int, num: Int) {
        if (index < 0 || index >= size)
            throw IndexOutOfBoundsException("索引超出範圍")
        arr[index] = num
    }

    /* 在尾端加入元素 */
    fun add(num: Int) {
        // 若加入元素後數量將超過容量，就觸發擴充機制
        if (size == capacity())
            extendCapacity()
        arr[size] = num
        // 更新元素數量
        size++
    }

    /* 在中間插入元素 */
    fun insert(index: Int, num: Int) {
        if (index < 0 || index >= size)
            throw IndexOutOfBoundsException("索引超出範圍")
        // 若加入元素後數量將超過容量，就觸發擴充機制
        if (size == capacity())
            extendCapacity()
        // 將索引 index 起的所有元素往後移一格
        for (j in size - 1 downTo index)
            arr[j + 1] = arr[j]
        arr[index] = num
        // 更新元素數量
        size++
    }

    /* 刪除元素 */
    fun remove(index: Int): Int {
        if (index < 0 || index >= size)
            throw IndexOutOfBoundsException("索引超出範圍")
        val num = arr[index]
        // 將索引 index 之後的所有元素往前移一格
        for (j in index..<size - 1)
            arr[j] = arr[j + 1]
        // 更新元素數量
        size--
        // 回傳刪除的元素
        return num
    }

    /* 擴充列表容量 */
    fun extendCapacity() {
        // 建立長度為原陣列 extendRatio 倍的新陣列，並將原陣列的內容複製過去
        arr = arr.copyOf(capacity() * extendRatio)
        // 更新列表容量
        capacity = arr.size
    }

    /* 將列表轉為陣列 */
    fun toArray(): IntArray {
        val size = size()
        // 僅轉換列表有效長度範圍內的元素
        val arr = IntArray(size)
        for (i in 0..<size) {
            arr[i] = get(i)
        }
        return arr
    }
}

/* 範例主程式 */
fun main() {
    /* 初始化列表 */
    val nums = MyList()
    /* 在尾端加入元素 */
    nums.add(1)
    nums.add(3)
    nums.add(2)
    nums.add(5)
    nums.add(4)
    println("列表 nums = ${nums.toArray().contentToString()}，容量 = ${nums.capacity()}，長度 = ${nums.size()}")

    /* 在中間插入元素 */
    nums.insert(3, 6)
    println("在索引 3 處插入數字 6，得到 nums = ${nums.toArray().contentToString()}")

    /* 刪除元素 */
    nums.remove(3)
    println("刪除索引 3 處的元素，得到 nums = ${nums.toArray().contentToString()}")

    /* 存取元素 */
    val num = nums.get(1)
    println("存取索引 1 處的元素，得到 num = $num")

    /* 更新元素 */
    nums.set(1, 0)
    println("將索引 1 處的元素更新為 0，得到 nums = ${nums.toArray().contentToString()}")

    /* 測試容量擴充機制 */
    for (i in 0..9) {
        // 當 i = 5，列表長度將超過容量，此時會觸發擴充機制
        nums.add(i)
    }
    println("擴充後的列表 nums = ${nums.toArray().contentToString()}，容量 = ${nums.capacity()}，長度 = ${nums.size()}")
}