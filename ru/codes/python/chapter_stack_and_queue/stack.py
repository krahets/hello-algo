"""
File: stack.py
Created Time: 2022-11-29
Author: Peng Chen (pengchzn@gmail.com)
"""

"""Driver Code"""
if __name__ == "__main__":
    # Инициализировать стек
    # В Python нет встроенного класса стека, поэтому list можно использовать как стек
    stack: list[int] = []

    # Поместить элемент в стек
    stack.append(1)
    stack.append(3)
    stack.append(2)
    stack.append(5)
    stack.append(4)
    print("Стек stack =", stack)

    # Получить верхний элемент стека
    peek: int = stack[-1]
    print("Верхний элемент стека peek =", peek)

    # Извлечь элемент из стека
    pop: int = stack.pop()
    print("Извлеченный из стека элемент pop =", pop)
    print("После извлечения stack =", stack)

    # Получить длину стека
    size: int = len(stack)
    print("Длина стека size =", size)

    # Проверить, пуста ли структура
    is_empty: bool = len(stack) == 0
    print("Пуст ли стек =", is_empty)
