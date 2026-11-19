"""
File: deque.py
Created Time: 2022-11-29
Author: Peng Chen (pengchzn@gmail.com)
"""

# [region]{import_deque}
from collections import deque
# [endregion]{import_deque}

"""Driver Code"""
if __name__ == "__main__":
    # [region]{init_deque}
    # Инициализация двусторонней очереди
    deq: deque[int] = deque()
    # [endregion]{init_deque}

    # [region]{push}
    # Добавление элемента в очередь
    deq.append(2)  # Добавить в хвост очереди
    deq.append(5)
    deq.append(4)
    deq.appendleft(3)  # Добавить в голову очереди
    deq.appendleft(1)
    # [endregion]{push}
    print("Двусторонняя очередь deque =", deq)

    # [region]{peek_first}
    # Доступ к элементу
    front: int = deq[0]  # Элемент в голове очереди
    # [endregion]{peek_first}
    print("Первый элемент front =", front)
    # [region]{peek_last}
    rear: int = deq[-1]  # Элемент в хвосте очереди
    # [endregion]{peek_last}
    print("Последний элемент rear =", rear)

    # [region]{pop_first}
    # Извлечение элемента из очереди
    pop_front: int = deq.popleft()  # Извлечь элемент из головы очереди
    # [endregion]{pop_first}
    print("Извлеченный из головы элемент pop_front =", pop_front)
    print("deque после извлечения из головы =", deq)
    # [region]{pop_last}
    pop_rear: int = deq.pop()  # Извлечь элемент из хвоста очереди
    # [endregion]{pop_last}
    print("Извлеченный из хвоста элемент pop_rear =", pop_rear)
    print("deque после извлечения из хвоста =", deq)

    # [region]{size}
    # Получение длины двусторонней очереди
    size: int = len(deq)
    # [endregion]{size}
    print("Длина двусторонней очереди size =", size)

    # [region]{is_empty}
    # Проверка, пуста ли двусторонняя очередь
    is_empty: bool = len(deq) == 0
    # [endregion]{is_empty}
    print("Пуста ли двусторонняя очередь =", is_empty)
