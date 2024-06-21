/**
 * File: linkedlist_deque.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

/* 雙向鏈結串列節點 */
class ListNode(var _val: Int) {
    // 節點值
    var next: ListNode? = null // 後繼節點引用
    var prev: ListNode? = null // 前驅節點引用
}

/* 基於雙向鏈結串列實現的雙向佇列 */
class LinkedListDeque {
    private var front: ListNode? = null // 頭節點 front
    private var rear: ListNode? = null // 尾節點 rear
    private var queSize: Int = 0 // 雙向佇列的長度

    /* 獲取雙向佇列的長度 */
    fun size(): Int {
        return queSize
    }

    /* 判斷雙向佇列是否為空 */
    fun isEmpty(): Boolean {
        return size() == 0
    }

    /* 入列操作 */
    fun push(num: Int, isFront: Boolean) {
        val node = ListNode(num)
        // 若鏈結串列為空，則令 front 和 rear 都指向 node
        if (isEmpty()) {
            rear = node
            front = rear
            // 佇列首入列操作
        } else if (isFront) {
            // 將 node 新增至鏈結串列頭部
            front?.prev = node
            node.next = front
            front = node // 更新頭節點
            // 佇列尾入列操作
        } else {
            // 將 node 新增至鏈結串列尾部
            rear?.next = node
            node.prev = rear
            rear = node // 更新尾節點
        }
        queSize++ // 更新佇列長度
    }

    /* 佇列首入列 */
    fun pushFirst(num: Int) {
        push(num, true)
    }

    /* 佇列尾入列 */
    fun pushLast(num: Int) {
        push(num, false)
    }

    /* 出列操作 */
    fun pop(isFront: Boolean): Int {
        if (isEmpty()) 
            throw IndexOutOfBoundsException()
        val _val: Int
        // 佇列首出列操作
        if (isFront) {
            _val = front!!._val // 暫存頭節點值
            // 刪除頭節點
            val fNext = front!!.next
            if (fNext != null) {
                fNext.prev = null
                front!!.next = null
            }
            front = fNext // 更新頭節點
            // 佇列尾出列操作
        } else {
            _val = rear!!._val // 暫存尾節點值
            // 刪除尾節點
            val rPrev = rear!!.prev
            if (rPrev != null) {
                rPrev.next = null
                rear!!.prev = null
            }
            rear = rPrev // 更新尾節點
        }
        queSize-- // 更新佇列長度
        return _val
    }

    /* 佇列首出列 */
    fun popFirst(): Int {
        return pop(true)
    }

    /* 佇列尾出列 */
    fun popLast(): Int {
        return pop(false)
    }

    /* 訪問佇列首元素 */
    fun peekFirst(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return front!!._val
    }

    /* 訪問佇列尾元素 */
    fun peekLast(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return rear!!._val
    }

    /* 返回陣列用於列印 */
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
    /* 初始化雙向佇列 */
    val deque = LinkedListDeque()
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