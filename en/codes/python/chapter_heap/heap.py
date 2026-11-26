"""
File: heap.py
Created Time: 2023-02-23
Author: krahets (krahets@163.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from modules import print_heap

import heapq


def test_push(heap: list, val: int, flag: int = 1):
    heapq.heappush(heap, flag * val)  # Push an element onto the heap
    print(f"\nHeap after pushing {val}:")
    print_heap([flag * val for val in heap])


def test_pop(heap: list, flag: int = 1):
    val = flag * heapq.heappop(heap)  # Pop the root
    print(f"\nHeap after popping the root ({val}):")
    print_heap([flag * val for val in heap])


"""Driver Code"""
if __name__ == "__main__":
    # Initialize a min-heap
    min_heap, flag = [], 1
    # Initialize a max-heap
    max_heap, flag = [], -1

    print("\nThe following example uses a max-heap")
    # The Python heapq module implements a min-heap by default
    # Negate each element before pushing it to reverse the ordering and implement a max-heap
    # In this example, flag = 1 selects a min-heap and flag = -1 selects a max-heap

    # Push an element onto the heap
    test_push(max_heap, 1, flag)
    test_push(max_heap, 3, flag)
    test_push(max_heap, 2, flag)
    test_push(max_heap, 5, flag)
    test_push(max_heap, 4, flag)

    # Get the root element
    peek: int = flag * max_heap[0]
    print(f"\nRoot element: {peek}")

    # Pop the root
    test_pop(max_heap, flag)
    test_pop(max_heap, flag)
    test_pop(max_heap, flag)
    test_pop(max_heap, flag)
    test_pop(max_heap, flag)

    # Get the heap size
    size: int = len(max_heap)
    print(f"\nNumber of elements in the heap: {size}")

    # Check whether the heap is empty
    is_empty: bool = not max_heap
    print(f"\nIs the heap empty? {is_empty}")

    # Build a heap from the input list
    # The time complexity is O(n), rather than O(nlogn)
    min_heap = [1, 3, 2, 5, 4]
    heapq.heapify(min_heap)
    print("\nMin-heap built from the input list:")
    print_heap(min_heap)
