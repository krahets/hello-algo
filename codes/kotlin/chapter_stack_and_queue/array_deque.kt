/**
 * File: array_deque.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

/* 基于环形数组实现的双向队列 */
/* 构造方法 */
class ArrayDeque(capacity: Int) {
    private var nums: IntArray = IntArray(capacity) // 用于存储双向队列元素的数组
    private var front: Int = 0 // 队首指针，指向队首元素
    private var queSize: Int = 0 // 双向队列长度

    /* 获取双向队列的容量 */
    fun capacity(): Int {
        return nums.size
    }

    /* 获取双向队列的长度 */
    fun size(): Int {
        return queSize
    }

    /* 判断双向队列是否为空 */
    fun isEmpty(): Boolean {
        return queSize == 0
    }

    /* 计算环形数组索引 */
    private fun index(i: Int): Int {
        // 通过取余操作实现数组首尾相连
        // 当 i 越过数组尾部后，回到头部
        // 当 i 越过数组头部后，回到尾部
        return (i + capacity()) % capacity()
    }

    /* 队首入队 */
    fun pushFirst(num: Int) {
        if (queSize == capacity()) {
            println("双向队列已满")
            return
        }
        // 队首指针向左移动一位
        // 通过取余操作实现 front 越过数组头部后回到尾部
        front = index(front - 1)
        // 将 num 添加至队首
        nums[front] = num
        queSize++
    }

    /* 队尾入队 */
    fun pushLast(num: Int) {
        if (queSize == capacity()) {
            println("双向队列已满")
            return
        }
        // 计算队尾指针，指向队尾索引 + 1
        val rear = index(front + queSize)
        // 将 num 添加至队尾
        nums[rear] = num
        queSize++
    }

    /* 队首出队 */
    fun popFirst(): Int {
        val num = peekFirst()
        // 队首指针向后移动一位
        front = index(front + 1)
        queSize--
        return num
    }

    /* 队尾出队 */
    fun popLast(): Int {
        val num = peekLast()
        queSize--
        return num
    }

    /* 访问队首元素 */
    fun peekFirst(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return nums[front]
    }

    /* 访问队尾元素 */
    fun peekLast(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        // 计算尾元素索引
        val last = index(front + queSize - 1)
        return nums[last]
    }

    /* 返回数组用于打印 */
    fun toArray(): IntArray {
        // 仅转换有效长度范围内的列表元素
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
    /* 初始化双向队列 */
    val deque = ArrayDeque(10)
    deque.pushLast(3)
    deque.pushLast(2)
    deque.pushLast(5)
    println("双向队列 deque = ${deque.toArray().contentToString()}")

    /* 访问元素 */
    val peekFirst = deque.peekFirst()
    println("队首元素 peekFirst = $peekFirst")
    val peekLast = deque.peekLast()
    println("队尾元素 peekLast = $peekLast")

    /* 元素入队 */
    deque.pushLast(4)
    println("元素 4 队尾入队后 deque = ${deque.toArray().contentToString()}")
    deque.pushFirst(1)
    println("元素 1 队首入队后 deque = ${deque.toArray().contentToString()}")

    /* 元素出队 */
    val popLast = deque.popLast()
    println("队尾出队元素 = ${popLast}，队尾出队后 deque = ${deque.toArray().contentToString()}")
    val popFirst = deque.popFirst()
    println("队首出队元素 = ${popFirst}，队首出队后 deque = ${deque.toArray().contentToString()}")

    /* 获取双向队列的长度 */
    val size = deque.size()
    println("双向队列长度 size = $size")

    /* 判断双向队列是否为空 */
    val isEmpty = deque.isEmpty()
    println("双向队列是否为空 = $isEmpty")
}