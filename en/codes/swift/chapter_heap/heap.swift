/**
 * File: heap.swift
 * Created Time: 2024-03-17
 * Author: nuomi1 (nuomi1@qq.com)
 */

import HeapModule
import utils

func testPush(heap: inout Heap<Int>, val: Int) {
    heap.insert(val)
    print("\nElement \(val) added to heap after\n")
    PrintUtil.printHeap(queue: heap.unordered)
}

func testPop(heap: inout Heap<Int>) {
    let val = heap.removeMax()
    print("\nTop element \(val) removed from heap after\n")
    PrintUtil.printHeap(queue: heap.unordered)
}

@main
enum _Heap {
    /* Driver Code */
    static func main() {
        /* Initialize the heap */
        // Swift's Heap type supports both max-heap and min-heap
        var heap = Heap<Int>()

        /* Push the element into heap */
        testPush(heap: &heap, val: 1)
        testPush(heap: &heap, val: 3)
        testPush(heap: &heap, val: 2)
        testPush(heap: &heap, val: 5)
        testPush(heap: &heap, val: 4)

        /* Access heap top element */
        let peek = heap.max()
        print("\nTop element of the heap = \(peek!)\n")

        /* Pop the element at the heap top */
        testPop(heap: &heap)
        testPop(heap: &heap)
        testPop(heap: &heap)
        testPop(heap: &heap)
        testPop(heap: &heap)

        /* Get heap size */
        let size = heap.count
        print("\nNumber of elements in the heap = \(size)\n")

        /* Determine if heap is empty */
        let isEmpty = heap.isEmpty
        print("\nIs the heap empty \(isEmpty)\n")

        /* Enter list and build heap */
        // Time complexity is O(n), not O(nlogn)
        let heap2 = Heap([1, 3, 2, 5, 4])
        print("\nInput list and build heap after")
        PrintUtil.printHeap(queue: heap2.unordered)
    }
}
