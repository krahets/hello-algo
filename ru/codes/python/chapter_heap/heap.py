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


"""Driver Code"""
if __name__ == "__main__":
    # [region]{init}
    # Инициализация минимальной кучи
    min_heap, flag = [], 1
    # Инициализация максимальной кучи
    max_heap, flag = [], -1

    # Модуль heapq в Python по умолчанию реализует минимальную кучу
    # Можно помещать в кучу отрицательные элементы, чтобы инвертировать отношение порядка и таким образом реализовать максимальную кучу
    # В этом примере flag = 1 соответствует минимальной куче, а flag = -1 — максимальной куче
    # [endregion]{init}
    print("\nНиже приведен тестовый пример для max-heap")

    # [region]{push}
    # Добавление элемента в кучу
    heapq.heappush(max_heap, flag * 1)
    heapq.heappush(max_heap, flag * 3)
    heapq.heappush(max_heap, flag * 2)
    heapq.heappush(max_heap, flag * 5)
    heapq.heappush(max_heap, flag * 4)
    # [endregion]{push}
    print_heap([flag * val for val in max_heap])

    # [region]{peek}
    # Получение элемента с вершины кучи
    peek: int = flag * max_heap[0]  # 5
    # [endregion]{peek}
    print(f"\nЭлемент на вершине кучи = {peek}")

    # [region]{pop_1}
    # Извлечение элемента с вершины кучи
    # Извлеченные элементы образуют последовательность по убыванию
    val = flag * heapq.heappop(max_heap)  # 5
    # [endregion]{pop_1}
    print(f"Извлеченный элемент = {val}")
    # [region]{pop_2}
    val = flag * heapq.heappop(max_heap)  # 4
    # [endregion]{pop_2}
    print(f"Извлеченный элемент = {val}")
    # [region]{pop_3}
    val = flag * heapq.heappop(max_heap)  # 3
    # [endregion]{pop_3}
    print(f"Извлеченный элемент = {val}")
    # [region]{pop_4}
    val = flag * heapq.heappop(max_heap)  # 2
    # [endregion]{pop_4}
    print(f"Извлеченный элемент = {val}")
    # [region]{pop_5}
    val = flag * heapq.heappop(max_heap)  # 1
    # [endregion]{pop_5}
    print(f"Извлеченный элемент = {val}")

    # [region]{size}
    # Получение размера кучи
    size: int = len(max_heap)
    # [endregion]{size}
    print(f"\nКоличество элементов в куче = {size}")

    # [region]{is_empty}
    # Проверка, пуста ли куча
    is_empty: bool = not max_heap
    # [endregion]{is_empty}
    print(f"\nПуста ли куча: {is_empty}")

    # [region]{heapify}
    # Создать кучу по входному списку
    # Временная сложность равна O(n), а не O(nlogn)
    min_heap: list[int] = [1, 3, 2, 5, 4]
    heapq.heapify(min_heap)
    # [endregion]{heapify}
    print("\nПосле построения min-heap из входного списка")
    print_heap(min_heap)
