"""
File: array_stack.py
Created Time: 2022-11-29
Author: Peng Chen (pengchzn@gmail.com)
"""


class ArrayStack:
    """Стек на основе массива"""

    def __init__(self):
        """Конструктор"""
        self._stack: list[int] = []

    def size(self) -> int:
        """Получить размер стека"""
        return len(self._stack)

    def is_empty(self) -> bool:
        """Проверить, пуст ли стек"""
        return self.size() == 0

    def push(self, item: int):
        """Поместить элемент в стек"""
        self._stack.append(item)

    def pop(self) -> int:
        """Снять элемент со стека"""
        if self.is_empty():
            raise IndexError("Стек пуст")
        return self._stack.pop()

    def peek(self) -> int:
        """Посмотреть элемент на вершине стека"""
        if self.is_empty():
            raise IndexError("Стек пуст")
        return self._stack[-1]

    def to_list(self) -> list[int]:
        """Вернуть список для вывода"""
        return self._stack


"""Driver Code"""
if __name__ == "__main__":
    # Инициализировать стек
    stack = ArrayStack()

    # Поместить элементы в стек
    stack.push(1)
    stack.push(3)
    stack.push(2)
    stack.push(5)
    stack.push(4)
    print("Стек stack =", stack.to_list())

    # Посмотреть элемент на вершине стека
    peek: int = stack.peek()
    print("Элемент на вершине стека peek =", peek)

    # Снять элемент со стека
    pop: int = stack.pop()
    print("Снятый элемент pop =", pop)
    print("После снятия элемента stack =", stack.to_list())

    # Получить размер стека
    size: int = stack.size()
    print("Размер стека size =", size)

    # Проверить, пуст ли стек
    is_empty: bool = stack.is_empty()
    print("Стек пуст =", is_empty)
