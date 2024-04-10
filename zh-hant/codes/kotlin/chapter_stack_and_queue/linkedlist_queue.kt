/**
 * File: linkedlist_queue.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

/* 基於鏈結串列實現的佇列 */
class LinkedListQueue(
    // 頭節點 front ，尾節點 rear
    private var front: ListNode? = null,
    private var rear: ListNode? = null,
    private var queSize: Int = 0
) {

    /* 獲取佇列的長度 */
    fun size(): Int {
        return queSize
    }

    /* 判斷佇列是否為空 */
    fun isEmpty(): Boolean {
        return size() == 0
    }

    /* 入列 */
    fun push(num: Int) {
        // 在尾節點後新增 num
        val node = ListNode(num)
        // 如果佇列為空，則令頭、尾節點都指向該節點
        if (front == null) {
            front = node
            rear = node
            // 如果佇列不為空，則將該節點新增到尾節點後
        } else {
            rear?.next = node
            rear = node
        }
        queSize++
    }

    /* 出列 */
    fun pop(): Int {
        val num = peek()
        // 刪除頭節點
        front = front?.next
        queSize--
        return num
    }

    /* 訪問佇列首元素 */
    fun peek(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return front!!._val
    }

    /* 將鏈結串列轉化為 Array 並返回 */
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
    /* 初始化佇列 */
    val queue = LinkedListQueue()

    /* 元素入列 */
    queue.push(1)
    queue.push(3)
    queue.push(2)
    queue.push(5)
    queue.push(4)
    println("佇列 queue = ${queue.toArray().contentToString()}")

    /* 訪問佇列首元素 */
    val peek = queue.peek()
    println("佇列首元素 peek = $peek")

    /* 元素出列 */
    val pop = queue.pop()
    println("出列元素 pop = $pop，出列後 queue = ${queue.toArray().contentToString()}")

    /* 獲取佇列的長度 */
    val size = queue.size()
    println("佇列長度 size = $size")

    /* 判斷佇列是否為空 */
    val isEmpty = queue.isEmpty()
    println("佇列是否為空 = $isEmpty")
}