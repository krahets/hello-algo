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
    """Max-куча"""

    def __init__(self, nums: list[int]):
        """Конструктор, создающий кучу по входному списку"""
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
        """Получить размер кучи"""
        return len(self.max_heap)

    def is_empty(self) -> bool:
        """Проверить, пуста ли куча"""
        return self.size() == 0

    def peek(self) -> int:
        """Обратиться к элементу на вершине кучи"""
        return self.max_heap[0]

    def push(self, val: int):
        """Добавить элемент в кучу"""
        # Добавить узел
        self.max_heap.append(val)
        # Выполнить heapify снизу вверх
        self.sift_up(self.size() - 1)

    def sift_up(self, i: int):
        """Начиная с узла i, выполнить просеивание снизу вверх"""
        while True:
            # Получить родительский узел для узла i
            p = self.parent(i)
            # Завершить просеивание, когда произошел выход за корень или узел не нуждается в исправлении
            if p < 0 or self.max_heap[i] <= self.max_heap[p]:
                break
            # Поменять местами два узла
            self.swap(i, p)
            # Циклически выполнять просеивание вверх
            i = p

    def pop(self) -> int:
        """Извлечение элемента из кучи"""
        # Обработка пустого случая
        if self.is_empty():
            raise IndexError("кучапуст")
        # Поменять местами корневой узел и крайний правый лист (первый и последний элементы)
        self.swap(0, self.size() - 1)
        # Удалить узел
        val = self.max_heap.pop()
        # Выполнить heapify сверху вниз
        self.sift_down(0)
        # Вернуть элемент на вершине кучи
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
            # Если узел i уже максимален или индексы l и r выходят за границы, дальнейшая heapify не требуется
            if ma == i:
                break
            # Поменять местами два узла
            self.swap(i, ma)
            # Циклически выполнять просеивание вниз
            i = ma

    def print(self):
        """Вывести кучу (в виде двоичного дерева)"""
        print_heap(self.max_heap)


"""Driver Code"""
if __name__ == "__main__":
    # Инициализировать max-кучу
    max_heap = MaxHeap([9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2])
    print("\nПосле построения кучи по входному списку")
    max_heap.print()

    # Получить верхний элемент кучи
    peek = max_heap.peek()
    print(f"\nВерхний элемент кучи равен {peek}")

    # Добавить элемент в кучу
    val = 7
    max_heap.push(val)
    print(f"\nПосле добавления элемента {val} в кучу")
    max_heap.print()

    # Извлечь верхний элемент из кучи
    peek = max_heap.pop()
    print(f"\nвершина кучиЭлемент {peek} после извлечения из кучи")
    max_heap.print()

    # Получить размер кучи
    size = max_heap.size()
    print(f"\nКоличество элементов в куче равно {size}")

    # Проверить, пуста ли куча
    is_empty = max_heap.is_empty()
    print(f"\nПуста ли куча: {is_empty}")
