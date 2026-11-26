/**
 * File: linkedlist_deque.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

/* 이중 연결 리스트의 노드 */
class ListNode(var _val: Int) {
    // 노드의 값
    var next: ListNode? = null // 다음 노드에 대한 참조
    var prev: ListNode? = null // 이전 노드에 대한 참조
}

/* 이중 연결 리스트로 구현한 덱 */
class LinkedListDeque {
    private var front: ListNode? = null // 첫 노드 front
    private var rear: ListNode? = null // 마지막 노드 rear
    private var queSize: Int = 0 // 덱의 길이

    /* 덱의 길이 조회 */
    fun size(): Int {
        return queSize
    }

    /* 덱이 비어 있는지 확인 */
    fun isEmpty(): Boolean {
        return size() == 0
    }

    /* 삽입 연산 */
    fun push(num: Int, isFront: Boolean) {
        val node = ListNode(num)
        // 연결 리스트가 비어 있으면 front와 rear가 모두 node를 가리키게 한다
        if (isEmpty()) {
            rear = node
            front = rear
            // 맨 앞에 삽입하는 연산
        } else if (isFront) {
            // 연결 리스트의 맨 앞에 node를 추가한다
            front?.prev = node
            node.next = front
            front = node // 첫 노드 갱신
            // 맨 뒤에 삽입하는 연산
        } else {
            // 연결 리스트의 맨 뒤에 node를 추가한다
            rear?.next = node
            node.prev = rear
            rear = node // 마지막 노드 갱신
        }
        queSize++ // 덱의 길이 갱신
    }

    /* 맨 앞에 삽입 */
    fun pushFirst(num: Int) {
        push(num, true)
    }

    /* 맨 뒤에 삽입 */
    fun pushLast(num: Int) {
        push(num, false)
    }

    /* 삭제 연산 */
    fun pop(isFront: Boolean): Int {
        if (isEmpty()) 
            throw IndexOutOfBoundsException()
        val _val: Int
        // 덱의 길이가 1이면 앞쪽과 뒤쪽 포인터가 같은 노드를 가리킨다
        if (queSize == 1) {
            _val = front!!._val
            front = null
            rear = null
        }
        // 맨 앞에서 꺼내는 연산
        else if (isFront) {
            _val = front!!._val // 첫 노드의 값을 임시로 저장한다
            // 첫 노드 삭제
            val fNext = front!!.next
            fNext!!.prev = null
            front!!.next = null
            front = fNext // 첫 노드 갱신
            // 맨 뒤에서 꺼내는 연산
        } else {
            _val = rear!!._val // 마지막 노드의 값을 임시로 저장한다
            // 마지막 노드 삭제
            val rPrev = rear!!.prev
            rPrev!!.next = null
            rear!!.prev = null
            rear = rPrev // 마지막 노드 갱신
        }
        queSize-- // 덱의 길이 갱신
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

    /* 맨 앞 원소 조회 */
    fun peekFirst(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return front!!._val
    }

    /* 맨 뒤 원소 조회 */
    fun peekLast(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return rear!!._val
    }

    /* 출력할 배열 반환 */
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
    /* 덱 초기화 */
    val deque = LinkedListDeque()
    deque.pushLast(3)
    deque.pushLast(2)
    deque.pushLast(5)
    println("덱 deque = ${deque.toArray().contentToString()}")

    /* 원소 조회 */
    val peekFirst = deque.peekFirst()
    println("맨 앞 원소 peekFirst = $peekFirst")
    val peekLast = deque.peekLast()
    println("맨 뒤 원소 peekLast = $peekLast")

    /* 덱에 원소 삽입 */
    deque.pushLast(4)
    println("맨 뒤에 원소 4를 삽입한 후 deque = ${deque.toArray().contentToString()}")
    deque.pushFirst(1)
    println("맨 앞에 원소 1을 삽입한 후 deque = ${deque.toArray().contentToString()}")

    /* 덱에서 원소 꺼내기 */
    val popLast = deque.popLast()
    println("맨 뒤에서 꺼낸 원소 = ${popLast}, 맨 뒤에서 꺼낸 후 deque = ${deque.toArray().contentToString()}")
    val popFirst = deque.popFirst()
    println("맨 앞에서 꺼낸 원소 = ${popFirst}, 맨 앞에서 꺼낸 후 deque = ${deque.toArray().contentToString()}")

    /* 덱의 길이 조회 */
    val size = deque.size()
    println("덱의 길이 size = $size")

    /* 덱이 비어 있는지 확인 */
    val isEmpty = deque.isEmpty()
    println("덱이 비어 있는가 = $isEmpty")
}