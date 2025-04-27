/**
 * File: array_queue.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

/* 基于环形数组实现的队列 */
class ArrayQueue(capacity: Int) {
    private val nums: IntArray = IntArray(capacity) // 用于存储队列元素的数组
    private var front: Int = 0 // 队首指针，指向队首元素
    private var queSize: Int = 0 // 队列长度

    /* 获取队列的容量 */
    fun capacity(): Int {
        return nums.size
    }

    /* 获取队列的长度 */
    fun size(): Int {
        return queSize
    }

    /* 判断队列是否为空 */
    fun isEmpty(): Boolean {
        return queSize == 0
    }

    /* 入队 */
    fun push(num: Int) {
        if (queSize == capacity()) {
            println("队列已满")
            return
        }
        // 计算队尾指针，指向队尾索引 + 1
        // 通过取余操作实现 rear 越过数组尾部后回到头部
        val rear = (front + queSize) % capacity()
        // 将 num 添加至队尾
        nums[rear] = num
        queSize++
    }

    /* 出队 */
    fun pop(): Int {
        val num = peek()
        // 队首指针向后移动一位，若越过尾部，则返回到数组头部
        front = (front + 1) % capacity()
        queSize--
        return num
    }

    /* 访问队首元素 */
    fun peek(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return nums[front]
    }

    /* 返回数组 */
    fun toArray(): IntArray {
        // 仅转换有效长度范围内的列表元素
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
    /* 初始化队列 */
    val capacity = 10
    val queue = ArrayQueue(capacity)

    /* 元素入队 */
    queue.push(1)
    queue.push(3)
    queue.push(2)
    queue.push(5)
    queue.push(4)
    println("队列 queue = ${queue.toArray().contentToString()}")

    /* 访问队首元素 */
    val peek = queue.peek()
    println("队首元素 peek = $peek")

    /* 元素出队 */
    val pop = queue.pop()
    println("出队元素 pop = ${pop}，出队后 queue =  ${queue.toArray().contentToString()}")

    /* 获取队列的长度 */
    val size = queue.size()
    println("队列长度 size = $size")

    /* 判断队列是否为空 */
    val isEmpty = queue.isEmpty()
    println("队列是否为空 = $isEmpty")

    /* 测试环形数组 */
    for (i in 0..9) {
        queue.push(i)
        queue.pop()
        println("第 $i 轮入队 + 出队后 queue = ${queue.toArray().contentToString()}")
    }
}