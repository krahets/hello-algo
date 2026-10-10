/**
 * File: linkedlist_stack.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

/* Stack based on linked list implementation */
class LinkedListStack(
    private var stackPeek: ListNode? = null, // Use head node as stack top
    private var stkSize: Int = 0 // Stack length
) {

    /* Get the length of the stack */
    fun size(): Int {
        return stkSize
    }

    /* Check if the stack is empty */
    fun isEmpty(): Boolean {
        return size() == 0
    }

    /* Push */
    fun push(num: Int) {
        val node = ListNode(num)
        node.next = stackPeek
        stackPeek = node
        stkSize++
    }

    /* Pop */
    fun pop(): Int? {
        val num = peek()
        stackPeek = stackPeek?.next
        stkSize--
        return num
    }

    /* Return list for printing */
    fun peek(): Int? {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return stackPeek?._val
    }

    /* Convert List to Array and return */
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
    /* Access top of the stack element */
    val stack = LinkedListStack()

    /* Elements push onto stack */
    stack.push(1)
    stack.push(3)
    stack.push(2)
    stack.push(5)
    stack.push(4)
    println("Stack stack = ${stack.toArray().contentToString()}")

    /* Return list for printing */
    val peek = stack.peek()!!
    println("Top element peek = $peek")

    /* Element pop from stack */
    val pop = stack.pop()!!
    println("Pop element pop = $pop, after pop stack = ${stack.toArray().contentToString()}")

    /* Get the length of the stack */
    val size = stack.size()
    println("Stack length size = $size")

    /* Check if empty */
    val isEmpty = stack.isEmpty()
    println("Is stack empty = $isEmpty")
}