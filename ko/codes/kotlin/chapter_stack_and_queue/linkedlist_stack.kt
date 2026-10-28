/**
 * File: linkedlist_stack.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

/* 연결 리스트로 구현한 스택 */
class LinkedListStack(
    private var stackPeek: ListNode? = null, // 머리 노드를 스택의 맨 위로 사용한다
    private var stkSize: Int = 0 // 스택의 길이
) {

    /* 스택의 길이 반환 */
    fun size(): Int {
        return stkSize
    }

    /* 스택이 비어 있는지 판단 */
    fun isEmpty(): Boolean {
        return size() == 0
    }

    /* 스택에 삽입 */
    fun push(num: Int) {
        val node = ListNode(num)
        node.next = stackPeek
        stackPeek = node
        stkSize++
    }

    /* 스택에서 꺼내기 */
    fun pop(): Int? {
        val num = peek()
        stackPeek = stackPeek?.next
        stkSize--
        return num
    }

    /* 스택 맨 위 원소 접근 */
    fun peek(): Int? {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return stackPeek?._val
    }

    /* List를 Array로 변환하여 반환 */
    fun toArray(): IntArray {
        var node = stackPeek
        val res = IntArray(size())
        for (i in res.size - 1 downTo 0) {
            res[i] = node?._val!!
            node = node.next
        }
        return res
    }
}

/* 실행 코드 */
fun main() {
    /* 스택 초기화 */
    val stack = LinkedListStack()

    /* 스택에 원소 삽입 */
    stack.push(1)
    stack.push(3)
    stack.push(2)
    stack.push(5)
    stack.push(4)
    println("스택 stack = ${stack.toArray().contentToString()}")

    /* 스택 맨 위 원소 접근 */
    val peek = stack.peek()!!
    println("스택의 맨 위 원소 peek = $peek")

    /* 스택에서 원소 꺼내기 */
    val pop = stack.pop()!!
    println("스택에서 꺼낸 원소 pop = $pop, 꺼낸 후 stack = ${stack.toArray().contentToString()}")

    /* 스택의 길이 반환 */
    val size = stack.size()
    println("스택의 길이 size = $size")

    /* 비어 있는지 판단 */
    val isEmpty = stack.isEmpty()
    println("스택이 비어 있는가 = $isEmpty")
}