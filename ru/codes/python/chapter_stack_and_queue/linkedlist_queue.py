"""
File: linkedlist_queue.py
Created Time: 2022-12-01
Author: Peng Chen (pengchzn@gmail.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from modules import ListNode


class LinkedListQueue:
    """Очередь на основе связного списка"""

    def __init__(self):
        """Конструктор"""
        self._front: ListNode | None = None  # Головной узел front
        self._rear: ListNode | None = None  # Хвостовой узел rear
        self._size: int = 0

    def size(self) -> int:
        """Получение длины очереди"""
        return self._size

    def is_empty(self) -> bool:
        """Проверка, пуста ли очередь"""
        return self._size == 0

    def push(self, num: int):
        """Поместить в очередь"""
        # Добавить num после хвостового узла
        node = ListNode(num)
        # Если очередь пуста, сделать так, чтобы и head, и tail указывали на этот узел
        if self._front is None:
            self._front = node
            self._rear = node
        # Если очередь не пуста, добавить этот узел после хвостового узла
        else:
            self._rear.next = node
            self._rear = node
        self._size += 1

    def pop(self) -> int:
        """Извлечь из очереди"""
        num = self.peek()
        # Удалить головной узел
        self._front = self._front.next
        self._size -= 1
        return num

    def peek(self) -> int:
        """Доступ к элементу в начале очереди"""
        if self.is_empty():
            raise IndexError("очередь пуста")
        return self._front.val

    def to_list(self) -> list[int]:
        """Преобразовать в список для вывода"""
        queue = []
        temp = self._front
        while temp:
            queue.append(temp.val)
            temp = temp.next
        return queue


"""Driver Code"""
if __name__ == "__main__":
    # Инициализация очереди
    queue = LinkedListQueue()

    # Добавление элемента в очередь
    queue.push(1)
    queue.push(3)
    queue.push(2)
    queue.push(5)
    queue.push(4)
    print("Очередь queue =", queue.to_list())

    # Доступ к элементу в начале очереди
    peek: int = queue.peek()
    print("Первый элемент front =", peek)

    # Извлечение элемента из очереди
    pop_front: int = queue.pop()
    print("Извлеченный элемент pop =", pop_front)
    print("queue после извлечения =", queue.to_list())

    # Получение длины очереди
    size: int = queue.size()
    print("Длина очереди size =", size)

    # Проверка, пуста ли очередь
    is_empty: bool = queue.is_empty()
    print("Пуста ли очередь =", is_empty)
