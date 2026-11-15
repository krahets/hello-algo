"""
File: deque.py
Created Time: 2022-11-29
Author: Peng Chen (pengchzn@gmail.com)
"""

from collections import deque

"""Driver Code"""
if __name__ == "__main__":
    # Инициализация двусторонней очереди
    deq: deque[int] = deque()

    # Добавление элемента в очередь
    deq.append(2)  # Добавить в хвост очереди
    deq.append(5)
    deq.append(4)
    deq.appendleft(3)  # Добавить в голову очереди
    deq.appendleft(1)
    print("Двусторонняя очередь deque =", deq)

    # Доступ к элементу
    front: int = deq[0]  # Элемент в голове очереди
    print("Первый элемент front =", front)
    rear: int = deq[-1]  # Элемент в хвосте очереди
    print("Последний элемент rear =", rear)

    # Извлечение элемента из очереди
    pop_front: int = deq.popleft()  # Извлечь элемент из головы очереди
    print("Извлеченный из головы элемент pop_front =", pop_front)
    print("deque после извлечения из головы =", deq)
    pop_rear: int = deq.pop()  # Извлечь элемент из хвоста очереди
    print("Извлеченный из хвоста элемент pop_rear =", pop_rear)
    print("deque после извлечения из хвоста =", deq)

    # Получение длины двусторонней очереди
    size: int = len(deq)
    print("Длина двусторонней очереди size =", size)

    # Проверка, пуста ли двусторонняя очередь
    is_empty: bool = len(deq) == 0
    print("Пуста ли двусторонняя очередь =", is_empty)
