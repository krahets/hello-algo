/**
 * File: array_stack_test.cj
 * Created Time: 2025-06-23
 * Author: jan_huber (jan_huber@163.com)
 */
package cangjie.chapter_stack_and_queue

import std.unittest.testmacro.*
import std.unittest.*

/* Driver Code */
@Test
func testArrayStack() {
    /* 初始化栈 */
    let stack: ArrayStack = ArrayStack()

    /* 元素入栈 */
    stack.push(1)
    stack.push(3)
    stack.push(2)
    stack.push(5)
    stack.push(4)
    println("栈 stack = ${stack.toArray()}")

    /* 访问栈顶元素 */
    let peek = stack.peek()
    println("栈顶元素 peek = ${peek}")

    /* 元素出栈 */
    let pop = stack.pop()
    println("出栈元素 pop = ${pop}，出栈后 stack = ${stack.toArray()}")

    /* 获取栈的长度 */
    let size = stack.size
    println("栈的长度 size = ${size}")

    /* 判断是否为空 */
    let isEmpty = stack.isEmpty()
    println("栈是否为空 = ${isEmpty}")
}
