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
        """Получение длины стека"""
        return len(self._stack)

    def is_empty(self) -> bool:
        """Проверка, пуст ли стек"""
        return self.size() == 0

    def push(self, item: int):
        """Поместить в стек"""
        self._stack.append(item)

    def pop(self) -> int:
        """Извлечь из стека"""
        if self.is_empty():
            raise IndexError("стек пуст")
        return self._stack.pop()

    def peek(self) -> int:
        """Доступ к верхнему элементу стека"""
        if self.is_empty():
            raise IndexError("стек пуст")
        return self._stack[-1]

    def to_list(self) -> list[int]:
        """Вернуть список для вывода"""
        return self._stack


"""Driver Code"""
if __name__ == "__main__":
    # Инициализация стека
    stack = ArrayStack()

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
