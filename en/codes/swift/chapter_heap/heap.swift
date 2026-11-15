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
    /* Driver code */
    static func main() {
        // [region]{init}
        /* Initialize the heap */
        // The Heap type in Swift Collections supports both max heap and min heap operations
        var heap = Heap<Int>()
        // [endregion]{init}

        // [region]{push}
        /* Push an element onto the heap */
        heap.insert(1)
        heap.insert(3)
        heap.insert(2)
        heap.insert(5)
        heap.insert(4)
        // [endregion]{push}
        PrintUtil.printHeap(queue: heap.unordered)

        // [region]{peek}
        /* Get the maximum element of the heap */
        var peek = heap.max()
        // [endregion]{peek}
        print("\nMaximum heap element: \(peek!)\n")

        // [region]{pop_1}
        /* Remove the maximum element from the heap */
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
        /* Get the heap size */
        let size = heap.count
        // [endregion]{size}
        print("\nNumber of heap elements: \(size)\n")

        // [region]{is_empty}
        /* Check whether the heap is empty */
        let isEmpty = heap.isEmpty
        // [endregion]{is_empty}
        print("\nIs the heap empty: \(isEmpty)\n")

        // [region]{heapify}
        /* Build a heap from an input list */
        // The time complexity is O(n), not O(nlogn)
        let heap2 = Heap([1, 3, 2, 5, 4])
        // [endregion]{heapify}
        print("\nAfter building a heap from the input list:")
        PrintUtil.printHeap(queue: heap2.unordered)
    }
}
