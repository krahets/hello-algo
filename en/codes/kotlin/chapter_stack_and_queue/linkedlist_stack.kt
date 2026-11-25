/**
 * File: linkedlist_stack.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

/* Stack backed by a linked list */
class LinkedListStack(
    private var stackPeek: ListNode? = null, // Use the head node as the top of the stack
    private var stkSize: Int = 0 // Stack size
) {

    /* Get the stack size */
    fun size(): Int {
        return stkSize
    }

    /* Check whether the stack is empty */
    fun isEmpty(): Boolean {
        return size() == 0
    }

    /* Push an element onto the stack */
    fun push(num: Int) {
        val node = ListNode(num)
        node.next = stackPeek
        stackPeek = node
        stkSize++
    }

    /* Remove and return the top element */
    fun pop(): Int? {
        val num = peek()
        stackPeek = stackPeek?.next
        stkSize--
        return num
    }

    /* Peek at the top element */
    fun peek(): Int? {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return stackPeek?._val
    }

    /* Return the linked list elements as an array */
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

/* Driver code */
fun main() {
    /* Initialize the stack */
    val stack = LinkedListStack()

    /* Push elements onto the stack */
    stack.push(1)
    stack.push(3)
    stack.push(2)
    stack.push(5)
    stack.push(4)
    println("stack = ${stack.toArray().contentToString()}")

    /* Peek at the top element */
    val peek = stack.peek()!!
    println("Top element (peek) = $peek")

    /* Pop the top element */
    val pop = stack.pop()!!
    println("Popped element (pop) = $pop, stack after the pop = ${stack.toArray().contentToString()}")

    /* Get the stack size */
    val size = stack.size()
    println("Stack size = $size")

    /* Check whether the stack is empty */
    val isEmpty = stack.isEmpty()
    println("Stack is empty = $isEmpty")
}