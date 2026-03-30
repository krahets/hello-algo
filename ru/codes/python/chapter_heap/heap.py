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
    heapq.heappush(heap, flag * val)  # Добавление элемента в кучу
    print(f"\nПосле добавления элемента {val} в кучу")
    print_heap([flag * val for val in heap])


def test_pop(heap: list, flag: int = 1):
    val = flag * heapq.heappop(heap)  # Извлечение элемента с вершины кучи
    print(f"\nПосле извлечения элемента вершины кучи {val}")
    print_heap([flag * val for val in heap])


"""Driver Code"""
if __name__ == "__main__":
    # Инициализация минимальной кучи
    min_heap, flag = [], 1
    # Инициализация максимальной кучи
    max_heap, flag = [], -1

    print("\nНиже приведен тестовый пример для max-heap")
    # Модуль heapq в Python по умолчанию реализует минимальную кучу
    # Можно помещать в кучу отрицательные элементы, чтобы инвертировать отношение порядка и таким образом реализовать максимальную кучу
    # В этом примере flag = 1 соответствует минимальной куче, а flag = -1 — максимальной куче

    # Добавление элемента в кучу
    test_push(max_heap, 1, flag)
    test_push(max_heap, 3, flag)
    test_push(max_heap, 2, flag)
    test_push(max_heap, 5, flag)
    test_push(max_heap, 4, flag)

    # Получение элемента с вершины кучи
    peek: int = flag * max_heap[0]
    print(f"\nЭлемент на вершине кучи = {peek}")

    # Извлечение элемента с вершины кучи
    test_pop(max_heap, flag)
    test_pop(max_heap, flag)
    test_pop(max_heap, flag)
    test_pop(max_heap, flag)
    test_pop(max_heap, flag)

    # Получение размера кучи
    size: int = len(max_heap)
    print(f"\nКоличество элементов в куче = {size}")

    # Проверка, пуста ли куча
    is_empty: bool = not max_heap
    print(f"\nПуста ли куча: {is_empty}")

    # Создать кучу по входному списку
    # Временная сложность равна O(n), а не O(nlogn)
    min_heap = [1, 3, 2, 5, 4]
    heapq.heapify(min_heap)
    print("\nПосле построения min-heap из входного списка")
    print_heap(min_heap)
