/**
 * File: linkedlist_stack.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

/* 以鏈結串列實作堆疊 */
class LinkedListStack(
    private var stackPeek: ListNode? = null, // 以首節點作為堆疊頂端
    private var stkSize: Int = 0 // 堆疊長度
) {

    /* 取得堆疊長度 */
    fun size(): Int {
        return stkSize
    }

    /* 判斷堆疊是否為空 */
    fun isEmpty(): Boolean {
        return size() == 0
    }

    /* 推入堆疊 */
    fun push(num: Int) {
        val node = ListNode(num)
        node.next = stackPeek
        stackPeek = node
        stkSize++
    }

    /* 彈出堆疊頂端的元素 */
    fun pop(): Int? {
        val num = peek()
        stackPeek = stackPeek?.next
        stkSize--
        return num
    }

    /* 讀取堆疊頂端的元素 */
    fun peek(): Int? {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return stackPeek?._val
    }

    /* 將鏈結串列轉成陣列並回傳 */
    fun toArray(): IntArray {
        var node = stackPeek
        val res = IntArray(size())
        for (i in res.size - 1 downTo 0) {
            res[i] = node?._val!!
            node = node.next
        }
        return res
    }
}

/* 範例程式 */
fun main() {
    /* 初始化堆疊 */
    val stack = LinkedListStack()

    /* 將元素推入堆疊 */
    stack.push(1)
    stack.push(3)
    stack.push(2)
    stack.push(5)
    stack.push(4)
    println("堆疊 stack = ${stack.toArray().contentToString()}")

    /* 讀取堆疊頂端的元素 */
    val peek = stack.peek()!!
    println("堆疊頂端元素 peek = $peek")

    /* 從堆疊彈出元素 */
    val pop = stack.pop()!!
    println("彈出的元素 pop = $pop，彈出後 stack = ${stack.toArray().contentToString()}")

    /* 取得堆疊長度 */
    val size = stack.size()
    println("堆疊長度 size = $size")

    /* 判斷堆疊是否為空 */
    val isEmpty = stack.isEmpty()
    println("堆疊是否為空 = $isEmpty")
}