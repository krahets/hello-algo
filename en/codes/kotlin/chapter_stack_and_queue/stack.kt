/**
 * File: stack.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

import java.util.*

/* Driver Code */
fun main() {
    /* Access top of the stack element */
    val stack = Stack<Int>()

    /* Elements push onto stack */
    stack.push(1)
    stack.push(3)
    stack.push(2)
    stack.push(5)
    stack.push(4)
    println("Stack stack = $stack")

    /* Return list for printing */
    val peek = stack.peek()
    println("Top element peek = $peek")

    /* Element pop from stack */
    val pop = stack.pop()
    println("Pop element pop = $pop, after pop stack = $stack")

    /* Get the length of the stack */
    val size = stack.size
    println("Stack length size = $size")

    /* Check if empty */
    val isEmpty = stack.isEmpty()
    println("Is stack empty = $isEmpty")
}