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
    // 배열 대신 리스트를 사용하므로 용량 확장을 고려할 필요가 없다
    private val maxHeap = mutableListOf<Int>()

    /* 생성자: 입력 리스트를 바탕으로 힙 구성 */
    init {
        // 리스트 원소를 그대로 힙에 추가한다
        maxHeap.addAll(nums!!)
        // 리프 노드를 제외한 모든 노드에 힙 재정렬을 수행한다
        for (i in parent(size() - 1) downTo 0) {
            siftDown(i)
        }
    }

    /* 왼쪽 자식 노드의 인덱스 반환 */
    private fun left(i: Int): Int {
        return 2 * i + 1
    }

    /* 오른쪽 자식 노드의 인덱스 반환 */
    private fun right(i: Int): Int {
        return 2 * i + 2
    }

    /* 부모 노드의 인덱스 반환 */
    private fun parent(i: Int): Int {
        return (i - 1) / 2 // 나눗셈의 결과를 내림한다
    }

    /* 원소 교환 */
    private fun swap(i: Int, j: Int) {
        val temp = maxHeap[i]
        maxHeap[i] = maxHeap[j]
        maxHeap[j] = temp
    }

    /* 힙 크기 반환 */
    fun size(): Int {
        return maxHeap.size
    }

    /* 힙이 비어 있는지 판단 */
    fun isEmpty(): Boolean {
        /* 힙이 비어 있는지 판단 */
        return size() == 0
    }

    /* 힙의 루트 원소 접근 */
    fun peek(): Int {
        return maxHeap[0]
    }

    /* 힙에 원소 삽입 */
    fun push(_val: Int) {
        // 노드 추가
        maxHeap.add(_val)
        // 아래에서 위로 힙을 재정렬한다
        siftUp(size() - 1)
    }

    /* 노드 i에서 시작하여 아래에서 위로 힙 재정렬 */
    private fun siftUp(it: Int) {
        // Kotlin의 함수 매개변수는 변경할 수 없으므로 임시 변수를 생성한다
        var i = it
        while (true) {
            // 노드 i의 부모 노드를 구한다
            val p = parent(i)
            // 루트 노드를 넘어가거나 노드를 수정할 필요가 없으면 힙 재정렬을 마친다
            if (p < 0 || maxHeap[i] <= maxHeap[p]) break
            // 두 노드를 교환한다
            swap(i, p)
            // 위쪽으로 힙 재정렬을 반복한다
            i = p
        }
    }

    /* 힙에서 원소 꺼내기 */
    fun pop(): Int {
        // 비어 있는 경우를 처리한다
        if (isEmpty()) throw IndexOutOfBoundsException()
        // 루트 노드와 가장 오른쪽 리프 노드를 교환한다(첫 원소와 마지막 원소 교환)
        swap(0, size() - 1)
        // 노드 삭제
        val _val = maxHeap.removeAt(size() - 1)
        // 위에서 아래로 힙을 재정렬한다
        siftDown(0)
        // 힙의 루트 원소를 반환한다
        return _val
    }

    /* 노드 i에서 시작하여 위에서 아래로 힙 재정렬 */
    private fun siftDown(it: Int) {
        // Kotlin의 함수 매개변수는 변경할 수 없으므로 임시 변수를 생성한다
        var i = it
        while (true) {
            // 노드 i, l, r 중 값이 가장 큰 노드를 찾아 ma로 표시한다
            val l = left(i)
            val r = right(i)
            var ma = i
            if (l < size() && maxHeap[l] > maxHeap[ma]) ma = l
            if (r < size() && maxHeap[r] > maxHeap[ma]) ma = r
            // 노드 i의 값이 가장 크거나 인덱스 l, r이 범위를 벗어나면 힙을 더 재정렬할 필요가 없으므로 종료한다
            if (ma == i) break
            // 두 노드를 교환한다
            swap(i, ma)
            // 아래쪽으로 힙 재정렬을 반복한다
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

/* 실행 코드 */
fun main() {
    /* 최대 힙 초기화 */
    val maxHeap = MaxHeap(mutableListOf(9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2))
    println("\n리스트를 입력하여 힙을 구성한 후")
    maxHeap.print()

    /* 힙의 루트 원소 반환 */
    var peek = maxHeap.peek()
    print("\n힙의 루트 원소 = $peek\n")

    /* 힙에 원소 삽입 */
    val _val = 7
    maxHeap.push(_val)
    print("\n힙에 원소($_val)를 삽입한 후\n")
    maxHeap.print()

    /* 힙의 루트 원소 꺼내기 */
    peek = maxHeap.pop()
    print("\n힙의 루트 원소($peek)를 꺼낸 후\n")
    maxHeap.print()

    /* 힙 크기 반환 */
    val size = maxHeap.size()
    print("\n힙의 원소 개수 = $size\n")

    /* 힙이 비어 있는지 판단 */
    val isEmpty = maxHeap.isEmpty()
    print("\n힙이 비어 있는가: $isEmpty\n")
}