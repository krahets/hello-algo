/**
 * File: array_deque.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

/* 基於環形陣列實現的雙向佇列 */
/* 建構子 */
class ArrayDeque(capacity: Int) {
    private var nums: IntArray = IntArray(capacity) // 用於儲存雙向佇列元素的陣列
    private var front: Int = 0 // 佇列首指標，指向佇列首元素
    private var queSize: Int = 0 // 雙向佇列長度

    /* 獲取雙向佇列的容量 */
    fun capacity(): Int {
        return nums.size
    }

    /* 獲取雙向佇列的長度 */
    fun size(): Int {
        return queSize
    }

    /* 判斷雙向佇列是否為空 */
    fun isEmpty(): Boolean {
        return queSize == 0
    }

    /* 計算環形陣列索引 */
    private fun index(i: Int): Int {
        // 透過取餘操作實現陣列首尾相連
        // 當 i 越過陣列尾部後，回到頭部
        // 當 i 越過陣列頭部後，回到尾部
        return (i + capacity()) % capacity()
    }

    /* 佇列首入列 */
    fun pushFirst(num: Int) {
        if (queSize == capacity()) {
            println("雙向佇列已滿")
            return
        }
        // 佇列首指標向左移動一位
        // 透過取餘操作實現 front 越過陣列頭部後回到尾部
        front = index(front - 1)
        // 將 num 新增至佇列首
        nums[front] = num
        queSize++
    }

    /* 佇列尾入列 */
    fun pushLast(num: Int) {
        if (queSize == capacity()) {
            println("雙向佇列已滿")
            return
        }
        // 計算佇列尾指標，指向佇列尾索引 + 1
        val rear = index(front + queSize)
        // 將 num 新增至佇列尾
        nums[rear] = num
        queSize++
    }

    /* 佇列首出列 */
    fun popFirst(): Int {
        val num = peekFirst()
        // 佇列首指標向後移動一位
        front = index(front + 1)
        queSize--
        return num
    }

    /* 佇列尾出列 */
    fun popLast(): Int {
        val num = peekLast()
        queSize--
        return num
    }

    /* 訪問佇列首元素 */
    fun peekFirst(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return nums[front]
    }

    /* 訪問佇列尾元素 */
    fun peekLast(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        // 計算尾元素索引
        val last = index(front + queSize - 1)
        return nums[last]
    }

    /* 返回陣列用於列印 */
    fun toArray(): IntArray {
        // 僅轉換有效長度範圍內的串列元素
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

/* Driver Code */
fun main() {
    /* 初始化雙向佇列 */
    val deque = ArrayDeque(10)
    deque.pushLast(3)
    deque.pushLast(2)
    deque.pushLast(5)
    println("雙向佇列 deque = ${deque.toArray().contentToString()}")

    /* 訪問元素 */
    val peekFirst = deque.peekFirst()
    println("佇列首元素 peekFirst = $peekFirst")
    val peekLast = deque.peekLast()
    println("佇列尾元素 peekLast = $peekLast")

    /* 元素入列 */
    deque.pushLast(4)
    println("元素 4 佇列尾入列後 deque = ${deque.toArray().contentToString()}")
    deque.pushFirst(1)
    println("元素 1 佇列首入列後 deque = ${deque.toArray().contentToString()}")

    /* 元素出列 */
    val popLast = deque.popLast()
    println("佇列尾出列元素 = ${popLast}，佇列尾出列後 deque = ${deque.toArray().contentToString()}")
    val popFirst = deque.popFirst()
    println("佇列首出列元素 = ${popFirst}，佇列首出列後 deque = ${deque.toArray().contentToString()}")

    /* 獲取雙向佇列的長度 */
    val size = deque.size()
    println("雙向佇列長度 size = $size")

    /* 判斷雙向佇列是否為空 */
    val isEmpty = deque.isEmpty()
    println("雙向佇列是否為空 = $isEmpty")
}