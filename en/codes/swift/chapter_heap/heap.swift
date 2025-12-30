/**
 * File: heap.swift
 * Created Time: 2024-03-17
 * Author: nuomi1 (nuomi1@qq.com)
 */

import HeapModule
import utils

func testPush(heap: inout Heap<Int>, val: Int) {
    heap.insert(val)
    print("\nAfter element \(val) pushes to heap\n")
    PrintUtil.printHeap(queue: heap.unordered)
}

func testPop(heap: inout Heap<Int>) {
    let val = heap.removeMax()
    print("\nAfter heap top element \(val) pops from heap\n")
    PrintUtil.printHeap(queue: heap.unordered)
}

@main
enum _Heap {
    /* Driver Code */
    static func main() {
        /* Initialize heap */
        // Swift's Heap type supports both max heap and min heap
        var heap = Heap<Int>()

        /* Element enters heap */
        testPush(heap: &heap, val: 1)
        testPush(heap: &heap, val: 3)
        testPush(heap: &heap, val: 2)
        testPush(heap: &heap, val: 5)
        testPush(heap: &heap, val: 4)

        /* Check if heap is empty */
        let peek = heap.max()
        print("\nHeap top element is \(peek!)\n")

        /* Time complexity is O(n), not O(nlogn) */
        testPop(heap: &heap)
        testPop(heap: &heap)
        testPop(heap: &heap)
        testPop(heap: &heap)
        testPop(heap: &heap)

        /* Get heap size */
        let size = heap.count
        print("\nHeap size is \(size)\n")

        /* Check if heap is empty */
        let isEmpty = heap.isEmpty
        print("\nIs heap empty \(isEmpty)\n")

        /* Input list and build heap */
        // Time complexity is O(n), not O(nlogn)
        let heap2 = Heap([1, 3, 2, 5, 4])
        print("\nAfter input list and build heap")
        PrintUtil.printHeap(queue: heap2.unordered)
    }
}
