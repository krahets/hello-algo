"""
File: queue.py
Created Time: 2022-11-29
Author: Peng Chen (pengchzn@gmail.com)
"""

from collections import deque

"""Driver Code"""
if __name__ == "__main__":
    # Инициализировать очередь
    # В Python мы обычно рассматриваем двустороннюю очередь deque как очередь
    # Хотя queue.Queue() — это «настоящий» класс очереди, им не очень удобно пользоваться
    que: deque[int] = deque()

    # Добавление элемента в очередь
    que.append(1)
    que.append(3)
    que.append(2)
    que.append(5)
    que.append(4)
    print("Очередь que =", que)

    # Доступ к элементу в начале очереди
    front: int = que[0]
    print("Первый элемент front =", front)

    # Извлечение элемента из очереди
    pop: int = que.popleft()
    print("Извлеченный элемент pop =", pop)
    print("que после извлечения =", que)

    # Получение длины очереди
    size: int = len(que)
    print("Длина очереди size =", size)

    # Проверка, пуста ли очередь
    is_empty: bool = len(que) == 0
    print("Пуста ли очередь =", is_empty)
