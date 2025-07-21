/**
 * File: linkedlist_queue_test.cj
 * Created Time: 2025-06-24
 * Author: jan_huber (jan_huber@163.com)
 */

package cangjie.chapter_stack_and_queue

import std.unittest.testmacro.*
import std.unittest.*

/* Driver Code */
@Test
func testLinkedListQueue() {
    /* 初始化队列 */
    let queue = LinkedListQueue()

    /* 元素入队 */
    queue.push(1)
    queue.push(3)
    queue.push(2)
    queue.push(5)
    queue.push(4)
    println("队列 queue = ${queue.toArray()}")

    /* 访问队首元素 */
    let peek = queue.peek()
    println("队首元素 peek = ${peek}");

    /* 元素出队 */
    let pop = queue.pop()
    println("出队元素 pop = ${pop}，出队后 queue = ${queue.toArray()}")

    /* 获取队列的长度 */
    let size = queue.size
    println("队列长度 size = ${size}")

    /* 判断队列是否为空 */
    let isEmpty = queue.isEmpty()
    println("队列是否为空 = ${isEmpty}")
}
