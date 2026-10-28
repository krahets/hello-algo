/**
 * File: deque.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

import java.util.*

/* 실행 코드 */
fun main() {
    /* 덱 초기화 */
    val deque = LinkedList<Int>()
    deque.offerLast(3)
    deque.offerLast(2)
    deque.offerLast(5)
    println("덱 deque = $deque")

    /* 원소 접근 */
    val peekFirst = deque.peekFirst()
    println("맨 앞 원소 peekFirst = $peekFirst")
    val peekLast = deque.peekLast()
    println("맨 뒤 원소 peekLast = $peekLast")

    /* 큐에 원소 삽입 */
    deque.offerLast(4)
    println("맨 뒤에 원소 4를 삽입한 후 deque = $deque")
    deque.offerFirst(1)
    println("맨 앞에 원소 1을 삽입한 후 deque = $deque")

    /* 큐에서 원소 꺼내기 */
    val popLast = deque.pollLast()
    println("맨 뒤에서 꺼낸 원소 = $popLast, 꺼낸 후 deque = $deque")
    val popFirst = deque.pollFirst()
    println("맨 앞에서 꺼낸 원소 = $popFirst, 꺼낸 후 deque = $deque")

    /* 덱의 길이 반환 */
    val size = deque.size
    println("덱의 길이 size = $size")

    /* 덱이 비어 있는지 판단 */
    val isEmpty = deque.isEmpty()
    println("덱이 비어 있는가 = $isEmpty")
}