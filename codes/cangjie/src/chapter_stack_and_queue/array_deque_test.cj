/**
 * File: array_deque_test.cj
 * Created Time: 2025-06-23
 * Author: jan_huber (jan_huber@163.com)
 */
package cangjie.chapter_stack_and_queue

import std.unittest.testmacro.*
import std.unittest.*

/* Driver Code */
@Test
func testArrayDeque() {
    /* 初始化双向队列 */
    let deque = ArrayDeque(10)
    deque.pushLast(3)
    deque.pushLast(2)
    deque.pushLast(5)
    println("双向队列 deque = ${deque.toArray()}")

    /* 访问元素 */
    let peekFirst = deque.peekFirst()
    println("队首元素 peekFirst = ${peekFirst}")
    let peekLast = deque.peekLast()
    println("队尾元素 peekLast = ${peekLast}")

    /* 元素入队 */
    deque.pushLast(4)
    println("元素 4 队尾入队后 deque = ${deque.toArray()}")
    deque.pushFirst(1)
    println("元素 1 队首入队后 deque = ${deque.toArray()}")

    /* 元素出队 */
    let popLast = deque.popLast()
    println("队尾出队元素 = ${popLast}，队尾出队后 deque = ${deque.toArray()}")
    let popFirst = deque.popFirst()
    println("队首出队元素 = ${popFirst}，队首出队后 deque = ${deque.toArray()}")

    /* 获取双向队列的长度 */
    let size = deque.size
    println("双向队列长度 size = ${size}")

    /* 判断双向队列是否为空 */
    let isEmpty = deque.isEmpty()
    println("双向队列是否为空 = ${isEmpty}")
}
