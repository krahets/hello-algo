/**
 * File: heap.swift
 * Created Time: 2024-03-17
 * Author: nuomi1 (nuomi1@qq.com)
 */

import HeapModule
import utils

func testPush(heap: inout Heap<Int>, val: Int) {
    heap.insert(val)
    print("\n元素 \(val) 入堆后\n")
    PrintUtil.printHeap(queue: heap.unordered)
}

func testPop(heap: inout Heap<Int>) {
    let val = heap.removeMax()
    print("\n堆顶元素 \(val) 出堆后\n")
    PrintUtil.printHeap(queue: heap.unordered)
}

@main
enum _Heap {
    /* Driver Code */
    static func main() {
        /* 初始化堆 */
        // Swift 的 Heap 类型同时支持最大堆和最小堆
        var heap = Heap<Int>()

        /* 元素入堆 */
        testPush(heap: &heap, val: 1)
        testPush(heap: &heap, val: 3)
        testPush(heap: &heap, val: 2)
        testPush(heap: &heap, val: 5)
        testPush(heap: &heap, val: 4)

        /* 获取堆顶元素 */
        let peek = heap.max()
        print("\n堆顶元素为 \(peek!)\n")

        /* 堆顶元素出堆 */
        testPop(heap: &heap)
        testPop(heap: &heap)
        testPop(heap: &heap)
        testPop(heap: &heap)
        testPop(heap: &heap)

        /* 获取堆大小 */
        let size = heap.count
        print("\n堆元素数量为 \(size)\n")

        /* 判断堆是否为空 */
        let isEmpty = heap.isEmpty
        print("\n堆是否为空 \(isEmpty)\n")

        /* 输入列表并建堆 */
        // 时间复杂度为 O(n) ，而非 O(nlogn)
        let heap2 = Heap([1, 3, 2, 5, 4])
        print("\n输入列表并建立堆后")
        PrintUtil.printHeap(queue: heap2.unordered)
    }
}
