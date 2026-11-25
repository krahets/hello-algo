/**
 * File: my_heap.swift
 * Created Time: 2023-01-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* Max-heap */
class MaxHeap {
    private var maxHeap: [Int]

    /* Constructor: build a heap from the input list */
    init(nums: [Int]) {
        // Copy the list elements into the heap in their original order
        maxHeap = nums
        // Heapify all non-leaf nodes
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
        (i - 1) / 2 // Floor division
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

    /* Peek at the root */
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

    /* Sift up from node i */
    private func siftUp(i: Int) {
        var i = i
        while true {
            // Get the parent of node i
            let p = parent(i: i)
            // Stop sifting at the root or when the node already satisfies the heap property
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
        // Swap the root and the rightmost leaf (the first and last elements)
        swap(i: 0, j: size() - 1)
        // Remove the node
        let val = maxHeap.remove(at: size() - 1)
        // Sift down
        siftDown(i: 0)
        // Return the root element
        return val
    }

    /* Sift down from node i */
    private func siftDown(i: Int) {
        var i = i
        while true {
            // Store the index of the largest of nodes i, l, and r in ma
            let l = left(i: i)
            let r = right(i: i)
            var ma = i
            if l < size(), maxHeap[l] > maxHeap[ma] {
                ma = l
            }
            if r < size(), maxHeap[r] > maxHeap[ma] {
                ma = r
            }
            // Stop if i is already largest or both child indices l and r are out of bounds
            if ma == i {
                break
            }
            // Swap the two nodes
            swap(i: i, j: ma)
            // Continue sifting down
            i = ma
        }
    }

    /* Print the heap as a binary tree */
    func print() {
        let queue = maxHeap
        PrintUtil.printHeap(queue: queue)
    }
}

@main
enum MyHeap {
    /* Driver code */
    static func main() {
        /* Initialize a max-heap */
        let maxHeap = MaxHeap(nums: [9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2])
        print("\nHeap built from the input list:")
        maxHeap.print()

        /* Get the root element */
        var peek = maxHeap.peek()
        print("\nRoot element: \(peek)")

        /* Push an element onto the heap */
        let val = 7
        maxHeap.push(val: val)
        print("\nHeap after pushing \(val):")
        maxHeap.print()

        /* Pop the root */
        peek = maxHeap.pop()
        print("\nHeap after popping the root (\(peek)):")
        maxHeap.print()

        /* Get the heap size */
        let size = maxHeap.size()
        print("\nNumber of elements in the heap: \(size)")

        /* Check whether the heap is empty */
        let isEmpty = maxHeap.isEmpty()
        print("\nIs the heap empty? \(isEmpty)")
    }
}
