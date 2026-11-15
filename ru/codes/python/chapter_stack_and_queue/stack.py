"""
File: stack.py
Created Time: 2022-11-29
Author: Peng Chen (pengchzn@gmail.com)
"""

"""Driver Code"""
if __name__ == "__main__":
    # [region]{init_stack}
    # Инициализировать стек
    # В Python нет встроенного класса стека, поэтому list можно использовать как стек
    stack: list[int] = []
    # [endregion]{init_stack}

    # [region]{push}
    # Помещение элемента в стек
    stack.append(1)
    stack.append(3)
    stack.append(2)
    stack.append(5)
    stack.append(4)
    # [endregion]{push}
    print("Стек stack =", stack)

    # [region]{peek}
    # Доступ к верхнему элементу стека
    peek: int = stack[-1]
    # [endregion]{peek}
    print("Верхний элемент peek =", peek)

    # [region]{pop}
    # Извлечение элемента из стека
    pop: int = stack.pop()
    # [endregion]{pop}
    print("Извлеченный элемент pop =", pop)
    print("stack после извлечения =", stack)

    # [region]{size}
    # Получение длины стека
    size: int = len(stack)
    # [endregion]{size}
    print("Длина стека size =", size)

    # [region]{is_empty}
    # Проверка на пустоту
    is_empty: bool = len(stack) == 0
    # [endregion]{is_empty}
    print("Пуст ли стек =", is_empty)
