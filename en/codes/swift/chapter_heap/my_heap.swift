/**
 * File: my_heap.swift
 * Created Time: 2023-01-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* Max heap */
class MaxHeap {
    private var maxHeap: [Int]

    /* Constructor: build a heap from the input list */
    init(nums: [Int]) {
        // Place the list elements in the heap without changing their order
        maxHeap = nums
        // Sift down from every non-leaf node
        for i in (0 ... parent(i: size() - 1)).reversed() {
            siftDown(i: i)
        }
    }

    /* Get the left child index */
    private func left(i: Int) -> Int {
        2 * i + 1
    }

    /* Get the right child index */
    private func right(i: Int) -> Int {
        2 * i + 2
    }

    /* Get the parent index */
    private func parent(i: Int) -> Int {
        (i - 1) / 2 // Integer division truncates toward zero
    }

    /* Swap elements */
    private func swap(i: Int, j: Int) {
        maxHeap.swapAt(i, j)
    }

    /* Get the heap size */
    func size() -> Int {
        maxHeap.count
    }

    /* Check whether the heap is empty */
    func isEmpty() -> Bool {
        size() == 0
    }

    /* Access the top element of the heap */
    func peek() -> Int {
        maxHeap[0]
    }

    /* Push an element onto the heap */
    func push(val: Int) {
        // Add a node
        maxHeap.append(val)
        // Sift up
        siftUp(i: size() - 1)
    }

    /* Sift up starting from node i */
    private func siftUp(i: Int) {
        var i = i
        while true {
            // Get the parent of node i
            let p = parent(i: i)
            // Stop when the parent index is invalid or the node already satisfies the heap order
            if p < 0 || maxHeap[i] <= maxHeap[p] {
                break
            }
            // Swap the two nodes
            swap(i: i, j: p)
            // Continue sifting up
            i = p
        }
    }

    /* Pop an element from the heap */
    func pop() -> Int {
        // Handle an empty heap
        if isEmpty() {
            fatalError("Heap is empty")
        }
        // Swap the root with the rightmost leaf on the last level (swap the first and last elements)
        swap(i: 0, j: size() - 1)
        // Remove a node
        let val = maxHeap.remove(at: size() - 1)
        // Sift down
        siftDown(i: 0)
        // Return the top element of the heap
        return val
    }

    /* Sift down starting from node i */
    private func siftDown(i: Int) {
        var i = i
        while true {
            // Find the node with the largest value among i, l, and r, and store its index in ma
            let l = left(i: i)
            let r = right(i: i)
            var ma = i
            if l < size(), maxHeap[l] > maxHeap[ma] {
                ma = l
            }
            if r < size(), maxHeap[r] > maxHeap[ma] {
                ma = r
            }
            // Stop if node i is largest or both child indices l and r are out of bounds
            if ma == i {
                break
            }
            // Swap the two nodes
            swap(i: i, j: ma)
            // Continue sifting down
            i = ma
        }
    }

    /* Print the heap (binary tree) */
    func print() {
        let queue = maxHeap
        PrintUtil.printHeap(queue: queue)
    }
}

@main
enum MyHeap {
    /* Driver code */
    static func main() {
        /* Initialize a max heap */
        let maxHeap = MaxHeap(nums: [9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2])
        print("\nAfter building a heap from the input list:")
        maxHeap.print()

        /* Get the top element of the heap */
        var peek = maxHeap.peek()
        print("\nTop heap element: \(peek)")

        /* Push an element onto the heap */
        let val = 7
        maxHeap.push(val: val)
        print("\nAfter inserting element \(val) into the heap:")
        maxHeap.print()

        /* Pop the top element from the heap */
        peek = maxHeap.pop()
        print("\nAfter removing the top element \(peek) from the heap:")
        maxHeap.print()

        /* Get the heap size */
        let size = maxHeap.size()
        print("\nNumber of heap elements: \(size)")

        /* Check whether the heap is empty */
        let isEmpty = maxHeap.isEmpty()
        print("\nIs the heap empty: \(isEmpty)")
    }
}
