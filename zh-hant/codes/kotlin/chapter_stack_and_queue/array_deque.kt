/**
 * File: array_deque.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

/* 以環狀陣列實作雙端佇列 */
/* 建構子 */
class ArrayDeque(capacity: Int) {
    private var nums: IntArray = IntArray(capacity) // 存放雙端佇列元素的陣列
    private var front: Int = 0 // 隊首索引，記錄隊首元素在陣列中的位置
    private var queSize: Int = 0 // 雙端佇列長度

    /* 取得雙端佇列容量 */
    fun capacity(): Int {
        return nums.size
    }

    /* 取得雙端佇列長度 */
    fun size(): Int {
        return queSize
    }

    /* 判斷雙端佇列是否為空 */
    fun isEmpty(): Boolean {
        return queSize == 0
    }

    /* 計算環狀陣列的索引 */
    private fun index(i: Int): Int {
        // 取餘數，讓陣列的首尾相接
        // 當 i 超過陣列末端時，繞回開頭
        // 當 i 越過陣列開頭時，繞回末端
        return (i + capacity()) % capacity()
    }

    /* 從隊首加入元素 */
    fun pushFirst(num: Int) {
        if (queSize == capacity()) {
            println("雙端佇列已滿")
            return
        }
        // 將隊首索引往左移一格
        // 取餘數，讓 front 越過陣列開頭時繞回末端
        front = index(front - 1)
        // 將 num 加到隊首
        nums[front] = num
        queSize++
    }

    /* 從隊尾加入元素 */
    fun pushLast(num: Int) {
        if (queSize == capacity()) {
            println("雙端佇列已滿")
            return
        }
        // 計算下一次從隊尾寫入的位置 rear（隊尾索引 + 1）
        val rear = index(front + queSize)
        // 將 num 加到隊尾
        nums[rear] = num
        queSize++
    }

    /* 從隊首取出元素 */
    fun popFirst(): Int {
        val num = peekFirst()
        // 將隊首索引往後移一格
        front = index(front + 1)
        queSize--
        return num
    }

    /* 從隊尾取出元素 */
    fun popLast(): Int {
        val num = peekLast()
        queSize--
        return num
    }

    /* 讀取隊首元素 */
    fun peekFirst(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return nums[front]
    }

    /* 讀取隊尾元素 */
    fun peekLast(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        // 計算隊尾元素的索引
        val last = index(front + queSize - 1)
        return nums[last]
    }

    /* 回傳陣列以便輸出 */
    fun toArray(): IntArray {
        // 只轉換雙端佇列中實際存放的元素
        val res = IntArray(queSize)
        var i = 0
        var j = front
        while (i < queSize) {
            res[i] = nums[index(j)]
            i++
            j++
        }
        return res
    }
}

/* 範例程式 */
fun main() {
    /* 初始化雙端佇列 */
    val deque = ArrayDeque(10)
    deque.pushLast(3)
    deque.pushLast(2)
    deque.pushLast(5)
    println("雙端佇列 deque = ${deque.toArray().contentToString()}")

    /* 讀取隊首與隊尾元素 */
    val peekFirst = deque.peekFirst()
    println("隊首元素 peekFirst = $peekFirst")
    val peekLast = deque.peekLast()
    println("隊尾元素 peekLast = $peekLast")

    /* 將元素加入雙端佇列 */
    deque.pushLast(4)
    println("將元素 4 加到隊尾後 deque = ${deque.toArray().contentToString()}")
    deque.pushFirst(1)
    println("將元素 1 加到隊首後 deque = ${deque.toArray().contentToString()}")

    /* 從雙端佇列取出元素 */
    val popLast = deque.popLast()
    println("從隊尾取出的元素 = ${popLast}，取出後 deque = ${deque.toArray().contentToString()}")
    val popFirst = deque.popFirst()
    println("從隊首取出的元素 = ${popFirst}，取出後 deque = ${deque.toArray().contentToString()}")

    /* 取得雙端佇列長度 */
    val size = deque.size()
    println("雙端佇列長度 size = $size")

    /* 判斷雙端佇列是否為空 */
    val isEmpty = deque.isEmpty()
    println("雙端佇列是否為空 = $isEmpty")
}