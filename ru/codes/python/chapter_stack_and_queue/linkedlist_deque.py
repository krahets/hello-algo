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
        self.next: ListNode | None = None  # Ссылка на узел-преемник
        self.prev: ListNode | None = None  # Ссылка на узел-предшественник


class LinkedListDeque:
    """Двусторонняя очередь на основе двусвязного списка"""

    def __init__(self):
        """Конструктор"""
        self._front: ListNode | None = None  # Головной узел front
        self._rear: ListNode | None = None  # Хвостовой узел rear
        self._size: int = 0  # Длина двусторонней очереди

    def size(self) -> int:
        """Получение длины двусторонней очереди"""
        return self._size

    def is_empty(self) -> bool:
        """Проверка, пуста ли двусторонняя очередь"""
        return self._size == 0

    def push(self, num: int, is_front: bool):
        """Операция добавления в очередь"""
        node = ListNode(num)
        # Если связный список пуст, сделать так, чтобы и front, и rear указывали на node
        if self.is_empty():
            self._front = self._rear = node
        # Операция добавления в голову очереди
        elif is_front:
            # Добавить node в голову списка
            self._front.prev = node
            node.next = self._front
            self._front = node  # Обновить головной узел
        # Операция добавления в хвост очереди
        else:
            # Добавить node в хвост списка
            self._rear.next = node
            node.prev = self._rear
            self._rear = node  # Обновить хвостовой узел
        self._size += 1  # Обновить длину очереди

    def push_first(self, num: int):
        """Добавление в голову очереди"""
        self.push(num, True)

    def push_last(self, num: int):
        """Добавление в хвост очереди"""
        self.push(num, False)

    def pop(self, is_front: bool) -> int:
        """Операция извлечения из очереди"""
        if self.is_empty():
            raise IndexError("двусторонняя очередь пуста")
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
        """Извлечение из головы очереди"""
        return self.pop(True)

    def pop_last(self) -> int:
        """Извлечение из хвоста очереди"""
        return self.pop(False)

    def peek_first(self) -> int:
        """Доступ к элементу в начале очереди"""
        if self.is_empty():
            raise IndexError("двусторонняя очередь пуста")
        return self._front.val

    def peek_last(self) -> int:
        """Доступ к элементу в конце очереди"""
        if self.is_empty():
            raise IndexError("двусторонняя очередь пуста")
        return self._rear.val

    def to_array(self) -> list[int]:
        """Вернуть массив для вывода"""
        node = self._front
        res = [0] * self.size()
        for i in range(self.size()):
            res[i] = node.val
            node = node.next
        return res


"""Driver Code"""
if __name__ == "__main__":
    # Инициализация двусторонней очереди
    deque = LinkedListDeque()
    deque.push_last(3)
    deque.push_last(2)
    deque.push_last(5)
    print("Двусторонняя очередь deque =", deque.to_array())

    # Доступ к элементу
    peek_first: int = deque.peek_first()
    print("Первый элемент peek_first =", peek_first)
    peek_last: int = deque.peek_last()
    print("Последний элемент peek_last =", peek_last)

    # Добавление элемента в очередь
    deque.push_last(4)
    print("После добавления элемента 4 в хвост deque =", deque.to_array())
    deque.push_first(1)
    print("После добавления элемента 1 в голову deque =", deque.to_array())

    # Извлечение элемента из очереди
    pop_last: int = deque.pop_last()
    print("Извлеченный из хвоста элемент =", pop_last, ", deque после извлечения из хвоста =", deque.to_array())
    pop_first: int = deque.pop_first()
    print("Извлеченный из головы элемент =", pop_first, ", deque после извлечения из головы =", deque.to_array())

    # Получение длины двусторонней очереди
    size: int = deque.size()
    print("Длина двусторонней очереди size =", size)

    # Проверка, пуста ли двусторонняя очередь
    is_empty: bool = deque.is_empty()
    print("Пуста ли двусторонняя очередь =", is_empty)
