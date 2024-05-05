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
    heapq.heappush(heap, flag * val)  # Push the element into heap
    print(f"\nElement {val} after pushed into heap")
    print_heap([flag * val for val in heap])


def test_pop(heap: list, flag: int = 1):
    val = flag * heapq.heappop(heap)  # Pop the element at the heap top
    print(f"\nHeap top element {val} after exiting heap")
    print_heap([flag * val for val in heap])


"""Driver Code"""
if __name__ == "__main__":
    # Initialize min-heap
    min_heap, flag = [], 1
    # Initialize max-heap
    max_heap, flag = [], -1

    print("\nThe following test case is for max-heap")
    # Python's heapq module implements min-heap by default
    # Consider "negating the elements" before entering the heap, thus reversing the comparator to implement a max-heap
    # In this example, flag = 1 corresponds to min-heap, flag = -1 corresponds to max-heap

    # Push the element into heap
    test_push(max_heap, 1, flag)
    test_push(max_heap, 3, flag)
    test_push(max_heap, 2, flag)
    test_push(max_heap, 5, flag)
    test_push(max_heap, 4, flag)

    # Access heap top element
    peek: int = flag * max_heap[0]
    print(f"\nHeap top element is {peek}")

    # Pop the element at the heap top
    test_pop(max_heap, flag)
    test_pop(max_heap, flag)
    test_pop(max_heap, flag)
    test_pop(max_heap, flag)
    test_pop(max_heap, flag)

    # Get heap size
    size: int = len(max_heap)
    print(f"\nNumber of heap elements is {size}")

    # Determine if heap is empty
    is_empty: bool = not max_heap
    print(f"\nIs the heap empty {is_empty}")

    # Enter list and build heap
    # Time complexity is O(n), not O(nlogn)
    min_heap = [1, 3, 2, 5, 4]
    heapq.heapify(min_heap)
    print("\nEnter list and build min-heap")
    print_heap(min_heap)
