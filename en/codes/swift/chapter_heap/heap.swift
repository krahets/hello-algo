/**
 * File: heap.swift
 * Created Time: 2024-03-17
 * Author: nuomi1 (nuomi1@qq.com)
 */

import HeapModule
import utils

func testPush(heap: inout Heap<Int>, val: Int) {
    heap.insert(val)
    print("\nAfter inserting element \(val) into the heap:\n")
    PrintUtil.printHeap(queue: heap.unordered)
}

func testPop(heap: inout Heap<Int>) {
    let val = heap.removeMax()
    print("\nAfter removing the maximum element \(val) from the heap:\n")
    PrintUtil.printHeap(queue: heap.unordered)
}

@main
enum _Heap {
    /* Driver code */
    static func main() {
        /* Initialize the heap */
        // The Heap type in Swift Collections supports both max heap and min heap operations
        var heap = Heap<Int>()

        /* Push an element onto the heap */
        testPush(heap: &heap, val: 1)
        testPush(heap: &heap, val: 3)
        testPush(heap: &heap, val: 2)
        testPush(heap: &heap, val: 5)
        testPush(heap: &heap, val: 4)

        /* Get the maximum element of the heap */
        let peek = heap.max()
        print("\nMaximum heap element: \(peek!)\n")

        /* Remove the maximum element from the heap */
        testPop(heap: &heap)
        testPop(heap: &heap)
        testPop(heap: &heap)
        testPop(heap: &heap)
        testPop(heap: &heap)

        /* Get the heap size */
        let size = heap.count
        print("\nNumber of heap elements: \(size)\n")

        /* Check whether the heap is empty */
        let isEmpty = heap.isEmpty
        print("\nIs the heap empty: \(isEmpty)\n")

        /* Build a heap from an input list */
        // The time complexity is O(n), not O(nlogn)
        let heap2 = Heap([1, 3, 2, 5, 4])
        print("\nAfter building a heap from the input list:")
        PrintUtil.printHeap(queue: heap2.unordered)
    }
}
