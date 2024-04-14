/**
 * File: linkedlist_stack.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

/* 基於鏈結串列實現的堆疊 */
class LinkedListStack(
    private var stackPeek: ListNode? = null, // 將頭節點作為堆疊頂
    private var stkSize: Int = 0 // 堆疊的長度
) {

    /* 獲取堆疊的長度 */
    fun size(): Int {
        return stkSize
    }

    /* 判斷堆疊是否為空 */
    fun isEmpty(): Boolean {
        return size() == 0
    }

    /* 入堆疊 */
    fun push(num: Int) {
        val node = ListNode(num)
        node.next = stackPeek
        stackPeek = node
        stkSize++
    }

    /* 出堆疊 */
    fun pop(): Int? {
        val num = peek()
        stackPeek = stackPeek?.next
        stkSize--
        return num
    }

    /* 訪問堆疊頂元素 */
    fun peek(): Int? {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return stackPeek?._val
    }

    /* 將 List 轉化為 Array 並返回 */
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

/* Driver Code */
fun main() {
    /* 初始化堆疊 */
    val stack = LinkedListStack()

    /* 元素入堆疊 */
    stack.push(1)
    stack.push(3)
    stack.push(2)
    stack.push(5)
    stack.push(4)
    println("堆疊 stack = ${stack.toArray().contentToString()}")

    /* 訪問堆疊頂元素 */
    val peek = stack.peek()!!
    println("堆疊頂元素 peek = $peek")

    /* 元素出堆疊 */
    val pop = stack.pop()!!
    println("出堆疊元素 pop = $pop，出堆疊後 stack = ${stack.toArray().contentToString()}")

    /* 獲取堆疊的長度 */
    val size = stack.size()
    println("堆疊的長度 size = $size")

    /* 判斷是否為空 */
    val isEmpty = stack.isEmpty()
    println("堆疊是否為空 = $isEmpty")
}