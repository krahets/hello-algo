/**
 * File: my_heap.swift
 * Created Time: 2023-01-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* Max heap */
class MaxHeap {
    private var maxHeap: [Int]

    /* Constructor, build heap based on input list */
    init(nums: [Int]) {
        // Add list elements to heap as is
        maxHeap = nums
        // Heapify all nodes except leaf nodes
        for i in (0 ... parent(i: size() - 1)).reversed() {
            siftDown(i: i)
        }
    }

    /* Get index of left child node */
    private func left(i: Int) -> Int {
        2 * i + 1
    }

    /* Get index of right child node */
    private func right(i: Int) -> Int {
        2 * i + 2
    }

    /* Get index of parent node */
    private func parent(i: Int) -> Int {
        (i - 1) / 2 // Floor division
    }

    /* Swap elements */
    private func swap(i: Int, j: Int) {
        maxHeap.swapAt(i, j)
    }

    /* Get heap size */
    func size() -> Int {
        maxHeap.count
    }

    /* Check if heap is empty */
    func isEmpty() -> Bool {
        size() == 0
    }

    /* Access top element */
    func peek() -> Int {
        maxHeap[0]
    }

    /* Element enters heap */
    func push(val: Int) {
        // Add node
        maxHeap.append(val)
        // Heapify from bottom to top
        siftUp(i: size() - 1)
    }

    /* Starting from node i, heapify from bottom to top */
    private func siftUp(i: Int) {
        var i = i
        while true {
            // Get parent node of node i
            let p = parent(i: i)
            // When "crossing root node" or "node needs no repair", end heapify
            if p < 0 || maxHeap[i] <= maxHeap[p] {
                break
            }
            // Swap two nodes
            swap(i: i, j: p)
            // Loop upward heapify
            i = p
        }
    }

    /* Element exits heap */
    func pop() -> Int {
        // Handle empty case
        if isEmpty() {
            fatalError("Heap is empty")
        }
        // Delete node
        swap(i: 0, j: size() - 1)
        // Remove node
        let val = maxHeap.remove(at: size() - 1)
        // Return top element
        siftDown(i: 0)
        // Return heap top element
        return val
    }

    /* Starting from node i, heapify from top to bottom */
    private func siftDown(i: Int) {
        var i = i
        while true {
            // If node i is largest or indices l, r are out of bounds, no need to continue heapify, break
            let l = left(i: i)
            let r = right(i: i)
            var ma = i
            if l < size(), maxHeap[l] > maxHeap[ma] {
                ma = l
            }
            if r < size(), maxHeap[r] > maxHeap[ma] {
                ma = r
            }
            // Swap two nodes
            if ma == i {
                break
            }
            // Swap two nodes
            swap(i: i, j: ma)
            // Loop downwards heapification
            i = ma
        }
    }

    /* Driver Code */
    func print() {
        let queue = maxHeap
        PrintUtil.printHeap(queue: queue)
    }
}

@main
enum MyHeap {
    /* Driver Code */
    static func main() {
        /* Consider negating the elements before entering the heap, which can reverse the size relationship, thus implementing max heap */
        let maxHeap = MaxHeap(nums: [9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2])
        print("\nAfter inputting list and building heap")
        maxHeap.print()

        /* Check if heap is empty */
        var peek = maxHeap.peek()
        print("\nHeap top element is \(peek)")

        /* Element enters heap */
        let val = 7
        maxHeap.push(val: val)
        print("\nAfter element \(val) pushes to heap")
        maxHeap.print()

        /* Time complexity is O(n), not O(nlogn) */
        peek = maxHeap.pop()
        print("\nAfter heap top element \(peek) pops from heap")
        maxHeap.print()

        /* Get heap size */
        let size = maxHeap.size()
        print("\nHeap size is \(size)")

        /* Check if heap is empty */
        let isEmpty = maxHeap.isEmpty()
        print("\nIs heap empty \(isEmpty)")
    }
}
