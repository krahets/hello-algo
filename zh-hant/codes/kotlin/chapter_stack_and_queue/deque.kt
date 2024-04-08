/**
 * File: deque.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

import java.util.*

/* Driver Code */
fun main() {
    /* 初始化雙向佇列 */
    val deque = LinkedList<Int>()
    deque.offerLast(3)
    deque.offerLast(2)
    deque.offerLast(5)
    println("雙向佇列 deque = $deque")

    /* 訪問元素 */
    val peekFirst = deque.peekFirst()
    println("佇列首元素 peekFirst = $peekFirst")
    val peekLast = deque.peekLast()
    println("佇列尾元素 peekLast = $peekLast")

    /* 元素入列 */
    deque.offerLast(4)
    println("元素 4 佇列尾入列後 deque = $deque")
    deque.offerFirst(1)
    println("元素 1 佇列首入列後 deque = $deque")

    /* 元素出列 */
    val popLast = deque.pollLast()
    println("佇列尾出列元素 = $popLast，佇列尾出列後 deque = $deque")
    val popFirst = deque.pollFirst()
    println("佇列首出列元素 = $popFirst，佇列首出列後 deque = $deque")

    /* 獲取雙向佇列的長度 */
    val size = deque.size
    println("雙向佇列長度 size = $size")

    /* 判斷雙向佇列是否為空 */
    val isEmpty = deque.isEmpty()
    println("雙向佇列是否為空 = $isEmpty")
}