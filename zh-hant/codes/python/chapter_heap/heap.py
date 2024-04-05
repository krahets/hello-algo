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
    heapq.heappush(heap, flag * val)  # 元素入堆積
    print(f"\n元素 {val} 入堆積後")
    print_heap([flag * val for val in heap])


def test_pop(heap: list, flag: int = 1):
    val = flag * heapq.heappop(heap)  # 堆積頂元素出堆積
    print(f"\n堆積頂元素 {val} 出堆積後")
    print_heap([flag * val for val in heap])


"""Driver Code"""
if __name__ == "__main__":
    # 初始化小頂堆積
    min_heap, flag = [], 1
    # 初始化大頂堆積
    max_heap, flag = [], -1

    print("\n以下測試樣例為大頂堆積")
    # Python 的 heapq 模組預設實現小頂堆積
    # 考慮將“元素取負”後再入堆積，這樣就可以將大小關係顛倒，從而實現大頂堆積
    # 在本示例中，flag = 1 時對應小頂堆積，flag = -1 時對應大頂堆積

    # 元素入堆積
    test_push(max_heap, 1, flag)
    test_push(max_heap, 3, flag)
    test_push(max_heap, 2, flag)
    test_push(max_heap, 5, flag)
    test_push(max_heap, 4, flag)

    # 獲取堆積頂元素
    peek: int = flag * max_heap[0]
    print(f"\n堆積頂元素為 {peek}")

    # 堆積頂元素出堆積
    test_pop(max_heap, flag)
    test_pop(max_heap, flag)
    test_pop(max_heap, flag)
    test_pop(max_heap, flag)
    test_pop(max_heap, flag)

    # 獲取堆積大小
    size: int = len(max_heap)
    print(f"\n堆積元素數量為 {size}")

    # 判斷堆積是否為空
    is_empty: bool = not max_heap
    print(f"\n堆積是否為空 {is_empty}")

    # 輸入串列並建堆積
    # 時間複雜度為 O(n) ，而非 O(nlogn)
    min_heap = [1, 3, 2, 5, 4]
    heapq.heapify(min_heap)
    print("\n輸入串列並建立小頂堆積後")
    print_heap(min_heap)
