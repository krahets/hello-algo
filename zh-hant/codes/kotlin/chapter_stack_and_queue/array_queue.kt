/**
 * File: array_queue.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

/* 以環狀陣列實作佇列 */
class ArrayQueue(capacity: Int) {
    private val nums: IntArray = IntArray(capacity) // 存放佇列元素的陣列
    private var front: Int = 0 // 隊首索引，記錄隊首元素在陣列中的位置
    private var queSize: Int = 0 // 佇列長度

    /* 取得佇列容量 */
    fun capacity(): Int {
        return nums.size
    }

    /* 取得佇列長度 */
    fun size(): Int {
        return queSize
    }

    /* 判斷佇列是否為空 */
    fun isEmpty(): Boolean {
        return queSize == 0
    }

    /* 入隊 */
    fun push(num: Int) {
        if (queSize == capacity()) {
            println("佇列已滿")
            return
        }
        // 計算下一次從隊尾寫入的位置 rear（隊尾索引 + 1）
        // 取餘數，讓 rear 超過陣列末端時繞回開頭
        val rear = (front + queSize) % capacity()
        // 將 num 加到隊尾
        nums[rear] = num
        queSize++
    }

    /* 出隊 */
    fun pop(): Int {
        val num = peek()
        // 將隊首索引往後移一格，若超過陣列末端就繞回開頭
        front = (front + 1) % capacity()
        queSize--
        return num
    }

    /* 讀取隊首元素 */
    fun peek(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return nums[front]
    }

    /* 回傳陣列 */
    fun toArray(): IntArray {
        // 只轉換佇列中實際存放的元素
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

/* 範例程式 */
fun main() {
    /* 初始化佇列 */
    val capacity = 10
    val queue = ArrayQueue(capacity)

    /* 將元素加入佇列 */
    queue.push(1)
    queue.push(3)
    queue.push(2)
    queue.push(5)
    queue.push(4)
    println("佇列 queue = ${queue.toArray().contentToString()}")

    /* 讀取隊首元素 */
    val peek = queue.peek()
    println("隊首元素 peek = $peek")

    /* 從佇列取出元素 */
    val pop = queue.pop()
    println("出隊元素 pop = ${pop}，出隊後 queue =  ${queue.toArray().contentToString()}")

    /* 取得佇列長度 */
    val size = queue.size()
    println("佇列長度 size = $size")

    /* 判斷佇列是否為空 */
    val isEmpty = queue.isEmpty()
    println("佇列是否為空 = $isEmpty")

    /* 測試環狀陣列 */
    for (i in 0..9) {
        queue.push(i)
        queue.pop()
        println("第 $i 輪入隊 + 出隊後 queue = ${queue.toArray().contentToString()}")
    }
}