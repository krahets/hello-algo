"""
File: stack.py
Created Time: 2022-11-29
Author: Peng Chen (pengchzn@gmail.com)
"""

"""Driver Code"""
if __name__ == "__main__":
    # Инициализировать стек
    # В Python нет встроенного класса стека, поэтому в качестве стека можно использовать list
    stack: list[int] = []

    # Поместить элементы в стек
    stack.append(1)
    stack.append(3)
    stack.append(2)
    stack.append(5)
    stack.append(4)
    print("Стек stack =", stack)

    # Посмотреть элемент на вершине стека
    peek: int = stack[-1]
    print("Элемент на вершине стека peek =", peek)

    # Снять элемент со стека
    pop: int = stack.pop()
    print("Снятый элемент pop =", pop)
    print("После снятия элемента stack =", stack)

    # Получить размер стека
    size: int = len(stack)
    print("Размер стека size =", size)

    # Проверить, пуст ли стек
    is_empty: bool = len(stack) == 0
    print("Стек пуст =", is_empty)
