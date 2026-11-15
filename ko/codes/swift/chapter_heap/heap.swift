/**
 * File: heap.swift
 * Created Time: 2024-03-17
 * Author: nuomi1 (nuomi1@qq.com)
 */

// [region]{import}
import HeapModule
// [endregion]{import}
import utils

@main
enum _Heap {
    /* 실행 코드 */
    static func main() {
        // [region]{init}
        /* 힙 초기화 */
        // Swift의 Heap 타입은 최대 힙과 최소 힙을 모두 지원한다
        var heap = Heap<Int>()
        // [endregion]{init}

        // [region]{push}
        /* 힙에 원소 삽입 */
        heap.insert(1)
        heap.insert(3)
        heap.insert(2)
        heap.insert(5)
        heap.insert(4)
        // [endregion]{push}
        PrintUtil.printHeap(queue: heap.unordered)

        // [region]{peek}
        /* 힙의 루트 원소 반환 */
        var peek = heap.max()
        // [endregion]{peek}
        print("\n힙의 루트 원소 = \(peek!)\n")

        // [region]{pop_1}
        /* 힙의 루트 원소 꺼내기 */
        peek = heap.removeMax() // 5
        // [endregion]{pop_1}
        print(peek!)
        // [region]{pop_2}
        peek = heap.removeMax() // 4
        // [endregion]{pop_2}
        print(peek!)
        // [region]{pop_3}
        peek = heap.removeMax() // 3
        // [endregion]{pop_3}
        print(peek!)
        // [region]{pop_4}
        peek = heap.removeMax() // 2
        // [endregion]{pop_4}
        print(peek!)
        // [region]{pop_5}
        peek = heap.removeMax() // 1
        // [endregion]{pop_5}
        print(peek!)

        // [region]{size}
        /* 힙 크기 반환 */
        let size = heap.count
        // [endregion]{size}
        print("\n힙의 원소 개수 = \(size)\n")

        // [region]{is_empty}
        /* 힙이 비어 있는지 판단 */
        let isEmpty = heap.isEmpty
        // [endregion]{is_empty}
        print("\n힙이 비어 있는가: \(isEmpty)\n")

        // [region]{heapify}
        /* 리스트를 입력하여 힙 구성 */
        // 시간 복잡도는 O(n)이며 O(nlogn)이 아니다
        let heap2 = Heap([1, 3, 2, 5, 4])
        // [endregion]{heapify}
        print("\n리스트를 입력하여 힙을 구성한 후")
        PrintUtil.printHeap(queue: heap2.unordered)
    }
}
