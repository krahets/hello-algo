/**
 * File: array_queue.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

/* 基於環形陣列實現的佇列 */
class ArrayQueue(capacity: Int) {
    private val nums: IntArray = IntArray(capacity) // 用於儲存佇列元素的陣列
    private var front: Int = 0 // 佇列首指標，指向佇列首元素
    private var queSize: Int = 0 // 佇列長度

    /* 獲取佇列的容量 */
    fun capacity(): Int {
        return nums.size
    }

    /* 獲取佇列的長度 */
    fun size(): Int {
        return queSize
    }

    /* 判斷佇列是否為空 */
    fun isEmpty(): Boolean {
        return queSize == 0
    }

    /* 入列 */
    fun push(num: Int) {
        if (queSize == capacity()) {
            println("佇列已滿")
            return
        }
        // 計算佇列尾指標，指向佇列尾索引 + 1
        // 透過取餘操作實現 rear 越過陣列尾部後回到頭部
        val rear = (front + queSize) % capacity()
        // 將 num 新增至佇列尾
        nums[rear] = num
        queSize++
    }

    /* 出列 */
    fun pop(): Int {
        val num = peek()
        // 佇列首指標向後移動一位，若越過尾部，則返回到陣列頭部
        front = (front + 1) % capacity()
        queSize--
        return num
    }

    /* 訪問佇列首元素 */
    fun peek(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return nums[front]
    }

    /* 返回陣列 */
    fun toArray(): IntArray {
        // 僅轉換有效長度範圍內的串列元素
        val res = IntArray(queSize)
        var i = 0
        var j = front
        while (i < queSize) {
            res[i] = nums[j % capacity()]
            i++
            j++
        }
        return res
    }
}

/* Driver Code */
fun main() {
    /* 初始化佇列 */
    val capacity = 10
    val queue = ArrayQueue(capacity)

    /* 元素入列 */
    queue.push(1)
    queue.push(3)
    queue.push(2)
    queue.push(5)
    queue.push(4)
    println("佇列 queue = ${queue.toArray().contentToString()}")

    /* 訪問佇列首元素 */
    val peek = queue.peek()
    println("佇列首元素 peek = $peek")

    /* 元素出列 */
    val pop = queue.pop()
    println("出列元素 pop = ${pop}，出列後 queue =  ${queue.toArray().contentToString()}")

    /* 獲取佇列的長度 */
    val size = queue.size()
    println("佇列長度 size = $size")

    /* 判斷佇列是否為空 */
    val isEmpty = queue.isEmpty()
    println("佇列是否為空 = $isEmpty")

    /* 測試環形陣列 */
    for (i in 0..9) {
        queue.push(i)
        queue.pop()
        println("第 $i 輪入列 + 出列後 queue = ${queue.toArray().contentToString()}")
    }
}