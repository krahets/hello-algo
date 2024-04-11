/**
 * File: linkedlist_queue.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

/* 基于链表实现的队列 */
class LinkedListQueue(
    // 头节点 front ，尾节点 rear
    private var front: ListNode? = null,
    private var rear: ListNode? = null,
    private var queSize: Int = 0
) {

    /* 获取队列的长度 */
    fun size(): Int {
        return queSize
    }

    /* 判断队列是否为空 */
    fun isEmpty(): Boolean {
        return size() == 0
    }

    /* 入队 */
    fun push(num: Int) {
        // 在尾节点后添加 num
        val node = ListNode(num)
        // 如果队列为空，则令头、尾节点都指向该节点
        if (front == null) {
            front = node
            rear = node
            // 如果队列不为空，则将该节点添加到尾节点后
        } else {
            rear?.next = node
            rear = node
        }
        queSize++
    }

    /* 出队 */
    fun pop(): Int {
        val num = peek()
        // 删除头节点
        front = front?.next
        queSize--
        return num
    }

    /* 访问队首元素 */
    fun peek(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return front!!._val
    }

    /* 将链表转化为 Array 并返回 */
    fun toArray(): IntArray {
        var node = front
        val res = IntArray(size())
        for (i in res.indices) {
            res[i] = node!!._val
            node = node.next
        }
        return res
    }
}

/* Driver Code */
fun main() {
    /* 初始化队列 */
    val queue = LinkedListQueue()

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
    println("出队元素 pop = $pop，出队后 queue = ${queue.toArray().contentToString()}")

    /* 获取队列的长度 */
    val size = queue.size()
    println("队列长度 size = $size")

    /* 判断队列是否为空 */
    val isEmpty = queue.isEmpty()
    println("队列是否为空 = $isEmpty")
}