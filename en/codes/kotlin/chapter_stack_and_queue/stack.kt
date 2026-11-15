/**
 * File: stack.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

import java.util.*

/* Driver code */
fun main() {
    // [region]{init_stack}
    /* Initialize the stack */
    val stack = Stack<Int>()
    // [endregion]{init_stack}

    // [region]{push}
    /* Push elements onto the stack */
    stack.push(1)
    stack.push(3)
    stack.push(2)
    stack.push(5)
    stack.push(4)
    // [endregion]{push}
    println("Stack stack = $stack")

    // [region]{peek}
    /* Access the top element */
    val peek = stack.peek()
    // [endregion]{peek}
    println("Top element: peek = $peek")

    // [region]{pop}
    /* Pop an element from the stack */
    val pop = stack.pop()
    // [endregion]{pop}
    println("Popped element: pop = $pop; stack after removal = $stack")

    // [region]{size}
    /* Get the stack size */
    val size = stack.size
    // [endregion]{size}
    println("Stack size = $size")

    // [region]{is_empty}
    /* Check whether it is empty */
    val isEmpty = stack.isEmpty()
    // [endregion]{is_empty}
    println("Is the stack empty? $isEmpty")
}