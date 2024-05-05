/**
 * File: array_stack.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

/* Stack class based on array */
class ArrayStack {
    // Initialize the list (dynamic array)
    private val stack = mutableListOf<Int>()

    /* Get the length of the stack */
    fun size(): Int {
        return stack.size
    }

    /* Determine if the stack is empty */
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

    /* Access stack top element */
    fun peek(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return stack[size() - 1]
    }

    /* Convert the List to Array and return */
    fun toArray(): Array<Any> {
        return stack.toTypedArray()
    }
}

/* Driver Code */
fun main() {
    /* Initialize stack */
    val stack = ArrayStack()

    /* Element push */
    stack.push(1)
    stack.push(3)
    stack.push(2)
    stack.push(5)
    stack.push(4)
    println("Stack stack = ${stack.toArray().contentToString()}")

    /* Access stack top element */
    val peek = stack.peek()
    println("Top element of the stack peek = $peek")

    /* Element pop */
    val pop = stack.pop()
    println("Pop element pop = $pop, stack after pop = ${stack.toArray().contentToString()}")

    /* Get the length of the stack */
    val size = stack.size()
    println("Stack length size = $size")

    /* Determine if it's empty */
    val isEmpty = stack.isEmpty()
    println("Is the stack empty = $isEmpty")
}