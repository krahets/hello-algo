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
        /* 初始化堆 */
        // Swift 的 Heap 类型同时支持大顶堆和小顶堆，需要引入 swift-collections 包
        var heap = Heap<Int>()
        // [endregion]{init}

        // [region]{push}
        /* 元素入堆 */
        heap.insert(1)
        heap.insert(3)
        heap.insert(2)
        heap.insert(5)
        heap.insert(4)
        // [endregion]{push}
        PrintUtil.printHeap(queue: heap.unordered)

        // [region]{peek}
        /* 获取堆顶元素 */
        var peek = heap.max()
        // [endregion]{peek}
        print("\n堆顶元素为 \(peek!)\n")

        // [region]{pop_1}
        /* 堆顶元素出堆 */
        peek = heap.removeMax() // 5
        // [endregion]{pop_1}
        print("出堆元素为 \(peek!)")
        // [region]{pop_2}
        peek = heap.removeMax() // 4
        // [endregion]{pop_2}
        print("出堆元素为 \(peek!)")
        // [region]{pop_3}
        peek = heap.removeMax() // 3
        // [endregion]{pop_3}
        print("出堆元素为 \(peek!)")
        // [region]{pop_4}
        peek = heap.removeMax() // 2
        // [endregion]{pop_4}
        print("出堆元素为 \(peek!)")
        // [region]{pop_5}
        peek = heap.removeMax() // 1
        // [endregion]{pop_5}
        print("出堆元素为 \(peek!)")

        // [region]{size}
        /* 获取堆大小 */
        let size = heap.count
        // [endregion]{size}
        print("\n堆元素数量为 \(size)\n")

        // [region]{is_empty}
        /* 判断堆是否为空 */
        let isEmpty = heap.isEmpty
        // [endregion]{is_empty}
        print("\n堆是否为空 \(isEmpty)\n")

        // [region]{heapify}
        /* 输入列表并建堆 */
        // 时间复杂度为 O(n) ，而非 O(nlogn)
        let heap2 = Heap([1, 3, 2, 5, 4])
        // [endregion]{heapify}
        print("\n输入列表并建立堆后")
        PrintUtil.printHeap(queue: heap2.unordered)
    }
}
