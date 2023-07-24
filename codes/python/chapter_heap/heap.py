"""
File: heap.py
Created Time: 2023-02-23
Author: Krahets (krahets@163.com)
"""

import sys, os.path as osp

sys.path.append(osp.dirname(osp.dirname(osp.abspath(__file__))))
from modules import *

import heapq


def test_push(heap: list, val: int, flag: int = 1):
    heapq.heappush(heap, flag * val)  # 元素入堆
    print(f"\n元素 {val} 入堆后")
    print_heap([flag * val for val in heap])


def test_pop(heap: list, flag: int = 1):
    val = flag * heapq.heappop(heap)  # 堆顶元素出堆
    print(f"\n堆顶元素 {val} 出堆后")
    print_heap([flag * val for val in heap])


"""Driver Code"""
if __name__ == "__main__":
    # 初始化小顶堆
    min_heap, flag = [], 1
    # 初始化大顶堆
    max_heap, flag = [], -1

    print("\n以下测试样例为大顶堆")
    # Python 的 heapq 模块默认实现小顶堆
    # 考虑将“元素取负”后再入堆，这样就可以将大小关系颠倒，从而实现大顶堆
    # 在本示例中，flag = 1 时对应小顶堆，flag = -1 时对应大顶堆

    # 元素入堆
    test_push(max_heap, 1, flag)
    test_push(max_heap, 3, flag)
    test_push(max_heap, 2, flag)
    test_push(max_heap, 5, flag)
    test_push(max_heap, 4, flag)

    # 获取堆顶元素
    peek: int = flag * max_heap[0]
    print(f"\n堆顶元素为 {peek}")

    # 堆顶元素出堆
    test_pop(max_heap, flag)
    test_pop(max_heap, flag)
    test_pop(max_heap, flag)
    test_pop(max_heap, flag)
    test_pop(max_heap, flag)

    # 获取堆大小
    size: int = len(max_heap)
    print(f"\n堆元素数量为 {size}")

    # 判断堆是否为空
    is_empty: bool = not max_heap
    print(f"\n堆是否为空 {is_empty}")

    # 输入列表并建堆
    # 时间复杂度为 O(n) ，而非 O(nlogn)
    min_heap = [1, 3, 2, 5, 4]
    heapq.heapify(min_heap)
    print("\n输入列表并建立小顶堆后")
    print_heap(min_heap)
