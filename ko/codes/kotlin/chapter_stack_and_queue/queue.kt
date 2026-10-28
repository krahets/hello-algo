/**
 * File: queue.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

import java.util.*

/* 실행 코드 */
fun main() {
    /* 큐 초기화 */
    val queue = LinkedList<Int>()

    /* 큐에 원소 삽입 */
    queue.offer(1)
    queue.offer(3)
    queue.offer(2)
    queue.offer(5)
    queue.offer(4)
    println("큐 queue = $queue")

    /* 맨 앞 원소 접근 */
    val peek = queue.peek()
    println("맨 앞 원소 peek = $peek")

    /* 큐에서 원소 꺼내기 */
    val pop = queue.poll()
    println("큐에서 꺼낸 원소 pop = $pop, 꺼낸 후 queue = $queue")

    /* 큐의 길이 반환 */
    val size = queue.size
    println("큐의 길이 size = $size")

    /* 큐가 비어 있는지 판단 */
    val isEmpty = queue.isEmpty()
    println("큐가 비어 있는가 = $isEmpty")
}