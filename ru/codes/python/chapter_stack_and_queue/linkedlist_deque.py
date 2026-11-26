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
    """Двусторонняя очередь (дек) на основе двусвязного списка"""

    def __init__(self):
        """Конструктор"""
        self._front: ListNode | None = None  # Первый узел front
        self._rear: ListNode | None = None  # Последний узел rear
        self._size: int = 0  # Длина дека

    def size(self) -> int:
        """Получить длину дека"""
        return self._size

    def is_empty(self) -> bool:
        """Проверить, пуст ли дек"""
        return self._size == 0

    def push(self, num: int, is_front: bool):
        """Добавить элемент в дек"""
        node = ListNode(num)
        # Если связный список пуст, установить front и rear так, чтобы они указывали на node
        if self.is_empty():
            self._front = self._rear = node
        # Добавить элемент в начало дека
        elif is_front:
            # Добавить node в начало связного списка
            self._front.prev = node
            node.next = self._front
            self._front = node  # Обновить ссылку на первый узел
        # Добавить элемент в конец дека
        else:
            # Добавить node в конец связного списка
            self._rear.next = node
            node.prev = self._rear
            self._rear = node  # Обновить ссылку на последний узел
        self._size += 1  # Обновить длину дека

    def push_first(self, num: int):
        """Добавить элемент в начало дека"""
        self.push(num, True)

    def push_last(self, num: int):
        """Добавить элемент в конец дека"""
        self.push(num, False)

    def pop(self, is_front: bool) -> int:
        """Извлечь элемент из дека"""
        if self.is_empty():
            raise IndexError("Дек пуст")
        # Если длина дека равна 1, ссылки на первый и последний узлы указывают на один и тот же узел
        if self._size == 1:
            val: int = self._front.val
            self._front = None
            self._rear = None
        # Извлечь элемент из начала дека
        elif is_front:
            val: int = self._front.val  # Временно сохранить значение первого узла
            # Удалить первый узел
            fnext: ListNode | None = self._front.next
            fnext.prev = None
            self._front.next = None
            self._front = fnext  # Обновить ссылку на первый узел
        # Извлечь элемент из конца дека
        else:
            val: int = self._rear.val  # Временно сохранить значение последнего узла
            # Удалить последний узел
            rprev: ListNode | None = self._rear.prev
            rprev.next = None
            self._rear.prev = None
            self._rear = rprev  # Обновить ссылку на последний узел
        self._size -= 1  # Обновить длину дека
        return val

    def pop_first(self) -> int:
        """Извлечь элемент из начала дека"""
        return self.pop(True)

    def pop_last(self) -> int:
        """Извлечь элемент из конца дека"""
        return self.pop(False)

    def peek_first(self) -> int:
        """Посмотреть первый элемент дека"""
        if self.is_empty():
            raise IndexError("Дек пуст")
        return self._front.val

    def peek_last(self) -> int:
        """Посмотреть последний элемент дека"""
        if self.is_empty():
            raise IndexError("Дек пуст")
        return self._rear.val

    def to_array(self) -> list[int]:
        """Вернуть список для вывода"""
        node = self._front
        res = [0] * self.size()
        for i in range(self.size()):
            res[i] = node.val
            node = node.next
        return res


"""Driver Code"""
if __name__ == "__main__":
    # Инициализировать дек
    deque = LinkedListDeque()
    deque.push_last(3)
    deque.push_last(2)
    deque.push_last(5)
    print("Дек deque =", deque.to_array())

    # Посмотреть первый и последний элементы
    peek_first: int = deque.peek_first()
    print("Первый элемент дека peek_first =", peek_first)
    peek_last: int = deque.peek_last()
    print("Последний элемент дека peek_last =", peek_last)

    # Добавить элементы в дек
    deque.push_last(4)
    print("После добавления 4 в конец дека deque =", deque.to_array())
    deque.push_first(1)
    print("После добавления 1 в начало дека deque =", deque.to_array())

    # Извлечь элементы из дека
    pop_last: int = deque.pop_last()
    print("Извлечённый последний элемент =", pop_last, "— после извлечения из конца deque =", deque.to_array())
    pop_first: int = deque.pop_first()
    print("Извлечённый первый элемент =", pop_first, "— после извлечения из начала deque =", deque.to_array())

    # Получить длину дека
    size: int = deque.size()
    print("Длина дека size =", size)

    # Проверить, пуст ли дек
    is_empty: bool = deque.is_empty()
    print("Дек пуст =", is_empty)
