"""
File: top_k.py
Created Time: 2023-06-10
Author: krahets (krahets@163.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from modules import print_heap

import heapq


def top_k_heap(nums: list[int], k: int) -> list[int]:
    """Найти k наибольших элементов массива с помощью кучи"""
    # Инициализация минимальной кучи
    heap = []
    # Поместить первые k элементов массива в кучу
    for i in range(k):
        heapq.heappush(heap, nums[i])
    # Начиная с элемента k+1, поддерживать длину кучи равной k
    for i in range(k, len(nums)):
        # Если текущий элемент больше элемента на вершине кучи, извлечь вершину кучи и добавить текущий элемент в кучу
        if nums[i] > heap[0]:
            heapq.heappop(heap)
            heapq.heappush(heap, nums[i])
    return heap


"""Driver Code"""
if __name__ == "__main__":
    nums = [1, 7, 6, 3, 2]
    k = 3

    res = top_k_heap(nums, k)
    print(f"Наибольшие {k} элементов")
    print_heap(res)
