/**
 * File: linkedlist_stack.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

/* Stack class based on linked list */
class LinkedListStack(
    private var stackPeek: ListNode? = null, // Use the head node as the top of the stack
    private var stkSize: Int = 0 // Length of the stack
) {

    /* Get the length of the stack */
    fun size(): Int {
        return stkSize
    }

    /* Determine if the stack is empty */
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

    /* Access stack top element */
    fun peek(): Int? {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return stackPeek?._val
    }

    /* Convert the List to Array and return */
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
    /* Initialize stack */
    val stack = LinkedListStack()

    /* Element push */
    stack.push(1)
    stack.push(3)
    stack.push(2)
    stack.push(5)
    stack.push(4)
    println("Stack stack = ${stack.toArray().contentToString()}")

    /* Access stack top element */
    val peek = stack.peek()!!
    println("Top element of the stack peek = $peek")

    /* Element pop */
    val pop = stack.pop()!!
    println("Pop element pop = $pop, stack after pop = ${stack.toArray().contentToString()}")

    /* Get the length of the stack */
    val size = stack.size()
    println("Stack length size = $size")

    /* Determine if it's empty */
    val isEmpty = stack.isEmpty()
    println("Is the stack empty = $isEmpty")
}