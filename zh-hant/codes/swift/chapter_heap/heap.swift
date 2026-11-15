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
    /* Driver Code */
    static func main() {
        // [region]{init}
        /* 初始化堆積 */
        // Swift 的 Heap 型別同時支持最大堆積和最小堆積
        var heap = Heap<Int>()
        // [endregion]{init}

        // [region]{push}
        /* 元素入堆積 */
        heap.insert(1)
        heap.insert(3)
        heap.insert(2)
        heap.insert(5)
        heap.insert(4)
        // [endregion]{push}
        PrintUtil.printHeap(queue: heap.unordered)

        // [region]{peek}
        /* 獲取堆積頂元素 */
        var peek = heap.max()
        // [endregion]{peek}
        print("\n堆積頂元素為 \(peek!)\n")

        // [region]{pop_1}
        /* 堆積頂元素出堆積 */
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
        /* 獲取堆積大小 */
        let size = heap.count
        // [endregion]{size}
        print("\n堆積元素數量為 \(size)\n")

        // [region]{is_empty}
        /* 判斷堆積是否為空 */
        let isEmpty = heap.isEmpty
        // [endregion]{is_empty}
        print("\n堆積是否為空 \(isEmpty)\n")

        // [region]{heapify}
        /* 輸入串列並建堆積 */
        // 時間複雜度為 O(n) ，而非 O(nlogn)
        let heap2 = Heap([1, 3, 2, 5, 4])
        // [endregion]{heapify}
        print("\n輸入串列並建立堆積後")
        PrintUtil.printHeap(queue: heap2.unordered)
    }
}
