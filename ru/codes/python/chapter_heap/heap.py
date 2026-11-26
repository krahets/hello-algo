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
    heapq.heappush(heap, flag * val)  # Вставить элемент в кучу
    print(f"\nПосле вставки элемента {val}:")
    print_heap([flag * val for val in heap])


def test_pop(heap: list, flag: int = 1):
    val = flag * heapq.heappop(heap)  # Извлечь элемент из корня
    print(f"\nПосле извлечения элемента {val} из корня:")
    print_heap([flag * val for val in heap])


"""Driver Code"""
if __name__ == "__main__":
    # Инициализировать мин-кучу
    min_heap, flag = [], 1
    # Инициализировать макс-кучу
    max_heap, flag = [], -1

    print("\nВ этом примере используется макс-куча")
    # Модуль heapq в Python по умолчанию реализует мин-кучу
    # Смена знака элементов перед вставкой обращает порядок сравнения и позволяет реализовать макс-кучу
    # В этом примере flag = 1 задаёт мин-кучу, а flag = -1 — макс-кучу

    # Вставить элемент в кучу
    test_push(max_heap, 1, flag)
    test_push(max_heap, 3, flag)
    test_push(max_heap, 2, flag)
    test_push(max_heap, 5, flag)
    test_push(max_heap, 4, flag)

    # Получить элемент в корне
    peek: int = flag * max_heap[0]
    print(f"\nЭлемент в корне: {peek}")

    # Извлечь элемент из корня
    test_pop(max_heap, flag)
    test_pop(max_heap, flag)
    test_pop(max_heap, flag)
    test_pop(max_heap, flag)
    test_pop(max_heap, flag)

    # Размер кучи
    size: int = len(max_heap)
    print(f"\nЧисло элементов в куче: {size}")

    # Проверить, пуста ли куча
    is_empty: bool = not max_heap
    print(f"\nПуста ли куча: {is_empty}")

    # Построить кучу по входному списку
    # Временная сложность — O(n), а не O(nlogn)
    min_heap = [1, 3, 2, 5, 4]
    heapq.heapify(min_heap)
    print("\nМин-куча, построенная по входному списку:")
    print_heap(min_heap)
