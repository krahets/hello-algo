"""
File: linkedlist_stack.py
Created Time: 2022-11-29
Author: Peng Chen (pengchzn@gmail.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from modules import ListNode


class LinkedListStack:
    """Стек на основе связного списка"""

    def __init__(self):
        """Конструктор"""
        self._peek: ListNode | None = None
        self._size: int = 0

    def size(self) -> int:
        """Получение длины стека"""
        return self._size

    def is_empty(self) -> bool:
        """Проверка, пуст ли стек"""
        return self._size == 0

    def push(self, val: int):
        """Поместить в стек"""
        node = ListNode(val)
        node.next = self._peek
        self._peek = node
        self._size += 1

    def pop(self) -> int:
        """Извлечь из стека"""
        num = self.peek()
        self._peek = self._peek.next
        self._size -= 1
        return num

    def peek(self) -> int:
        """Доступ к верхнему элементу стека"""
        if self.is_empty():
            raise IndexError("стек пуст")
        return self._peek.val

    def to_list(self) -> list[int]:
        """Преобразовать в список для вывода"""
        arr = []
        node = self._peek
        while node:
            arr.append(node.val)
            node = node.next
        arr.reverse()
        return arr


"""Driver Code"""
if __name__ == "__main__":
    # Инициализация стека
    stack = LinkedListStack()

    # Помещение элемента в стек
    stack.push(1)
    stack.push(3)
    stack.push(2)
    stack.push(5)
    stack.push(4)
    print("Стек stack =", stack.to_list())

    # Доступ к верхнему элементу стека
    peek: int = stack.peek()
    print("Верхний элемент peek =", peek)

    # Извлечение элемента из стека
    pop: int = stack.pop()
    print("Извлеченный элемент pop =", pop)
    print("stack после извлечения =", stack.to_list())

    # Получение длины стека
    size: int = stack.size()
    print("Длина стека size =", size)

    # Проверка на пустоту
    is_empty: bool = stack.is_empty()
    print("Пуст ли стек =", is_empty)
