"""
File: deque.py
Created Time: 2022-11-29
Author: Peng Chen (pengchzn@gmail.com)
"""

from collections import deque

"""Driver Code"""
if __name__ == "__main__":
    # Инициализировать двустороннюю очередь
    deq: deque[int] = deque()

    # Поместить элемент в очередь
    deq.append(2)  # Добавить в хвост очереди
    deq.append(5)
    deq.append(4)
    deq.appendleft(3)  # Добавить в голову очереди
    deq.appendleft(1)
    print("двусторонняя очередь deque =", deq)

    # Получить доступ к элементу
    front: int = deq[0]  # элемент в голове очереди
    print("Элемент в начале очереди front =", front)
    rear: int = deq[-1]  # элемент в хвосте очереди
    print("элемент в хвосте очереди rear =", rear)

    # Извлечь элемент из очереди
    pop_front: int = deq.popleft()  # голова очередиИзвлечь элемент из очереди
    print("Элемент, извлеченный из головы очереди, pop_front =", pop_front)
    print("deque после извлечения из головы =", deq)
    pop_rear: int = deq.pop()  # хвост очередиИзвлечь элемент из очереди
    print("Элемент, извлеченный из хвоста очереди, pop_rear =", pop_rear)
    print("deque после извлечения из хвоста =", deq)

    # Получить длину двусторонней очереди
    size: int = len(deq)
    print("Длина двусторонней очереди size =", size)

    # Проверить, пуста ли двусторонняя очередь
    is_empty: bool = len(deq) == 0
    print("Пуста ли двусторонняя очередь =", is_empty)
