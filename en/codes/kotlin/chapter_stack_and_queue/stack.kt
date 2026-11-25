/**
 * File: stack.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

import java.util.*

/* Driver code */
fun main() {
    /* Initialize the stack */
    val stack = Stack<Int>()

    /* Push elements onto the stack */
    stack.push(1)
    stack.push(3)
    stack.push(2)
    stack.push(5)
    stack.push(4)
    println("stack = $stack")

    /* Peek at the top element */
    val peek = stack.peek()
    println("Top element (peek) = $peek")

    /* Pop the top element */
    val pop = stack.pop()
    println("Popped element (pop) = $pop, stack after the pop = $stack")

    /* Get the stack size */
    val size = stack.size
    println("Stack size = $size")

    /* Check whether the stack is empty */
    val isEmpty = stack.isEmpty()
    println("Stack is empty = $isEmpty")
}