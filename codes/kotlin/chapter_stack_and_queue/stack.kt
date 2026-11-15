/**
 * File: stack.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

import java.util.*

/* Driver Code */
fun main() {
    /* 初始化栈 */
    val stack = Stack<Int>()

    /* 元素入栈 */
    stack.push(1)
    stack.push(3)
    stack.push(2)
    stack.push(5)
    stack.push(4)
    println("栈 stack = $stack")

    /* 访问栈顶元素 */
    val peek = stack.peek()
    println("栈顶元素 peek = $peek")

    /* 元素出栈 */
    val pop = stack.pop()
    println("出栈元素 pop = $pop，出栈后 stack = $stack")

    /* 获取栈的长度 */
    val size = stack.size
    println("栈的长度 size = $size")

    /* 判断是否为空 */
    val isEmpty = stack.isEmpty()
    println("栈是否为空 = $isEmpty")
}