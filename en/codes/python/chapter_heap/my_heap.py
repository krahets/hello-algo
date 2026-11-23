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
        """Constructor: build a heap from the input list"""
        # Place the list elements in the heap without changing their order
        self.max_heap = nums
        # Sift down from every non-leaf node
        for i in range(self.parent(self.size() - 1), -1, -1):
            self.sift_down(i)

    def left(self, i: int) -> int:
        """Get the left child index"""
        return 2 * i + 1

    def right(self, i: int) -> int:
        """Get the right child index"""
        return 2 * i + 2

    def parent(self, i: int) -> int:
        """Get the parent index"""
        return (i - 1) // 2  # Floor division

    def swap(self, i: int, j: int):
        """Swap elements"""
        self.max_heap[i], self.max_heap[j] = self.max_heap[j], self.max_heap[i]

    def size(self) -> int:
        """Get the heap size"""
        return len(self.max_heap)

    def is_empty(self) -> bool:
        """Check whether the heap is empty"""
        return self.size() == 0

    def peek(self) -> int:
        """Access the top element of the heap"""
        return self.max_heap[0]

    def push(self, val: int):
        """Push an element onto the heap"""
        # Add a node
        self.max_heap.append(val)
        # Sift up
        self.sift_up(self.size() - 1)

    def sift_up(self, i: int):
        """Sift up starting from node i"""
        while True:
            # Get the parent of node i
            p = self.parent(i)
            # Stop sifting when the root has been passed or the node needs no repair
            if p < 0 or self.max_heap[i] <= self.max_heap[p]:
                break
            # Swap the two nodes
            self.swap(i, p)
            # Continue sifting up
            i = p

    def pop(self) -> int:
        """Pop an element from the heap"""
        # Handle an empty heap
        if self.is_empty():
            raise IndexError("Heap is empty")
        # Swap the root with the rightmost leaf on the last level (swap the first and last elements)
        self.swap(0, self.size() - 1)
        # Remove a node
        val = self.max_heap.pop()
        # Sift down
        self.sift_down(0)
        # Return the top element of the heap
        return val

    def sift_down(self, i: int):
        """Sift down starting from node i"""
        while True:
            # Find the node with the largest value among i, l, and r, and store its index in ma
            l, r, ma = self.left(i), self.right(i), i
            if l < self.size() and self.max_heap[l] > self.max_heap[ma]:
                ma = l
            if r < self.size() and self.max_heap[r] > self.max_heap[ma]:
                ma = r
            # Stop if node i is largest or both child indices l and r are out of bounds
            if ma == i:
                break
            # Swap the two nodes
            self.swap(i, ma)
            # Continue sifting down
            i = ma

    def print(self):
        """Print the heap (binary tree)"""
        print_heap(self.max_heap)


"""Driver code"""
if __name__ == "__main__":
    # Initialize a max heap
    max_heap = MaxHeap([9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2])
    print("\nAfter building a heap from the input list:")
    max_heap.print()

    # Get the top element of the heap
    peek = max_heap.peek()
    print(f"\nTop element of the heap: {peek}")

    # Push an element onto the heap
    val = 7
    max_heap.push(val)
    print(f"\nAfter pushing element {val} onto the heap:")
    max_heap.print()

    # Pop the top element from the heap
    peek = max_heap.pop()
    print(f"\nAfter popping top element {peek} from the heap:")
    max_heap.print()

    # Get the heap size
    size = max_heap.size()
    print(f"\nNumber of elements in the heap: {size}")

    # Check whether the heap is empty
    is_empty = max_heap.is_empty()
    print(f"\nIs the heap empty: {is_empty}")
