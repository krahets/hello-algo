"""
File: my_heap.py
Created Time: 2023-02-23
Author: krahets (krahets@163.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from modules import print_heap


class MaxHeap:
    """Макс-куча"""

    def __init__(self, nums: list[int]):
        """Конструктор кучи по входному списку"""
        # Поместить элементы списка в кучу в прежнем порядке
        self.max_heap = nums
        # Выполнить просеивание для всех узлов, кроме листьев
        for i in range(self.parent(self.size() - 1), -1, -1):
            self.sift_down(i)

    def left(self, i: int) -> int:
        """Индекс левого ребёнка"""
        return 2 * i + 1

    def right(self, i: int) -> int:
        """Индекс правого ребёнка"""
        return 2 * i + 2

    def parent(self, i: int) -> int:
        """Индекс родителя"""
        return (i - 1) // 2  # Целочисленное деление с округлением вниз

    def swap(self, i: int, j: int):
        """Поменять элементы местами"""
        self.max_heap[i], self.max_heap[j] = self.max_heap[j], self.max_heap[i]

    def size(self) -> int:
        """Размер кучи"""
        return len(self.max_heap)

    def is_empty(self) -> bool:
        """Проверить, пуста ли куча"""
        return self.size() == 0

    def peek(self) -> int:
        """Посмотреть элемент в корне"""
        return self.max_heap[0]

    def push(self, val: int):
        """Вставить элемент в кучу"""
        # Добавить узел
        self.max_heap.append(val)
        # Просеивание вверх
        self.sift_up(self.size() - 1)

    def sift_up(self, i: int):
        """Просеивать вверх от узла i"""
        while True:
            # Найти родителя узла i
            p = self.parent(i)
            # Если вышли за корень или узел уже на своём месте, завершить просеивание
            if p < 0 or self.max_heap[i] <= self.max_heap[p]:
                break
            # Поменять два узла местами
            self.swap(i, p)
            # Продолжить просеивание вверх
            i = p

    def pop(self) -> int:
        """Извлечь элемент из кучи"""
        # Проверить, пуста ли куча
        if self.is_empty():
            raise IndexError("Куча пуста")
        # Поменять местами корень и крайний правый лист (первый и последний элементы)
        self.swap(0, self.size() - 1)
        # Удалить узел
        val = self.max_heap.pop()
        # Просеивание вниз
        self.sift_down(0)
        # Вернуть элемент из корня
        return val

    def sift_down(self, i: int):
        """Просеивать вниз от узла i"""
        while True:
            # Сохранить в ma индекс наибольшего из узлов i, l и r
            l, r, ma = self.left(i), self.right(i), i
            if l < self.size() and self.max_heap[l] > self.max_heap[ma]:
                ma = l
            if r < self.size() and self.max_heap[r] > self.max_heap[ma]:
                ma = r
            # Если i уже наибольший или оба индекса l и r вне диапазона, завершить просеивание
            if ma == i:
                break
            # Поменять два узла местами
            self.swap(i, ma)
            # Продолжить просеивание вниз
            i = ma

    def print(self):
        """Вывести кучу в виде бинарного дерева"""
        print_heap(self.max_heap)


"""Driver Code"""
if __name__ == "__main__":
    # Инициализировать макс-кучу
    max_heap = MaxHeap([9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2])
    print("\nКуча, построенная по входному списку:")
    max_heap.print()

    # Получить элемент в корне
    peek = max_heap.peek()
    print(f"\nЭлемент в корне: {peek}")

    # Вставить элемент в кучу
    val = 7
    max_heap.push(val)
    print(f"\nПосле вставки элемента {val}:")
    max_heap.print()

    # Извлечь элемент из корня
    peek = max_heap.pop()
    print(f"\nПосле извлечения элемента {peek} из корня:")
    max_heap.print()

    # Размер кучи
    size = max_heap.size()
    print(f"\nЧисло элементов в куче: {size}")

    # Проверить, пуста ли куча
    is_empty = max_heap.is_empty()
    print(f"\nПуста ли куча: {is_empty}")
