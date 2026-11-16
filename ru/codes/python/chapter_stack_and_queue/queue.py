"""
File: queue.py
Created Time: 2022-11-29
Author: Peng Chen (pengchzn@gmail.com)
"""

# [region]{import_deque}
from collections import deque
# [endregion]{import_deque}

"""Driver Code"""
if __name__ == "__main__":
    # [region]{init_queue}
    # Инициализировать очередь
    # В Python мы обычно рассматриваем двустороннюю очередь deque как очередь
    # Хотя queue.Queue() — это «настоящий» класс очереди, им не очень удобно пользоваться, поэтому ее не рекомендуют
    que: deque[int] = deque()
    # [endregion]{init_queue}

    # [region]{push}
    # Добавление элемента в очередь
    que.append(1)
    que.append(3)
    que.append(2)
    que.append(5)
    que.append(4)
    # [endregion]{push}
    print("Очередь que =", que)

    # [region]{peek}
    # Доступ к элементу в начале очереди
    front: int = que[0]
    # [endregion]{peek}
    print("Первый элемент front =", front)

    # [region]{pop}
    # Извлечение элемента из очереди
    pop: int = que.popleft()
    # [endregion]{pop}
    print("Извлеченный элемент pop =", pop)
    print("que после извлечения =", que)

    # [region]{size}
    # Получение длины очереди
    size: int = len(que)
    # [endregion]{size}
    print("Длина очереди size =", size)

    # [region]{is_empty}
    # Проверка, пуста ли очередь
    is_empty: bool = len(que) == 0
    # [endregion]{is_empty}
    print("Пуста ли очередь =", is_empty)
