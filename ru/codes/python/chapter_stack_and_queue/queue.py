"""
File: queue.py
Created Time: 2022-11-29
Author: Peng Chen (pengchzn@gmail.com)
"""

from collections import deque

"""Driver Code"""
if __name__ == "__main__":
    # Инициализировать очередь
    # В Python в качестве очереди обычно используют класс двусторонней очереди deque
    # Хотя queue.Queue() создаёт обычную очередь, с ней неудобно работать
    que: deque[int] = deque()

    # Добавить элементы в очередь
    que.append(1)
    que.append(3)
    que.append(2)
    que.append(5)
    que.append(4)
    print("Очередь que =", que)

    # Посмотреть первый элемент очереди
    front: int = que[0]
    print("Первый элемент очереди front =", front)

    # Извлечь элемент из очереди
    pop: int = que.popleft()
    print("Извлечённый элемент pop =", pop)
    print("После извлечения que =", que)

    # Получить длину очереди
    size: int = len(que)
    print("Длина очереди size =", size)

    # Проверить, пуста ли очередь
    is_empty: bool = len(que) == 0
    print("Очередь пуста =", is_empty)
