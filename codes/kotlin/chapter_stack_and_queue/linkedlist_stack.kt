/**
 * File: linkedlist_stack.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

/* 基于链表实现的栈 */
class LinkedListStack(
    private var stackPeek: ListNode? = null, // 将头节点作为栈顶
    private var stkSize: Int = 0 // 栈的长度
) {

    /* 获取栈的长度 */
    fun size(): Int {
        return stkSize
    }

    /* 判断栈是否为空 */
    fun isEmpty(): Boolean {
        return size() == 0
    }

    /* 入栈 */
    fun push(num: Int) {
        val node = ListNode(num)
        node.next = stackPeek
        stackPeek = node
        stkSize++
    }

    /* 出栈 */
    fun pop(): Int? {
        val num = peek()
        stackPeek = stackPeek?.next
        stkSize--
        return num
    }

    /* 访问栈顶元素 */
    fun peek(): Int? {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return stackPeek?._val
    }

    /* 将 List 转化为 Array 并返回 */
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
    /* 初始化栈 */
    val stack = LinkedListStack()

    /* 元素入栈 */
    stack.push(1)
    stack.push(3)
    stack.push(2)
    stack.push(5)
    stack.push(4)
    println("栈 stack = ${stack.toArray().contentToString()}")

    /* 访问栈顶元素 */
    val peek = stack.peek()!!
    println("栈顶元素 peek = $peek")

    /* 元素出栈 */
    val pop = stack.pop()!!
    println("出栈元素 pop = $pop，出栈后 stack = ${stack.toArray().contentToString()}")

    /* 获取栈的长度 */
    val size = stack.size()
    println("栈的长度 size = $size")

    /* 判断是否为空 */
    val isEmpty = stack.isEmpty()
    println("栈是否为空 = $isEmpty")
}