/**
 * File: stack.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

import java.util.*

/* 실행 코드 */
fun main() {
    // [region]{init_stack}
    /* 스택 초기화 */
    val stack = Stack<Int>()
    // [endregion]{init_stack}

    // [region]{push}
    /* 스택에 원소 삽입 */
    stack.push(1)
    stack.push(3)
    stack.push(2)
    stack.push(5)
    stack.push(4)
    // [endregion]{push}
    println("스택 stack = $stack")

    // [region]{peek}
    /* 스택 맨 위 원소 접근 */
    val peek = stack.peek()
    // [endregion]{peek}
    println("스택의 맨 위 원소 peek = $peek")

    // [region]{pop}
    /* 스택에서 원소 꺼내기 */
    val pop = stack.pop()
    // [endregion]{pop}
    println("스택에서 꺼낸 원소 pop = $pop, 꺼낸 후 stack = $stack")

    // [region]{size}
    /* 스택의 길이 반환 */
    val size = stack.size
    // [endregion]{size}
    println("스택의 길이 size = $size")

    // [region]{is_empty}
    /* 비어 있는지 판단 */
    val isEmpty = stack.isEmpty()
    // [endregion]{is_empty}
    println("스택이 비어 있는가 = $isEmpty")
}