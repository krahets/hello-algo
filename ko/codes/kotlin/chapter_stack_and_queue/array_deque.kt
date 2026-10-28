/**
 * File: array_deque.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

/* 원형 배열로 구현한 덱 */
/* 생성자 */
class ArrayDeque(capacity: Int) {
    private var nums: IntArray = IntArray(capacity) // 덱의 원소를 저장하는 배열
    private var front: Int = 0 // 맨 앞 원소를 가리키는 맨 앞 포인터
    private var queSize: Int = 0 // 덱 길이

    /* 덱의 용량 반환 */
    fun capacity(): Int {
        return nums.size
    }

    /* 덱의 길이 반환 */
    fun size(): Int {
        return queSize
    }

    /* 덱이 비어 있는지 판단 */
    fun isEmpty(): Boolean {
        return queSize == 0
    }

    /* 원형 배열 인덱스 계산 */
    private fun index(i: Int): Int {
        // 나머지 연산을 통해 배열의 처음과 끝을 연결한다
        // i가 배열의 끝을 넘어가면 처음으로 돌아온다
        // i가 배열의 처음을 넘어가면 끝으로 돌아온다
        return (i + capacity()) % capacity()
    }

    /* 맨 앞에 삽입 */
    fun pushFirst(num: Int) {
        if (queSize == capacity()) {
            println("덱이 가득 찼다")
            return
        }
        // 맨 앞 포인터를 왼쪽으로 한 칸 이동한다
        // 나머지 연산을 통해 front가 배열의 처음을 넘어가면 끝으로 돌아오게 한다
        front = index(front - 1)
        // num을 맨 앞에 추가한다
        nums[front] = num
        queSize++
    }

    /* 맨 뒤에 삽입 */
    fun pushLast(num: Int) {
        if (queSize == capacity()) {
            println("덱이 가득 찼다")
            return
        }
        // 맨 뒤 인덱스 + 1을 가리키는 맨 뒤 포인터를 계산한다
        val rear = index(front + queSize)
        // num을 맨 뒤에 추가한다
        nums[rear] = num
        queSize++
    }

    /* 맨 앞에서 꺼내기 */
    fun popFirst(): Int {
        val num = peekFirst()
        // 맨 앞 포인터를 뒤로 한 칸 이동한다
        front = index(front + 1)
        queSize--
        return num
    }

    /* 맨 뒤에서 꺼내기 */
    fun popLast(): Int {
        val num = peekLast()
        queSize--
        return num
    }

    /* 맨 앞 원소 접근 */
    fun peekFirst(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return nums[front]
    }

    /* 맨 뒤 원소 접근 */
    fun peekLast(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        // 마지막 원소의 인덱스를 계산한다
        val last = index(front + queSize - 1)
        return nums[last]
    }

    /* 출력에 사용할 배열 반환 */
    fun toArray(): IntArray {
        // 유효한 길이 범위 안의 리스트 원소만 변환한다
        val res = IntArray(queSize)
        var i = 0
        var j = front
        while (i < queSize) {
            res[i] = nums[index(j)]
            i++
            j++
        }
        return res
    }
}

/* 실행 코드 */
fun main() {
    /* 덱 초기화 */
    val deque = ArrayDeque(10)
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