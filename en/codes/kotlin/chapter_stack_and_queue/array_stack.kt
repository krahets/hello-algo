/**
 * File: array_stack.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

/* Stack based on array implementation */
class ArrayStack {
    // Initialize list (dynamic array)
    private val stack = mutableListOf<Int>()

    /* Get the length of the stack */
    fun size(): Int {
        return stack.size
    }

    /* Check if the stack is empty */
    fun isEmpty(): Boolean {
        return size() == 0
    }

    /* Push */
    fun push(num: Int) {
        stack.add(num)
    }

    /* Pop */
    fun pop(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return stack.removeAt(size() - 1)
    }

    /* Return list for printing */
    fun peek(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return stack[size() - 1]
    }

    /* Convert List to Array and return */
    fun toArray(): Array<Any> {
        return stack.toTypedArray()
    }
}

/* Driver Code */
fun main() {
    /* Access top of the stack element */
    val stack = ArrayStack()

    /* Elements push onto stack */
    stack.push(1)
    stack.push(3)
    stack.push(2)
    stack.push(5)
    stack.push(4)
    println("Stack stack = ${stack.toArray().contentToString()}")

    /* Return list for printing */
    val peek = stack.peek()
    println("Top element peek = $peek")

    /* Element pop from stack */
    val pop = stack.pop()
    println("Pop element pop = $pop, after pop stack = ${stack.toArray().contentToString()}")

    /* Get the length of the stack */
    val size = stack.size()
    println("Stack length size = $size")

    /* Check if empty */
    val isEmpty = stack.isEmpty()
    println("Is stack empty = $isEmpty")
}