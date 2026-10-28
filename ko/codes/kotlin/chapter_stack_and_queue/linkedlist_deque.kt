/**
 * File: linkedlist_deque.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

/* 이중 연결 리스트 노드 */
class ListNode(var _val: Int) {
    // 노드 값
    var next: ListNode? = null // 다음 노드 참조
    var prev: ListNode? = null // 이전 노드 참조
}

/* 이중 연결 리스트로 구현한 덱 */
class LinkedListDeque {
    private var front: ListNode? = null // 머리 노드 front
    private var rear: ListNode? = null // 꼬리 노드 rear
    private var queSize: Int = 0 // 덱의 길이

    /* 덱의 길이 반환 */
    fun size(): Int {
        return queSize
    }

    /* 덱이 비어 있는지 판단 */
    fun isEmpty(): Boolean {
        return size() == 0
    }

    /* 큐 삽입 연산 */
    fun push(num: Int, isFront: Boolean) {
        val node = ListNode(num)
        // 연결 리스트가 비어 있으면 front와 rear가 모두 node를 가리키게 한다
        if (isEmpty()) {
            rear = node
            front = rear
            // 맨 앞에 삽입하는 연산
        } else if (isFront) {
            // node를 연결 리스트의 맨 앞에 추가한다
            front?.prev = node
            node.next = front
            front = node // 머리 노드를 갱신한다
            // 맨 뒤에 삽입하는 연산
        } else {
            // node를 연결 리스트의 맨 뒤에 추가한다
            rear?.next = node
            node.prev = rear
            rear = node // 꼬리 노드를 갱신한다
        }
        queSize++ // 큐 길이를 갱신한다
    }

    /* 맨 앞에 삽입 */
    fun pushFirst(num: Int) {
        push(num, true)
    }

    /* 맨 뒤에 삽입 */
    fun pushLast(num: Int) {
        push(num, false)
    }

    /* 큐에서 꺼내는 연산 */
    fun pop(isFront: Boolean): Int {
        if (isEmpty()) 
            throw IndexOutOfBoundsException()
        val _val: Int
        // 큐의 길이가 1이면 머리와 꼬리가 같은 노드를 가리킨다
        if (queSize == 1) {
            _val = front!!._val
            front = null
            rear = null
        }
        // 맨 앞에서 꺼내는 연산
        else if (isFront) {
            _val = front!!._val // 머리 노드의 값을 임시로 저장한다
            // 머리 노드를 삭제한다
            val fNext = front!!.next
            fNext!!.prev = null
            front!!.next = null
            front = fNext // 머리 노드를 갱신한다
            // 맨 뒤에서 꺼내는 연산
        } else {
            _val = rear!!._val // 꼬리 노드의 값을 임시로 저장한다
            // 꼬리 노드를 삭제한다
            val rPrev = rear!!.prev
            rPrev!!.next = null
            rear!!.prev = null
            rear = rPrev // 꼬리 노드를 갱신한다
        }
        queSize-- // 큐 길이를 갱신한다
        return _val
    }

    /* 맨 앞에서 꺼내기 */
    fun popFirst(): Int {
        return pop(true)
    }

    /* 맨 뒤에서 꺼내기 */
    fun popLast(): Int {
        return pop(false)
    }

    /* 맨 앞 원소 접근 */
    fun peekFirst(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return front!!._val
    }

    /* 맨 뒤 원소 접근 */
    fun peekLast(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return rear!!._val
    }

    /* 출력에 사용할 배열 반환 */
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

/* 실행 코드 */
fun main() {
    /* 덱 초기화 */
    val deque = LinkedListDeque()
    deque.pushLast(3)
    deque.pushLast(2)
    deque.pushLast(5)
    println("덱 deque = ${deque.toArray().contentToString()}")

    /* 원소 접근 */
    val peekFirst = deque.peekFirst()
    println("맨 앞 원소 peekFirst = $peekFirst")
    val peekLast = deque.peekLast()
    println("맨 뒤 원소 peekLast = $peekLast")

    /* 큐에 원소 삽입 */
    deque.pushLast(4)
    println("맨 뒤에 원소 4를 삽입한 후 deque = ${deque.toArray().contentToString()}")
    deque.pushFirst(1)
    println("맨 앞에 원소 1을 삽입한 후 deque = ${deque.toArray().contentToString()}")

    /* 큐에서 원소 꺼내기 */
    val popLast = deque.popLast()
    println("맨 뒤에서 꺼낸 원소 = ${popLast}, 꺼낸 후 deque = ${deque.toArray().contentToString()}")
    val popFirst = deque.popFirst()
    println("맨 앞에서 꺼낸 원소 = ${popFirst}, 꺼낸 후 deque = ${deque.toArray().contentToString()}")

    /* 덱의 길이 반환 */
    val size = deque.size()
    println("덱의 길이 size = $size")

    /* 덱이 비어 있는지 판단 */
    val isEmpty = deque.isEmpty()
    println("덱이 비어 있는가 = $isEmpty")
}