"""
File: linkedlist_deque.py
Created Time: 2023-03-01
Author: krahets (krahets@163.com)
"""


class ListNode:
    """Узел двусвязного списка"""

    def __init__(self, val: int):
        """Конструктор"""
        self.val: int = val
        self.next: ListNode | None = None  # Ссылка на следующий узел
        self.prev: ListNode | None = None  # Ссылка на предыдущий узел


class LinkedListDeque:
    """Двусторонняя очередь на основе двусвязного списка"""

    def __init__(self):
        """Конструктор"""
        self._front: ListNode | None = None  # Головной узел front
        self._rear: ListNode | None = None  # Хвостовой узел rear
        self._size: int = 0  # Длина двусторонней очереди

    def size(self) -> int:
        """Получить длину двусторонней очереди"""
        return self._size

    def is_empty(self) -> bool:
        """Проверить, пуста ли двусторонняя очередь"""
        return self._size == 0

    def push(self, num: int, is_front: bool):
        """Операция помещения в очередь"""
        node = ListNode(num)
        # Если связный список пуст, сделать так, чтобы и front, и rear указывали на node
        if self.is_empty():
            self._front = self._rear = node
        # Операция помещения в голову очереди
        elif is_front:
            # Добавить node в голову связного списка
            self._front.prev = node
            node.next = self._front
            self._front = node  # Обновить головной узел
        # Операция помещения в хвост очереди
        else:
            # Добавить node в хвост связного списка
            self._rear.next = node
            node.prev = self._rear
            self._rear = node  # Обновить хвостовой узел
        self._size += 1  # Обновить длину очереди

    def push_first(self, num: int):
        """Поместить в голову очереди"""
        self.push(num, True)

    def push_last(self, num: int):
        """Поместить в хвост очереди"""
        self.push(num, False)

    def pop(self, is_front: bool) -> int:
        """Операция извлечения из очереди"""
        if self.is_empty():
            raise IndexError("Двусторонняя очередь пуста")
        # Операция извлечения из головы очереди
        if is_front:
            val: int = self._front.val  # Временно сохранить значение головного узла
            # Удалить головной узел
            fnext: ListNode | None = self._front.next
            if fnext is not None:
                fnext.prev = None
                self._front.next = None
            self._front = fnext  # Обновить головной узел
        # Операция извлечения из хвоста очереди
        else:
            val: int = self._rear.val  # Временно сохранить значение хвостового узла
            # Удалить хвостовой узел
            rprev: ListNode | None = self._rear.prev
            if rprev is not None:
                rprev.next = None
                self._rear.prev = None
            self._rear = rprev  # Обновить хвостовой узел
        self._size -= 1  # Обновить длину очереди
        return val

    def pop_first(self) -> int:
        """Извлечь из головы очереди"""
        return self.pop(True)

    def pop_last(self) -> int:
        """Извлечь из хвоста очереди"""
        return self.pop(False)

    def peek_first(self) -> int:
        """Получить элемент в начале очереди"""
        if self.is_empty():
            raise IndexError("Двусторонняя очередь пуста")
        return self._front.val

    def peek_last(self) -> int:
        """Обратиться к элементу в хвосте очереди"""
        if self.is_empty():
            raise IndexError("Двусторонняя очередь пуста")
        return self._rear.val

    def to_array(self) -> list[int]:
        """Вернуть массив для печати"""
        node = self._front
        res = [0] * self.size()
        for i in range(self.size()):
            res[i] = node.val
            node = node.next
        return res


"""Driver Code"""
if __name__ == "__main__":
    # Инициализировать двустороннюю очередь
    deque = LinkedListDeque()
    deque.push_last(3)
    deque.push_last(2)
    deque.push_last(5)
    print("Двусторонняя очередь deque =", deque.to_array())

    # Получить доступ к элементу
    peek_first: int = deque.peek_first()
    print("Элемент в начале очереди peek_first =", peek_first)
    peek_last: int = deque.peek_last()
    print("Элемент в конце очереди peek_last =", peek_last)

    # Поместить элемент в очередь
    deque.push_last(4)
    print("После добавления элемента 4 в конец deque =", deque.to_array())
    deque.push_first(1)
    print("После добавления элемента 1 в начало deque =", deque.to_array())

    # Извлечь элемент из очереди
    pop_last: int = deque.pop_last()
    print("Элемент, извлеченный с конца =", pop_last, ", после извлечения с конца deque =", deque.to_array())
    pop_first: int = deque.pop_first()
    print("Элемент, извлеченный с начала =", pop_first, ", после извлечения с начала deque =", deque.to_array())

    # Получить длину двусторонней очереди
    size: int = deque.size()
    print("Длина двусторонней очереди size =", size)

    # Проверить, пуста ли двусторонняя очередь
    is_empty: bool = deque.is_empty()
    print("Пуста ли двусторонняя очередь =", is_empty)
