/**
 * File: my_heap.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_heap

import utils.printHeap
import java.util.*

/* 최대 힙 */
class MaxHeap(nums: MutableList<Int>?) {
    // 용량 확장을 따로 고려할 필요가 없도록 배열 대신 리스트 사용
    private val maxHeap = mutableListOf<Int>()

    /* 입력 리스트로 힙을 만드는 생성자 */
    init {
        // 리스트의 원소를 그대로 힙에 추가
        maxHeap.addAll(nums!!)
        // 리프를 제외한 모든 노드에서 힙 복구
        for (i in parent(size() - 1) downTo 0) {
            siftDown(i)
        }
    }

    /* 왼쪽 자식 노드의 인덱스 구하기 */
    private fun left(i: Int): Int {
        return 2 * i + 1
    }

    /* 오른쪽 자식 노드의 인덱스 구하기 */
    private fun right(i: Int): Int {
        return 2 * i + 2
    }

    /* 부모 노드의 인덱스 구하기 */
    private fun parent(i: Int): Int {
        return (i - 1) / 2 // 나눗셈 결과를 내림
    }

    /* 원소 교환 */
    private fun swap(i: Int, j: Int) {
        val temp = maxHeap[i]
        maxHeap[i] = maxHeap[j]
        maxHeap[j] = temp
    }

    /* 힙 크기 구하기 */
    fun size(): Int {
        return maxHeap.size
    }

    /* 힙이 비었는지 확인 */
    fun isEmpty(): Boolean {
        /* 힙이 비었는지 확인 */
        return size() == 0
    }

    /* 힙의 루트 원소 조회 */
    fun peek(): Int {
        return maxHeap[0]
    }

    /* 힙에 원소 삽입 */
    fun push(_val: Int) {
        // 노드 추가
        maxHeap.add(_val)
        // 아래에서 위로 힙 복구
        siftUp(size() - 1)
    }

    /* 노드 i부터 아래에서 위로 힙 복구 */
    private fun siftUp(it: Int) {
        // Kotlin의 함수 매개변수에는 다시 대입할 수 없으므로 임시 변수 생성
        var i = it
        while (true) {
            // 노드 i의 부모 노드 구하기
            val p = parent(i)
            // 루트를 지나거나 노드를 조정할 필요가 없으면 힙 복구 종료
            if (p < 0 || maxHeap[i] <= maxHeap[p]) break
            // 두 노드 교환
            swap(i, p)
            // 위로 올라가며 힙 복구 반복
            i = p
        }
    }

    /* 힙에서 원소 꺼내기 */
    fun pop(): Int {
        // 빈 힙 처리
        if (isEmpty()) throw IndexOutOfBoundsException()
        // 루트와 맨 오른쪽 리프 교환(첫 원소와 마지막 원소 교환)
        swap(0, size() - 1)
        // 노드 삭제
        val _val = maxHeap.removeAt(size() - 1)
        // 위에서 아래로 힙 복구
        siftDown(0)
        // 힙의 루트 원소 반환
        return _val
    }

    /* 노드 i부터 위에서 아래로 힙 복구 */
    private fun siftDown(it: Int) {
        // Kotlin의 함수 매개변수에는 다시 대입할 수 없으므로 임시 변수 생성
        var i = it
        while (true) {
            // 노드 i, l, r 중 값이 가장 큰 노드의 인덱스를 ma에 저장
            val l = left(i)
            val r = right(i)
            var ma = i
            if (l < size() && maxHeap[l] > maxHeap[ma]) ma = l
            if (r < size() && maxHeap[r] > maxHeap[ma]) ma = r
            // 노드 i가 가장 크거나 인덱스 l, r이 범위를 벗어나면 더 복구할 필요가 없으므로 반복 종료
            if (ma == i) break
            // 두 노드 교환
            swap(i, ma)
            // 아래로 내려가며 힙 복구 반복
            i = ma
        }
    }

    /* 힙 출력(이진 트리) */
    fun print() {
        val queue = PriorityQueue { a: Int, b: Int -> b - a }
        queue.addAll(maxHeap)
        printHeap(queue)
    }
}

/* 실행 예제 */
fun main() {
    /* 최대 힙 초기화 */
    val maxHeap = MaxHeap(mutableListOf(9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2))
    println("\n입력 리스트로 만든 힙:")
    maxHeap.print()

    /* 힙의 루트 원소 구하기 */
    var peek = maxHeap.peek()
    print("\n힙의 루트 원소: $peek\n")

    /* 힙에 원소 삽입 */
    val _val = 7
    maxHeap.push(_val)
    print("\n원소 $_val 삽입 후\n")
    maxHeap.print()

    /* 힙의 루트 원소 꺼내기 */
    peek = maxHeap.pop()
    print("\n루트 원소를 꺼낸 뒤의 힙(꺼낸 값: $peek)\n")
    maxHeap.print()

    /* 힙 크기 구하기 */
    val size = maxHeap.size()
    print("\n힙의 원소 수: $size\n")

    /* 힙이 비었는지 확인 */
    val isEmpty = maxHeap.isEmpty()
    print("\n빈 힙 여부: $isEmpty\n")
}