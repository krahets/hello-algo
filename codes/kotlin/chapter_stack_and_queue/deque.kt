/**
 * File: deque.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

import java.util.*

/* Driver Code */
fun main() {
    /* 初始化双向队列 */
    val deque = LinkedList<Int>()
    deque.offerLast(3)
    deque.offerLast(2)
    deque.offerLast(5)
    println("双向队列 deque = $deque")

    /* 访问元素 */
    val peekFirst = deque.peekFirst()
    println("队首元素 peekFirst = $peekFirst")
    val peekLast = deque.peekLast()
    println("队尾元素 peekLast = $peekLast")

    /* 元素入队 */
    deque.offerLast(4)
    println("元素 4 队尾入队后 deque = $deque")
    deque.offerFirst(1)
    println("元素 1 队首入队后 deque = $deque")

    /* 元素出队 */
    val popLast = deque.pollLast()
    println("队尾出队元素 = $popLast，队尾出队后 deque = $deque")
    val popFirst = deque.pollFirst()
    println("队首出队元素 = $popFirst，队首出队后 deque = $deque")

    /* 获取双向队列的长度 */
    val size = deque.size
    println("双向队列长度 size = $size")

    /* 判断双向队列是否为空 */
    val isEmpty = deque.isEmpty()
    println("双向队列是否为空 = $isEmpty")
}