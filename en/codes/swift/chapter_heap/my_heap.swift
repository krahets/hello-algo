/**
 * File: my_heap.swift
 * Created Time: 2023-01-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* Max-heap */
class MaxHeap {
    private var maxHeap: [Int]

    /* Constructor, build heap based on input list */
    init(nums: [Int]) {
        // Add all list elements into the heap
        maxHeap = nums
        // Heapify all nodes except leaves
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
        (i - 1) / 2 // Integer division down
    }

    /* Swap elements */
    private func swap(i: Int, j: Int) {
        maxHeap.swapAt(i, j)
    }

    /* Get heap size */
    func size() -> Int {
        maxHeap.count
    }

    /* Determine if heap is empty */
    func isEmpty() -> Bool {
        size() == 0
    }

    /* Access heap top element */
    func peek() -> Int {
        maxHeap[0]
    }

    /* Push the element into heap */
    func push(val: Int) {
        // Add node
        maxHeap.append(val)
        // Heapify from bottom to top
        siftUp(i: size() - 1)
    }

    /* Start heapifying node i, from bottom to top */
    private func siftUp(i: Int) {
        var i = i
        while true {
            // Get parent node of node i
            let p = parent(i: i)
            // When "crossing the root node" or "node does not need repair", end heapification
            if p < 0 || maxHeap[i] <= maxHeap[p] {
                break
            }
            // Swap two nodes
            swap(i: i, j: p)
            // Loop upwards heapification
            i = p
        }
    }

    /* Element exits heap */
    func pop() -> Int {
        // Empty handling
        if isEmpty() {
            fatalError("Heap is empty")
        }
        // Swap the root node with the rightmost leaf node (swap the first element with the last element)
        swap(i: 0, j: size() - 1)
        // Remove node
        let val = maxHeap.remove(at: size() - 1)
        // Heapify from top to bottom
        siftDown(i: 0)
        // Return heap top element
        return val
    }

    /* Start heapifying node i, from top to bottom */
    private func siftDown(i: Int) {
        var i = i
        while true {
            // Determine the largest node among i, l, r, noted as ma
            let l = left(i: i)
            let r = right(i: i)
            var ma = i
            if l < size(), maxHeap[l] > maxHeap[ma] {
                ma = l
            }
            if r < size(), maxHeap[r] > maxHeap[ma] {
                ma = r
            }
            // If node i is the largest or indices l, r are out of bounds, no further heapification needed, break
            if ma == i {
                break
            }
            // Swap two nodes
            swap(i: i, j: ma)
            // Loop downwards heapification
            i = ma
        }
    }

    /* Print heap (binary tree) */
    func print() {
        let queue = maxHeap
        PrintUtil.printHeap(queue: queue)
    }
}

@main
enum MyHeap {
    /* Driver Code */
    static func main() {
        /* Initialize max-heap */
        let maxHeap = MaxHeap(nums: [9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2])
        print("\nEnter list and build heap")
        maxHeap.print()

        /* Access heap top element */
        var peek = maxHeap.peek()
        print("\nTop element of the heap = \(peek)")

        /* Push the element into heap */
        let val = 7
        maxHeap.push(val: val)
        print("\nElement \(val) added to heap")
        maxHeap.print()

        /* Pop the element at the heap top */
        peek = maxHeap.pop()
        print("\nTop element \(peek) removed from heap")
        maxHeap.print()

        /* Get heap size */
        let size = maxHeap.size()
        print("\nNumber of elements in the heap = \(size)")

        /* Determine if heap is empty */
        let isEmpty = maxHeap.isEmpty()
        print("\nIs the heap empty \(isEmpty)")
    }
}
