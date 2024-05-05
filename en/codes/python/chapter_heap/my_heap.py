"""
File: my_heap.py
Created Time: 2023-02-23
Author: krahets (krahets@163.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from modules import print_heap


class MaxHeap:
    """Max-heap"""

    def __init__(self, nums: list[int]):
        """Constructor, build heap based on input list"""
        # Add all list elements into the heap
        self.max_heap = nums
        # Heapify all nodes except leaves
        for i in range(self.parent(self.size() - 1), -1, -1):
            self.sift_down(i)

    def left(self, i: int) -> int:
        """Get index of left child node"""
        return 2 * i + 1

    def right(self, i: int) -> int:
        """Get index of right child node"""
        return 2 * i + 2

    def parent(self, i: int) -> int:
        """Get index of parent node"""
        return (i - 1) // 2  # Integer division down

    def swap(self, i: int, j: int):
        """Swap elements"""
        self.max_heap[i], self.max_heap[j] = self.max_heap[j], self.max_heap[i]

    def size(self) -> int:
        """Get heap size"""
        return len(self.max_heap)

    def is_empty(self) -> bool:
        """Determine if heap is empty"""
        return self.size() == 0

    def peek(self) -> int:
        """Access heap top element"""
        return self.max_heap[0]

    def push(self, val: int):
        """Push the element into heap"""
        # Add node
        self.max_heap.append(val)
        # Heapify from bottom to top
        self.sift_up(self.size() - 1)

    def sift_up(self, i: int):
        """Start heapifying node i, from bottom to top"""
        while True:
            # Get parent node of node i
            p = self.parent(i)
            # When "crossing the root node" or "node does not need repair", end heapification
            if p < 0 or self.max_heap[i] <= self.max_heap[p]:
                break
            # Swap two nodes
            self.swap(i, p)
            # Loop upwards heapification
            i = p

    def pop(self) -> int:
        """Element exits heap"""
        # Empty handling
        if self.is_empty():
            raise IndexError("Heap is empty")
        # Swap the root node with the rightmost leaf node (swap the first element with the last element)
        self.swap(0, self.size() - 1)
        # Remove node
        val = self.max_heap.pop()
        # Heapify from top to bottom
        self.sift_down(0)
        # Return heap top element
        return val

    def sift_down(self, i: int):
        """Start heapifying node i, from top to bottom"""
        while True:
            # Determine the largest node among i, l, r, noted as ma
            l, r, ma = self.left(i), self.right(i), i
            if l < self.size() and self.max_heap[l] > self.max_heap[ma]:
                ma = l
            if r < self.size() and self.max_heap[r] > self.max_heap[ma]:
                ma = r
            # If node i is the largest or indices l, r are out of bounds, no further heapification needed, break
            if ma == i:
                break
            # Swap two nodes
            self.swap(i, ma)
            # Loop downwards heapification
            i = ma

    def print(self):
        """Print heap (binary tree)"""
        print_heap(self.max_heap)


"""Driver Code"""
if __name__ == "__main__":
    # Initialize max-heap
    max_heap = MaxHeap([9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2])
    print("\nEnter list and build heap")
    max_heap.print()

    # Access heap top element
    peek = max_heap.peek()
    print(f"\nHeap top element is {peek}")

    # Push the element into heap
    val = 7
    max_heap.push(val)
    print(f"\nElement {val} after pushed into heap")
    max_heap.print()

    # Pop the element at the heap top
    peek = max_heap.pop()
    print(f"\nHeap top element {peek} after exiting heap")
    max_heap.print()

    # Get heap size
    size = max_heap.size()
    print(f"\nNumber of heap elements is {size}")

    # Determine if heap is empty
    is_empty = max_heap.is_empty()
    print(f"\nIs the heap empty {is_empty}")
