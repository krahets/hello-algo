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
    println("Stack stack = $stack")

    /* Access the top element */
    val peek = stack.peek()
    println("Top element: peek = $peek")

    /* Pop an element from the stack */
    val pop = stack.pop()
    println("Popped element: pop = $pop; stack after removal = $stack")

    /* Get the stack size */
    val size = stack.size
    println("Stack size = $size")

    /* Check whether it is empty */
    val isEmpty = stack.isEmpty()
    println("Is the stack empty? $isEmpty")
}