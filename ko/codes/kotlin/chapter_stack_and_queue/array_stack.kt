/**
 * File: array_stack.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

/* 배열로 구현한 스택 */
class ArrayStack {
    // 리스트(동적 배열) 초기화
    private val stack = mutableListOf<Int>()

    /* 스택의 길이 조회 */
    fun size(): Int {
        return stack.size
    }

    /* 스택이 비어 있는지 확인 */
    fun isEmpty(): Boolean {
        return size() == 0
    }

    /* 스택에 삽입 */
    fun push(num: Int) {
        stack.add(num)
    }

    /* 스택에서 꺼내기 */
    fun pop(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return stack.removeAt(size() - 1)
    }

    /* 스택 맨 위의 원소 조회 */
    fun peek(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return stack[size() - 1]
    }

    /* 리스트를 배열로 변환해 반환한다 */
    fun toArray(): Array<Any> {
        return stack.toTypedArray()
    }
}

/* 실행 예제 */
fun main() {
    /* 스택 초기화 */
    val stack = ArrayStack()

    /* 스택에 원소 삽입 */
    stack.push(1)
    stack.push(3)
    stack.push(2)
    stack.push(5)
    stack.push(4)
    println("스택 stack = ${stack.toArray().contentToString()}")

    /* 스택 맨 위의 원소 조회 */
    val peek = stack.peek()
    println("맨 위 원소 peek = $peek")

    /* 스택에서 원소 꺼내기 */
    val pop = stack.pop()
    println("꺼낸 원소 pop = $pop, 꺼낸 후 stack = ${stack.toArray().contentToString()}")

    /* 스택의 길이 조회 */
    val size = stack.size()
    println("스택의 길이 size = $size")

    /* 비어 있는지 확인 */
    val isEmpty = stack.isEmpty()
    println("스택이 비어 있는가 = $isEmpty")
}