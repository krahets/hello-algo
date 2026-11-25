/**
 * File: array_queue.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

/* 원형 배열로 구현한 큐 */
class ArrayQueue(capacity: Int) {
    private val nums: IntArray = IntArray(capacity) // 큐의 원소를 저장하는 배열
    private var front: Int = 0 // 맨 앞 원소를 가리키는 앞쪽 포인터
    private var queSize: Int = 0 // 큐의 길이

    /* 큐의 용량 조회 */
    fun capacity(): Int {
        return nums.size
    }

    /* 큐의 길이 조회 */
    fun size(): Int {
        return queSize
    }

    /* 큐가 비어 있는지 확인 */
    fun isEmpty(): Boolean {
        return queSize == 0
    }

    /* 큐에 삽입 */
    fun push(num: Int) {
        if (queSize == capacity()) {
            println("큐가 가득 찼다")
            return
        }
        // 맨 뒤 원소의 다음 칸(맨 뒤 인덱스 + 1)을 가리키는 뒤쪽 포인터를 구한다
        // 나머지 연산을 이용해 rear가 배열의 끝을 넘으면 처음으로 돌아가게 한다
        val rear = (front + queSize) % capacity()
        // 맨 뒤에 num을 추가한다
        nums[rear] = num
        queSize++
    }

    /* 큐에서 꺼내기 */
    fun pop(): Int {
        val num = peek()
        // 앞쪽 포인터를 한 칸 전진시킨다. 배열의 끝을 넘으면 처음으로 돌아간다
        front = (front + 1) % capacity()
        queSize--
        return num
    }

    /* 맨 앞 원소 조회 */
    fun peek(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return nums[front]
    }

    /* 배열 반환 */
    fun toArray(): IntArray {
        // 실제 원소가 차지하는 범위의 리스트 원소만 변환한다
        val res = IntArray(queSize)
        var i = 0
        var j = front
        while (i < queSize) {
            res[i] = nums[j % capacity()]
            i++
            j++
        }
        return res
    }
}

/* 실행 예제 */
fun main() {
    /* 큐 초기화 */
    val capacity = 10
    val queue = ArrayQueue(capacity)

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
    println("꺼낸 원소 pop = ${pop}, 꺼낸 후 queue =  ${queue.toArray().contentToString()}")

    /* 큐의 길이 조회 */
    val size = queue.size()
    println("큐의 길이 size = $size")

    /* 큐가 비어 있는지 확인 */
    val isEmpty = queue.isEmpty()
    println("큐가 비어 있는가 = $isEmpty")

    /* 원형 배열 테스트 */
    for (i in 0..9) {
        queue.push(i)
        queue.pop()
        println("반복 $i — 삽입 + 삭제 후 queue = ${queue.toArray().contentToString()}")
    }
}