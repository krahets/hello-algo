/**
 * File: linkedlist_queue.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

/* 以鏈結串列實作佇列 */
class LinkedListQueue(
    // front 指向首節點，rear 指向尾節點
    private var front: ListNode? = null,
    private var rear: ListNode? = null,
    private var queSize: Int = 0
) {

    /* 取得佇列長度 */
    fun size(): Int {
        return queSize
    }

    /* 判斷佇列是否為空 */
    fun isEmpty(): Boolean {
        return size() == 0
    }

    /* 入隊 */
    fun push(num: Int) {
        // 建立存有 num 的新節點，準備接到隊尾
        val node = ListNode(num)
        // 若佇列為空，讓隊首與隊尾都指向新節點
        if (front == null) {
            front = node
            rear = node
            // 若佇列非空，將新節點接在尾節點之後
        } else {
            rear?.next = node
            rear = node
        }
        queSize++
    }

    /* 出隊 */
    fun pop(): Int {
        val num = peek()
        // 移除首節點
        front = front?.next
        queSize--
        return num
    }

    /* 讀取隊首元素 */
    fun peek(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return front!!._val
    }

    /* 將鏈結串列轉成陣列並回傳 */
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
    /* 初始化佇列 */
    val queue = LinkedListQueue()

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
    println("出隊元素 pop = $pop，出隊後 queue = ${queue.toArray().contentToString()}")

    /* 取得佇列長度 */
    val size = queue.size()
    println("佇列長度 size = $size")

    /* 判斷佇列是否為空 */
    val isEmpty = queue.isEmpty()
    println("佇列是否為空 = $isEmpty")
}