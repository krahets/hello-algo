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
    heapq.heappush(heap, flag * val)  # Добавить элемент в кучу
    print(f"\nПосле добавления элемента {val} в кучу")
    print_heap([flag * val for val in heap])


def test_pop(heap: list, flag: int = 1):
    val = flag * heapq.heappop(heap)  # Извлечь верхний элемент из кучи
    print(f"\nвершина кучиЭлемент {val} после извлечения из кучи")
    print_heap([flag * val for val in heap])


"""Driver Code"""
if __name__ == "__main__":
    # Инициализировать min-кучу
    min_heap, flag = [], 1
    # Инициализировать max-кучу
    max_heap, flag = [], -1

    print("\nСледующие тестовые примеры относятся к max-куче")
    # Модуль heapq в Python по умолчанию реализует min-кучу
    # Если перед помещением в кучу брать отрицание элемента, можно обратить отношение порядка и тем самым реализовать max-кучу
    # В этом примере flag = 1 соответствует min-куче, а flag = -1 соответствует max-куче

    # Добавить элемент в кучу
    test_push(max_heap, 1, flag)
    test_push(max_heap, 3, flag)
    test_push(max_heap, 2, flag)
    test_push(max_heap, 5, flag)
    test_push(max_heap, 4, flag)

    # Получить верхний элемент кучи
    peek: int = flag * max_heap[0]
    print(f"\nВерхний элемент кучи равен {peek}")

    # Извлечь верхний элемент из кучи
    test_pop(max_heap, flag)
    test_pop(max_heap, flag)
    test_pop(max_heap, flag)
    test_pop(max_heap, flag)
    test_pop(max_heap, flag)

    # Получить размер кучи
    size: int = len(max_heap)
    print(f"\nКоличество элементов в куче равно {size}")

    # Проверить, пуста ли куча
    is_empty: bool = not max_heap
    print(f"\nПуста ли куча: {is_empty}")

    # Входной список и построение кучи
    # Временная сложность равна O(n), а не O(nlogn)
    min_heap = [1, 3, 2, 5, 4]
    heapq.heapify(min_heap)
    print("\nПосле построения min-кучи по входному списку")
    print_heap(min_heap)
