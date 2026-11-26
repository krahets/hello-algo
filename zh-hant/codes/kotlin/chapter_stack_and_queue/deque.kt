/**
 * File: deque.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

import java.util.*

/* 範例程式 */
fun main() {
    /* 初始化雙端佇列 */
    val deque = LinkedList<Int>()
    deque.offerLast(3)
    deque.offerLast(2)
    deque.offerLast(5)
    println("雙端佇列 deque = $deque")

    /* 讀取隊首與隊尾元素 */
    val peekFirst = deque.peekFirst()
    println("隊首元素 peekFirst = $peekFirst")
    val peekLast = deque.peekLast()
    println("隊尾元素 peekLast = $peekLast")

    /* 將元素加入雙端佇列 */
    deque.offerLast(4)
    println("將元素 4 加到隊尾後 deque = $deque")
    deque.offerFirst(1)
    println("將元素 1 加到隊首後 deque = $deque")

    /* 從雙端佇列取出元素 */
    val popLast = deque.pollLast()
    println("從隊尾取出的元素 = $popLast，取出後 deque = $deque")
    val popFirst = deque.pollFirst()
    println("從隊首取出的元素 = $popFirst，取出後 deque = $deque")

    /* 取得雙端佇列長度 */
    val size = deque.size
    println("雙端佇列長度 size = $size")

    /* 判斷雙端佇列是否為空 */
    val isEmpty = deque.isEmpty()
    println("雙端佇列是否為空 = $isEmpty")
}