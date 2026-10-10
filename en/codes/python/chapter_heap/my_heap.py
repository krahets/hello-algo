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
    """Max heap"""

    def __init__(self, nums: list[int]):
        """Constructor, build heap based on input list"""
        # Add list elements to heap as is
        self.max_heap = nums
        # Heapify all nodes except leaf nodes
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
        return (i - 1) // 2  # Floor division

    def swap(self, i: int, j: int):
        """Swap elements"""
        self.max_heap[i], self.max_heap[j] = self.max_heap[j], self.max_heap[i]

    def size(self) -> int:
        """Get heap size"""
        return len(self.max_heap)

    def is_empty(self) -> bool:
        """Check if heap is empty"""
        return self.size() == 0

    def peek(self) -> int:
        """Access top element"""
        return self.max_heap[0]

    def push(self, val: int):
        """Element enters heap"""
        # Add node
        self.max_heap.append(val)
        # Heapify from bottom to top
        self.sift_up(self.size() - 1)

    def sift_up(self, i: int):
        """Starting from node i, heapify from bottom to top"""
        while True:
            # Get parent node of node i
            p = self.parent(i)
            # When "crossing root node" or "node needs no repair", end heapify
            if p < 0 or self.max_heap[i] <= self.max_heap[p]:
                break
            # Swap two nodes
            self.swap(i, p)
            # Loop upward heapify
            i = p

    def pop(self) -> int:
        """Element exits heap"""
        # Handle empty case
        if self.is_empty():
            raise IndexError("Heap is empty")
        # Swap root node with rightmost leaf node (swap first element with last element)
        self.swap(0, self.size() - 1)
        # Delete node
        val = self.max_heap.pop()
        # Heapify from top to bottom
        self.sift_down(0)
        # Return top element
        return val

    def sift_down(self, i: int):
        """Starting from node i, heapify from top to bottom"""
        while True:
            # Find node with largest value among i, l, r, denoted as ma
            l, r, ma = self.left(i), self.right(i), i
            if l < self.size() and self.max_heap[l] > self.max_heap[ma]:
                ma = l
            if r < self.size() and self.max_heap[r] > self.max_heap[ma]:
                ma = r
            # If node i is largest or indices l, r are out of bounds, no need to continue heapify, break
            if ma == i:
                break
            # Swap two nodes
            self.swap(i, ma)
            # Loop downward heapify
            i = ma

    def print(self):
        """Print heap (binary tree)"""
        print_heap(self.max_heap)


"""Driver Code"""
if __name__ == "__main__":
    # Initialize max heap
    max_heap = MaxHeap([9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2])
    print("\nAfter inputting list and building heap")
    max_heap.print()

    # Get top element
    peek = max_heap.peek()
    print(f"\nTop element is {peek}")

    # Element enters heap
    val = 7
    max_heap.push(val)
    print(f"\nAfter element {val} enters heap")
    max_heap.print()

    # Top element exits heap
    peek = max_heap.pop()
    print(f"\nAfter top element {peek} exits heap")
    max_heap.print()

    # Get heap size
    size = max_heap.size()
    print(f"\nNumber of heap elements is {size}")

    # Check if heap is empty
    is_empty = max_heap.is_empty()
    print(f"\nIs heap empty {is_empty}")
