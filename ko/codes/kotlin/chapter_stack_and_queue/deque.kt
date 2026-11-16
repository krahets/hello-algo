/**
 * File: deque.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

import java.util.*

/* 실행 코드 */
fun main() {
    // [region]{init_deque}
    /* 덱 초기화 */
    val deque = LinkedList<Int>()
    // [endregion]{init_deque}

    // [region]{push}
    /* 원소 삽입 */
    deque.offerLast(2) // 맨 뒤에 추가한다
    deque.offerLast(5)
    deque.offerLast(4)
    deque.offerFirst(3) // 맨 앞에 추가한다
    deque.offerFirst(1)
    // [endregion]{push}
    println("덱 deque = $deque")

    // [region]{peek_first}
    /* 원소 접근 */
    val peekFirst = deque.peekFirst() // 맨 앞 원소
    // [endregion]{peek_first}
    println("맨 앞 원소 peekFirst = $peekFirst")
    // [region]{peek_last}
    val peekLast = deque.peekLast() // 맨 뒤 원소
    // [endregion]{peek_last}
    println("맨 뒤 원소 peekLast = $peekLast")

    // [region]{pop_first}
    /* 원소 꺼내기 */
    val popFirst = deque.pollFirst() // 맨 앞 원소를 꺼낸다
    // [endregion]{pop_first}
    println("맨 앞에서 꺼낸 원소 = $popFirst, 꺼낸 후 deque = $deque")
    // [region]{pop_last}
    val popLast = deque.pollLast() // 맨 뒤 원소를 꺼낸다
    // [endregion]{pop_last}
    println("맨 뒤에서 꺼낸 원소 = $popLast, 꺼낸 후 deque = $deque")

    // [region]{size}
    /* 덱의 길이 반환 */
    val size = deque.size
    // [endregion]{size}
    println("덱의 길이 size = $size")

    // [region]{is_empty}
    /* 덱이 비어 있는지 판단 */
    val isEmpty = deque.isEmpty()
    // [endregion]{is_empty}
    println("덱이 비어 있는가 = $isEmpty")
}