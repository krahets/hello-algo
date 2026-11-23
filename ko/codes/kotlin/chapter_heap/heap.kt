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
    print("\n힙에 원소($_val)를 삽입한 후\n")
    printHeap(heap)
}

fun testPop(heap: Queue<Int>) {
    val _val = heap.poll() // 힙의 루트 원소 꺼내기
    print("\n힙의 루트 원소($_val)를 꺼낸 후\n")
    printHeap(heap)
}

/* 실행 코드 */
fun main() {
    /* 힙 초기화 */
    // 최소 힙 초기화
    var minHeap = PriorityQueue<Int>()

    // 최대 힙 초기화(lambda 식으로 Comparator를 수정하면 된다)
    val maxHeap = PriorityQueue { a: Int, b: Int -> b - a }

    println("\n다음 테스트 예제는 최대 힙이다")

    /* 힙에 원소 삽입 */
    testPush(maxHeap, 1)
    testPush(maxHeap, 3)
    testPush(maxHeap, 2)
    testPush(maxHeap, 5)
    testPush(maxHeap, 4)

    /* 힙의 루트 원소 반환 */
    val peek = maxHeap.peek()
    print("\n힙의 루트 원소 = $peek\n")

    /* 힙의 루트 원소 꺼내기 */
    testPop(maxHeap)
    testPop(maxHeap)
    testPop(maxHeap)
    testPop(maxHeap)
    testPop(maxHeap)

    /* 힙 크기 반환 */
    val size = maxHeap.size
    print("\n힙의 원소 개수 = $size\n")

    /* 힙이 비어 있는지 판단 */
    val isEmpty = maxHeap.isEmpty()
    print("\n힙이 비어 있는가: $isEmpty\n")

    /* 리스트를 입력하여 힙 구성 */
    // 시간 복잡도는 O(n)이며 O(nlogn)이 아니다
    minHeap = PriorityQueue(mutableListOf<Int?>(1, 3, 2, 5, 4))
    println("\n리스트를 입력하여 최소 힙을 구성한 후")
    printHeap(minHeap)
}