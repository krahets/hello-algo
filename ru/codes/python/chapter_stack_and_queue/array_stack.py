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
        """Получить длину стека"""
        return len(self._stack)

    def is_empty(self) -> bool:
        """Проверить, пуст ли стек"""
        return self.size() == 0

    def push(self, item: int):
        """Поместить в стек"""
        self._stack.append(item)

    def pop(self) -> int:
        """Извлечь из стека"""
        if self.is_empty():
            raise IndexError("Стек пуст")
        return self._stack.pop()

    def peek(self) -> int:
        """Получить верхний элемент стека"""
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
