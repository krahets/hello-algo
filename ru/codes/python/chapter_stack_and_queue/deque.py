"""
File: deque.py
Created Time: 2022-11-29
Author: Peng Chen (pengchzn@gmail.com)
"""

from collections import deque

"""Driver Code"""
if __name__ == "__main__":
    # Инициализировать дек
    deq: deque[int] = deque()

    # Добавить элементы в дек
    deq.append(2)  # Добавить в конец дека
    deq.append(5)
    deq.append(4)
    deq.appendleft(3)  # Добавить в начало дека
    deq.appendleft(1)
    print("Дек deque =", deq)

    # Посмотреть первый и последний элементы
    front: int = deq[0]  # Первый элемент дека
    print("Первый элемент дека front =", front)
    rear: int = deq[-1]  # Последний элемент дека
    print("Последний элемент дека rear =", rear)

    # Извлечь элементы из дека
    pop_front: int = deq.popleft()  # Извлечь элемент из начала дека
    print("Извлечённый первый элемент  pop_front =", pop_front)
    print("После извлечения из начала deque =", deq)
    pop_rear: int = deq.pop()  # Извлечь элемент из конца дека
    print("Извлечённый последний элемент  pop_rear =", pop_rear)
    print("После извлечения из конца deque =", deq)

    # Получить длину дека
    size: int = len(deq)
    print("Длина дека size =", size)

    # Проверить, пуст ли дек
    is_empty: bool = len(deq) == 0
    print("Дек пуст =", is_empty)
