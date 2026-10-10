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
    """Максимальная куча"""

    def __init__(self, nums: list[int]):
        """Конструктор, строящий кучу по входному списку"""
        # Добавить элементы списка в кучу без изменений
        self.max_heap = nums
        # Выполнить heapify для всех узлов, кроме листовых
        for i in range(self.parent(self.size() - 1), -1, -1):
            self.sift_down(i)

    def left(self, i: int) -> int:
        """Получить индекс левого дочернего узла"""
        return 2 * i + 1

    def right(self, i: int) -> int:
        """Получить индекс правого дочернего узла"""
        return 2 * i + 2

    def parent(self, i: int) -> int:
        """Получить индекс родительского узла"""
        return (i - 1) // 2  # Округление вниз при делении

    def swap(self, i: int, j: int):
        """Поменять элементы местами"""
        self.max_heap[i], self.max_heap[j] = self.max_heap[j], self.max_heap[i]

    def size(self) -> int:
        """Получение размера кучи"""
        return len(self.max_heap)

    def is_empty(self) -> bool:
        """Проверка, пуста ли куча"""
        return self.size() == 0

    def peek(self) -> int:
        """Доступ к элементу на вершине кучи"""
        return self.max_heap[0]

    def push(self, val: int):
        """Добавление элемента в кучу"""
        # Добавление узла
        self.max_heap.append(val)
        # Просеивание снизу вверх
        self.sift_up(self.size() - 1)

    def sift_up(self, i: int):
        """Начиная с узла i, выполнить просеивание снизу вверх"""
        while True:
            # Получение родительского узла для узла i
            p = self.parent(i)
            # Завершить heapify, когда «корневой узел уже пройден» или «узел не требует исправления»
            if p < 0 or self.max_heap[i] <= self.max_heap[p]:
                break
            # Поменять два узла местами
            self.swap(i, p)
            # Циклическое просеивание вверх
            i = p

    def pop(self) -> int:
        """Извлечение элемента из кучи"""
        # Обработка пустого случая
        if self.is_empty():
            raise IndexError("куча пуста")
        # Поменять корневой узел с самым правым листом местами (поменять первый и последний элементы)
        self.swap(0, self.size() - 1)
        # Удаление узла
        val = self.max_heap.pop()
        # Просеивание сверху вниз
        self.sift_down(0)
        # Вернуть элемент с вершины кучи
        return val

    def sift_down(self, i: int):
        """Начиная с узла i, выполнить просеивание сверху вниз"""
        while True:
            # Определить узел с максимальным значением среди i, l и r и обозначить его как ma
            l, r, ma = self.left(i), self.right(i), i
            if l < self.size() and self.max_heap[l] > self.max_heap[ma]:
                ma = l
            if r < self.size() and self.max_heap[r] > self.max_heap[ma]:
                ma = r
            # Если узел i уже максимален или индексы l и r вне границ, дальнейшее просеивание не требуется, выйти
            if ma == i:
                break
            # Поменять два узла местами
            self.swap(i, ma)
            # Циклическое просеивание вниз
            i = ma

    def print(self):
        """Вывести кучу (двоичное дерево)"""
        print_heap(self.max_heap)


"""Driver Code"""
if __name__ == "__main__":
    # Инициализация максимальной кучи
    max_heap = MaxHeap([9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2])
    print("\nПосле построения кучи из входного списка")
    max_heap.print()

    # Получение элемента с вершины кучи
    peek = max_heap.peek()
    print(f"\nЭлемент на вершине кучи = {peek}")

    # Добавление элемента в кучу
    val = 7
    max_heap.push(val)
    print(f"\nПосле добавления элемента {val} в кучу")
    max_heap.print()

    # Извлечение элемента с вершины кучи
    peek = max_heap.pop()
    print(f"\nПосле извлечения элемента вершины кучи {peek}")
    max_heap.print()

    # Получение размера кучи
    size = max_heap.size()
    print(f"\nКоличество элементов в куче = {size}")

    # Проверка, пуста ли куча
    is_empty = max_heap.is_empty()
    print(f"\nПуста ли куча: {is_empty}")
