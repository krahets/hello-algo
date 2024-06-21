/**
 * File: linkedlist_deque.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

/* 双向链表节点 */
class ListNode(var _val: Int) {
    // 节点值
    var next: ListNode? = null // 后继节点引用
    var prev: ListNode? = null // 前驱节点引用
}

/* 基于双向链表实现的双向队列 */
class LinkedListDeque {
    private var front: ListNode? = null // 头节点 front
    private var rear: ListNode? = null // 尾节点 rear
    private var queSize: Int = 0 // 双向队列的长度

    /* 获取双向队列的长度 */
    fun size(): Int {
        return queSize
    }

    /* 判断双向队列是否为空 */
    fun isEmpty(): Boolean {
        return size() == 0
    }

    /* 入队操作 */
    fun push(num: Int, isFront: Boolean) {
        val node = ListNode(num)
        // 若链表为空，则令 front 和 rear 都指向 node
        if (isEmpty()) {
            rear = node
            front = rear
            // 队首入队操作
        } else if (isFront) {
            // 将 node 添加至链表头部
            front?.prev = node
            node.next = front
            front = node // 更新头节点
            // 队尾入队操作
        } else {
            // 将 node 添加至链表尾部
            rear?.next = node
            node.prev = rear
            rear = node // 更新尾节点
        }
        queSize++ // 更新队列长度
    }

    /* 队首入队 */
    fun pushFirst(num: Int) {
        push(num, true)
    }

    /* 队尾入队 */
    fun pushLast(num: Int) {
        push(num, false)
    }

    /* 出队操作 */
    fun pop(isFront: Boolean): Int {
        if (isEmpty()) 
            throw IndexOutOfBoundsException()
        val _val: Int
        // 队首出队操作
        if (isFront) {
            _val = front!!._val // 暂存头节点值
            // 删除头节点
            val fNext = front!!.next
            if (fNext != null) {
                fNext.prev = null
                front!!.next = null
            }
            front = fNext // 更新头节点
            // 队尾出队操作
        } else {
            _val = rear!!._val // 暂存尾节点值
            // 删除尾节点
            val rPrev = rear!!.prev
            if (rPrev != null) {
                rPrev.next = null
                rear!!.prev = null
            }
            rear = rPrev // 更新尾节点
        }
        queSize-- // 更新队列长度
        return _val
    }

    /* 队首出队 */
    fun popFirst(): Int {
        return pop(true)
    }

    /* 队尾出队 */
    fun popLast(): Int {
        return pop(false)
    }

    /* 访问队首元素 */
    fun peekFirst(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return front!!._val
    }

    /* 访问队尾元素 */
    fun peekLast(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return rear!!._val
    }

    /* 返回数组用于打印 */
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
    /* 初始化双向队列 */
    val deque = LinkedListDeque()
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