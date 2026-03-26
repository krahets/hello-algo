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
        """Получить длину стека"""
        return self._size

    def is_empty(self) -> bool:
        """Проверить, пуст ли стек"""
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
        """Получить верхний элемент стека"""
        if self.is_empty():
            raise IndexError("Стек пуст")
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
    # Инициализировать стек
    stack = LinkedListStack()

    # Поместить элемент в стек
    stack.push(1)
    stack.push(3)
    stack.push(2)
    stack.push(5)
    stack.push(4)
    print("Стек stack =", stack.to_list())

    # Получить верхний элемент стека
    peek: int = stack.peek()
    print("Верхний элемент стека peek =", peek)

    # Извлечь элемент из стека
    pop: int = stack.pop()
    print("Извлеченный из стека элемент pop =", pop)
    print("После извлечения stack =", stack.to_list())

    # Получить длину стека
    size: int = stack.size()
    print("Длина стека size =", size)

    # Проверить, пуста ли структура
    is_empty: bool = stack.is_empty()
    print("Пуст ли стек =", is_empty)
