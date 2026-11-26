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
    heapq.heappush(heap, flag * val)  # 將元素加入堆積
    print(f"\n將元素 {val} 加入堆積後")
    print_heap([flag * val for val in heap])


def test_pop(heap: list, flag: int = 1):
    val = flag * heapq.heappop(heap)  # 取出堆積頂端元素
    print(f"\n取出堆積頂端元素 {val} 後")
    print_heap([flag * val for val in heap])


"""Driver Code"""
if __name__ == "__main__":
    # 初始化最小堆積
    min_heap, flag = [], 1
    # 初始化最大堆積
    max_heap, flag = [], -1

    print("\n以下以最大堆積為測試案例")
    # Python 的 heapq 模組預設實作最小堆積
    # 可以先將元素變號再加入堆積，顛倒元素間的大小關係，藉此實作最大堆積
    # 本例中 flag = 1 代表最小堆積，flag = -1 代表最大堆積

    # 將元素加入堆積
    test_push(max_heap, 1, flag)
    test_push(max_heap, 3, flag)
    test_push(max_heap, 2, flag)
    test_push(max_heap, 5, flag)
    test_push(max_heap, 4, flag)

    # 取得堆積頂端元素
    peek: int = flag * max_heap[0]
    print(f"\n堆積頂端元素為 {peek}")

    # 取出堆積頂端元素
    test_pop(max_heap, flag)
    test_pop(max_heap, flag)
    test_pop(max_heap, flag)
    test_pop(max_heap, flag)
    test_pop(max_heap, flag)

    # 取得堆積大小
    size: int = len(max_heap)
    print(f"\n堆積中的元素個數為 {size}")

    # 判斷堆積是否為空
    is_empty: bool = not max_heap
    print(f"\n堆積是否為空 {is_empty}")

    # 以輸入串列建立堆積
    # 時間複雜度為 O(n)，而非 O(nlogn)
    min_heap = [1, 3, 2, 5, 4]
    heapq.heapify(min_heap)
    print("\n用輸入串列建立最小堆積後")
    print_heap(min_heap)
