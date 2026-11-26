/**
 * File: linkedlist_deque.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

/* 雙向鏈結串列的節點 */
class ListNode(var _val: Int) {
    // 節點值
    var next: ListNode? = null // 指向下一個節點的參照
    var prev: ListNode? = null // 指向上一個節點的參照
}

/* 以雙向鏈結串列實作雙端佇列 */
class LinkedListDeque {
    private var front: ListNode? = null // front 指向首節點
    private var rear: ListNode? = null // rear 指向尾節點
    private var queSize: Int = 0 // 雙端佇列長度

    /* 取得雙端佇列長度 */
    fun size(): Int {
        return queSize
    }

    /* 判斷雙端佇列是否為空 */
    fun isEmpty(): Boolean {
        return size() == 0
    }

    /* 加入元素 */
    fun push(num: Int, isFront: Boolean) {
        val node = ListNode(num)
        // 若鏈結串列為空，讓 front 和 rear 都指向 node
        if (isEmpty()) {
            rear = node
            front = rear
            // 從隊首加入元素
        } else if (isFront) {
            // 將 node 加到鏈結串列的開頭
            front?.prev = node
            node.next = front
            front = node // 更新首節點
            // 從隊尾加入元素
        } else {
            // 將 node 加到鏈結串列的末端
            rear?.next = node
            node.prev = rear
            rear = node // 更新尾節點
        }
        queSize++ // 將雙端佇列長度加 1
    }

    /* 從隊首加入元素 */
    fun pushFirst(num: Int) {
        push(num, true)
    }

    /* 從隊尾加入元素 */
    fun pushLast(num: Int) {
        push(num, false)
    }

    /* 取出元素 */
    fun pop(isFront: Boolean): Int {
        if (isEmpty()) 
            throw IndexOutOfBoundsException()
        val _val: Int
        // 佇列長度為 1 時，首尾兩端指向同一個節點
        if (queSize == 1) {
            _val = front!!._val
            front = null
            rear = null
        }
        // 從隊首取出元素
        else if (isFront) {
            _val = front!!._val // 暫存首節點的值
            // 移除首節點
            val fNext = front!!.next
            fNext!!.prev = null
            front!!.next = null
            front = fNext // 更新首節點
            // 從隊尾取出元素
        } else {
            _val = rear!!._val // 暫存尾節點的值
            // 移除尾節點
            val rPrev = rear!!.prev
            rPrev!!.next = null
            rear!!.prev = null
            rear = rPrev // 更新尾節點
        }
        queSize-- // 將雙端佇列長度減 1
        return _val
    }

    /* 從隊首取出元素 */
    fun popFirst(): Int {
        return pop(true)
    }

    /* 從隊尾取出元素 */
    fun popLast(): Int {
        return pop(false)
    }

    /* 讀取隊首元素 */
    fun peekFirst(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return front!!._val
    }

    /* 讀取隊尾元素 */
    fun peekLast(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return rear!!._val
    }

    /* 回傳陣列以便輸出 */
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

/* 範例程式 */
fun main() {
    /* 初始化雙端佇列 */
    val deque = LinkedListDeque()
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