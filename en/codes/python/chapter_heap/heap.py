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


"""Driver code"""
if __name__ == "__main__":
    # [region]{init}
    # Initialize a min heap
    min_heap, flag = [], 1
    # Initialize a max heap
    max_heap, flag = [], -1

    # Python's heapq module implements a min heap by default
    # Negate each element before pushing it onto the heap to reverse the ordering and implement a max heap
    # In this example, flag = 1 represents a min heap and flag = -1 represents a max heap
    # [endregion]{init}
    print("\nThe following example uses a max heap")

    # [region]{push}
    # Push an element onto the heap
    heapq.heappush(max_heap, flag * 1)
    heapq.heappush(max_heap, flag * 3)
    heapq.heappush(max_heap, flag * 2)
    heapq.heappush(max_heap, flag * 5)
    heapq.heappush(max_heap, flag * 4)
    # [endregion]{push}
    print_heap([flag * val for val in max_heap])

    # [region]{peek}
    # Get the top element of the heap
    peek: int = flag * max_heap[0]  # 5
    # [endregion]{peek}
    print(f"\nTop element of the heap: {peek}")

    # [region]{pop_1}
    # Pop the top element from the heap
    # The elements are popped in descending order
    val = flag * heapq.heappop(max_heap)  # 5
    # [endregion]{pop_1}
    print(val)
    # [region]{pop_2}
    val = flag * heapq.heappop(max_heap)  # 4
    # [endregion]{pop_2}
    print(val)
    # [region]{pop_3}
    val = flag * heapq.heappop(max_heap)  # 3
    # [endregion]{pop_3}
    print(val)
    # [region]{pop_4}
    val = flag * heapq.heappop(max_heap)  # 2
    # [endregion]{pop_4}
    print(val)
    # [region]{pop_5}
    val = flag * heapq.heappop(max_heap)  # 1
    # [endregion]{pop_5}
    print(val)

    # [region]{size}
    # Get the heap size
    size: int = len(max_heap)
    # [endregion]{size}
    print(f"\nNumber of elements in the heap: {size}")

    # [region]{is_empty}
    # Check whether the heap is empty
    is_empty: bool = not max_heap
    # [endregion]{is_empty}
    print(f"\nIs the heap empty: {is_empty}")

    # [region]{heapify}
    # Build a heap from an input list
    # The time complexity is O(n), not O(nlogn)
    min_heap: list[int] = [1, 3, 2, 5, 4]
    heapq.heapify(min_heap)
    # [endregion]{heapify}
    print("\nAfter building a min heap from the input list:")
    print_heap(min_heap)
