/**
 * File: heap.swift
 * Created Time: 2024-03-17
 * Author: nuomi1 (nuomi1@qq.com)
 */

import HeapModule
import utils

func testPush(heap: inout Heap<Int>, val: Int) {
    heap.insert(val)
    print("\nHeap after pushing \(val):\n")
    PrintUtil.printHeap(queue: heap.unordered)
}

func testPop(heap: inout Heap<Int>) {
    let val = heap.removeMax()
    print("\nHeap after popping the root (\(val)):\n")
    PrintUtil.printHeap(queue: heap.unordered)
}

@main
enum _Heap {
    /* Driver code */
    static func main() {
        /* Initialize the heap */
        // Swift's Heap type supports both max-heaps and min-heaps
        var heap = Heap<Int>()

        /* Push an element onto the heap */
        testPush(heap: &heap, val: 1)
        testPush(heap: &heap, val: 3)
        testPush(heap: &heap, val: 2)
        testPush(heap: &heap, val: 5)
        testPush(heap: &heap, val: 4)

        /* Get the root element */
        let peek = heap.max()
        print("\nRoot element: \(peek!)\n")

        /* Pop the root */
        testPop(heap: &heap)
        testPop(heap: &heap)
        testPop(heap: &heap)
        testPop(heap: &heap)
        testPop(heap: &heap)

        /* Get the heap size */
        let size = heap.count
        print("\nNumber of elements in the heap: \(size)\n")

        /* Check whether the heap is empty */
        let isEmpty = heap.isEmpty
        print("\nIs the heap empty? \(isEmpty)\n")

        /* Build a heap from the input list */
        // The time complexity is O(n), rather than O(nlogn)
        let heap2 = Heap([1, 3, 2, 5, 4])
        print("\nHeap built from the input list:")
        PrintUtil.printHeap(queue: heap2.unordered)
    }
}
