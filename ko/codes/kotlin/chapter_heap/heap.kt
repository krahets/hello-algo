/**
 * File: heap.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_heap

import utils.printHeap
import java.util.*

/* 실행 코드 */
fun main() {
    // [region]{init}
    /* 힙 초기화 */
    // 최소 힙 초기화
    var minHeap = PriorityQueue<Int>()
    // 최대 힙 초기화(lambda 식으로 Comparator를 수정하면 된다)
    val maxHeap = PriorityQueue { a: Int, b: Int -> b - a }
    // [endregion]{init}

    println("\n다음 테스트 예제는 최대 힙이다")

    // [region]{push}
    /* 힙에 원소 삽입 */
    maxHeap.offer(1)
    maxHeap.offer(3)
    maxHeap.offer(2)
    maxHeap.offer(5)
    maxHeap.offer(4)
    // [endregion]{push}
    printHeap(maxHeap)

    // [region]{peek}
    /* 힙의 루트 원소 반환 */
    var peek = maxHeap.peek() // 5
    // [endregion]{peek}
    print("\n힙의 루트 원소 = $peek\n")

    // [region]{pop_1}
    /* 힙의 루트 원소 꺼내기 */
    // 힙에서 꺼낸 원소는 내림차순 수열을 이룬다
    peek = maxHeap.poll() // 5
    // [endregion]{pop_1}
    println("힙에서 꺼낸 원소: $peek")
    // [region]{pop_2}
    peek = maxHeap.poll() // 4
    // [endregion]{pop_2}
    println("힙에서 꺼낸 원소: $peek")
    // [region]{pop_3}
    peek = maxHeap.poll() // 3
    // [endregion]{pop_3}
    println("힙에서 꺼낸 원소: $peek")
    // [region]{pop_4}
    peek = maxHeap.poll() // 2
    // [endregion]{pop_4}
    println("힙에서 꺼낸 원소: $peek")
    // [region]{pop_5}
    peek = maxHeap.poll() // 1
    // [endregion]{pop_5}
    println("힙에서 꺼낸 원소: $peek")

    // [region]{size}
    /* 힙 크기 반환 */
    val size = maxHeap.size
    // [endregion]{size}
    print("\n힙의 원소 개수 = $size\n")

    // [region]{is_empty}
    /* 힙이 비어 있는지 판단 */
    val isEmpty = maxHeap.isEmpty()
    // [endregion]{is_empty}
    print("\n힙이 비어 있는가: $isEmpty\n")

    // [region]{heapify}
    /* 리스트를 입력하여 힙 구성 */
    // 시간 복잡도는 O(n)이며 O(nlogn)이 아니다
    minHeap = PriorityQueue(mutableListOf<Int?>(1, 3, 2, 5, 4))
    // [endregion]{heapify}
    println("\n리스트를 입력하여 최소 힙을 구성한 후")
    printHeap(minHeap)
}