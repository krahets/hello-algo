/**
 * File: heap.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_heap

import utils.printHeap
import java.util.*

fun testPush(heap: Queue<Int>, _val: Int) {
    heap.offer(_val) // 힙에 원소 삽입
    print("\n원소 $_val 삽입 후\n")
    printHeap(heap)
}

fun testPop(heap: Queue<Int>) {
    val _val = heap.poll() // 힙의 루트 원소 꺼내기
    print("\n루트 원소를 꺼낸 뒤의 힙(꺼낸 값: $_val)\n")
    printHeap(heap)
}

/* 실행 예제 */
fun main() {
    /* 힙 초기화 */
    // 최소 힙 초기화
    var minHeap = PriorityQueue<Int>()

    // 최대 힙 초기화(람다 식으로 Comparator를 변경하면 됨)
    val maxHeap = PriorityQueue { a: Int, b: Int -> b - a }

    println("\n다음은 최대 힙 테스트 예제다.")

    /* 힙에 원소 삽입 */
    testPush(maxHeap, 1)
    testPush(maxHeap, 3)
    testPush(maxHeap, 2)
    testPush(maxHeap, 5)
    testPush(maxHeap, 4)

    /* 힙의 루트 원소 구하기 */
    val peek = maxHeap.peek()
    print("\n힙의 루트 원소: $peek\n")

    /* 힙의 루트 원소 꺼내기 */
    testPop(maxHeap)
    testPop(maxHeap)
    testPop(maxHeap)
    testPop(maxHeap)
    testPop(maxHeap)

    /* 힙 크기 구하기 */
    val size = maxHeap.size
    print("\n힙의 원소 수: $size\n")

    /* 힙이 비었는지 확인 */
    val isEmpty = maxHeap.isEmpty()
    print("\n빈 힙 여부: $isEmpty\n")

    /* 입력 리스트로 힙 구성 */
    // 시간 복잡도는 O(nlogn)이 아니라 O(n)
    minHeap = PriorityQueue(mutableListOf<Int?>(1, 3, 2, 5, 4))
    println("\n입력 리스트로 만든 최소 힙:")
    printHeap(minHeap)
}