/**
 * File: stack.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

import java.util.*

/* Driver Code */
fun main() {
    /* Initialize stack */
    val stack = Stack<Int>()

    /* Element push */
    stack.push(1)
    stack.push(3)
    stack.push(2)
    stack.push(5)
    stack.push(4)
    println("Stack stack = $stack")

    /* Access stack top element */
    val peek = stack.peek()
    println("Top element of the stack peek = $peek")

    /* Element pop */
    val pop = stack.pop()
    println("Pop element pop = $pop, stack after pop = $stack")

    /* Get the length of the stack */
    val size = stack.size
    println("Stack length size = $size")

    /* Determine if it's empty */
    val isEmpty = stack.isEmpty()
    println("Is the stack empty = $isEmpty")
}