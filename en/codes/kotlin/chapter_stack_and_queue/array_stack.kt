/**
 * File: array_stack.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

/* Stack implemented with an array */
class ArrayStack {
    // Initialize the list (dynamic array)
    private val stack = mutableListOf<Int>()

    /* Get the stack size */
    fun size(): Int {
        return stack.size
    }

    /* Check whether the stack is empty */
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

    /* Access the top element */
    fun peek(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return stack[size() - 1]
    }

    /* Convert the list to an array and return it */
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
    println("Stack stack = ${stack.toArray().contentToString()}")

    /* Access the top element */
    val peek = stack.peek()
    println("Top element: peek = $peek")

    /* Pop an element from the stack */
    val pop = stack.pop()
    println("Popped element: pop = $pop; stack after removal = ${stack.toArray().contentToString()}")

    /* Get the stack size */
    val size = stack.size()
    println("Stack size = $size")

    /* Check whether it is empty */
    val isEmpty = stack.isEmpty()
    println("Is the stack empty? $isEmpty")
}