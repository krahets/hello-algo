/**
 * File: linkedlist_queue.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

/* 연결 리스트로 구현한 큐 */
class LinkedListQueue(
    // 첫 노드 front와 마지막 노드 rear
    private var front: ListNode? = null,
    private var rear: ListNode? = null,
    private var queSize: Int = 0
) {

    /* 큐의 길이 조회 */
    fun size(): Int {
        return queSize
    }

    /* 큐가 비어 있는지 확인 */
    fun isEmpty(): Boolean {
        return size() == 0
    }

    /* 큐에 삽입 */
    fun push(num: Int) {
        // 마지막 노드 뒤에 num을 추가한다
        val node = ListNode(num)
        // 큐가 비어 있으면 앞쪽과 뒤쪽 포인터가 모두 이 노드를 가리키게 한다
        if (front == null) {
            front = node
            rear = node
            // 큐가 비어 있지 않으면 마지막 노드 뒤에 이 노드를 추가한다
        } else {
            rear?.next = node
            rear = node
        }
        queSize++
    }

    /* 큐에서 꺼내기 */
    fun pop(): Int {
        val num = peek()
        // 첫 노드 삭제
        front = front?.next
        queSize--
        return num
    }

    /* 맨 앞 원소 조회 */
    fun peek(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return front!!._val
    }

    /* 연결 리스트를 배열로 변환해 반환한다 */
    fun toArray(): IntArray {
        var node = front
        val res = IntArray(size())
        for (i in res.indices) {
            res[i] = node!!._val
            node = node.next
        }
        return res
    }
}

/* 실행 예제 */
fun main() {
    /* 큐 초기화 */
    val queue = LinkedListQueue()

    /* 큐에 원소 삽입 */
    queue.push(1)
    queue.push(3)
    queue.push(2)
    queue.push(5)
    queue.push(4)
    println("큐 queue = ${queue.toArray().contentToString()}")

    /* 맨 앞 원소 조회 */
    val peek = queue.peek()
    println("맨 앞 원소 peek = $peek")

    /* 큐에서 원소 꺼내기 */
    val pop = queue.pop()
    println("꺼낸 원소 pop = $pop, 꺼낸 후 queue = ${queue.toArray().contentToString()}")

    /* 큐의 길이 조회 */
    val size = queue.size()
    println("큐의 길이 size = $size")

    /* 큐가 비어 있는지 확인 */
    val isEmpty = queue.isEmpty()
    println("큐가 비어 있는가 = $isEmpty")
}