"""
File: queue.py
Created Time: 2022-11-29
Author: Peng Chen (pengchzn@gmail.com)
"""

from collections import deque

"""Driver Code"""
if __name__ == "__main__":
    # Инициализировать очередь
    # В Python двустороннюю очередь deque обычно используют как очередь
    # Хотя queue.Queue() является настоящим классом очереди, пользоваться им не слишком удобно
    que: deque[int] = deque()

    # Поместить элемент в очередь
    que.append(1)
    que.append(3)
    que.append(2)
    que.append(5)
    que.append(4)
    print("очередь que =", que)

    # Получить элемент в начале очереди
    front: int = que[0]
    print("Элемент в начале очереди front =", front)

    # Извлечь элемент из очереди
    pop: int = que.popleft()
    print("Извлеченный из очереди элемент pop =", pop)
    print("que после извлечения = ", que)

    # Получить длину очереди
    size: int = len(que)
    print("Длина очереди size =", size)

    # Проверить, пуста ли очередь
    is_empty: bool = len(que) == 0
    print("Пуста ли очередь =", is_empty)
