/**
 * File: array_stack.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

/* Array-backed stack */
class ArrayStack {
    // Initialize the list (a dynamic array)
    private val stack = mutableListOf<Int>()

    /* Get the stack size */
    fun size(): Int {
        return stack.size
    }

    /* Check whether the stack is empty */
    fun isEmpty(): Boolean {
        return size() == 0
    }

    /* Push an element onto the stack */
    fun push(num: Int) {
        stack.add(num)
    }

    /* Remove and return the top element */
    fun pop(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return stack.removeAt(size() - 1)
    }

    /* Peek at the top element */
    fun peek(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return stack[size() - 1]
    }

    /* Return the list elements as an array */
    fun toArray(): Array<Any> {
        return stack.toTypedArray()
    }
}

/* Driver code */
fun main() {
    /* Initialize the stack */
    val stack = ArrayStack()

    /* Push elements onto the stack */
    stack.push(1)
    stack.push(3)
    stack.push(2)
    stack.push(5)
    stack.push(4)
    println("stack = ${stack.toArray().contentToString()}")

    /* Peek at the top element */
    val peek = stack.peek()
    println("Top element (peek) = $peek")

    /* Pop the top element */
    val pop = stack.pop()
    println("Popped element (pop) = $pop, stack after the pop = ${stack.toArray().contentToString()}")

    /* Get the stack size */
    val size = stack.size()
    println("Stack size = $size")

    /* Check whether the stack is empty */
    val isEmpty = stack.isEmpty()
    println("Stack is empty = $isEmpty")
}