/**
 * File: heap.swift
 * Created Time: 2024-03-17
 * Author: nuomi1 (nuomi1@qq.com)
 */

import HeapModule
import utils

func testPush(heap: inout Heap<Int>, val: Int) {
    heap.insert(val)
    print("\n元素 \(val) 入堆積後\n")
    PrintUtil.printHeap(queue: heap.unordered)
}

func testPop(heap: inout Heap<Int>) {
    let val = heap.removeMax()
    print("\n堆積頂元素 \(val) 出堆積後\n")
    PrintUtil.printHeap(queue: heap.unordered)
}

@main
enum _Heap {
    /* Driver Code */
    static func main() {
        /* 初始化堆積 */
        // Swift 的 Heap 型別同時支持最大堆積和最小堆積
        var heap = Heap<Int>()

        /* 元素入堆積 */
        testPush(heap: &heap, val: 1)
        testPush(heap: &heap, val: 3)
        testPush(heap: &heap, val: 2)
        testPush(heap: &heap, val: 5)
        testPush(heap: &heap, val: 4)

        /* 獲取堆積頂元素 */
        let peek = heap.max()
        print("\n堆積頂元素為 \(peek!)\n")

        /* 堆積頂元素出堆積 */
        testPop(heap: &heap)
        testPop(heap: &heap)
        testPop(heap: &heap)
        testPop(heap: &heap)
        testPop(heap: &heap)

        /* 獲取堆積大小 */
        let size = heap.count
        print("\n堆積元素數量為 \(size)\n")

        /* 判斷堆積是否為空 */
        let isEmpty = heap.isEmpty
        print("\n堆積是否為空 \(isEmpty)\n")

        /* 輸入串列並建堆積 */
        // 時間複雜度為 O(n) ，而非 O(nlogn)
        let heap2 = Heap([1, 3, 2, 5, 4])
        print("\n輸入串列並建立堆積後")
        PrintUtil.printHeap(queue: heap2.unordered)
    }
}
