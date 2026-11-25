"""
File: array_deque.py
Created Time: 2023-03-01
Author: krahets (krahets@163.com)
"""


class ArrayDeque:
    """Двусторонняя очередь (дек) на основе кольцевого массива"""

    def __init__(self, capacity: int):
        """Конструктор"""
        self._nums: list[int] = [0] * capacity
        self._front: int = 0
        self._size: int = 0

    def capacity(self) -> int:
        """Получить ёмкость дека"""
        return len(self._nums)

    def size(self) -> int:
        """Получить длину дека"""
        return self._size

    def is_empty(self) -> bool:
        """Проверить, пуст ли дек"""
        return self._size == 0

    def index(self, i: int) -> int:
        """Вычислить индекс в кольцевом массиве"""
        # Операция взятия остатка связывает конец массива с его началом
        # Если индекс i выходит за конец массива, отсчёт продолжается с начала
        # Если индекс i выходит за начало массива, отсчёт продолжается с конца
        return (i + self.capacity()) % self.capacity()

    def push_first(self, num: int):
        """Добавить элемент в начало дека"""
        if self._size == self.capacity():
            print("Дек заполнен")
            return
        # Сдвинуть индекс начала дека на одну позицию влево
        # При выходе за начало массива операция взятия остатка возвращает front в конец
        self._front = self.index(self._front - 1)
        # Добавить num в начало дека
        self._nums[self._front] = num
        self._size += 1

    def push_last(self, num: int):
        """Добавить элемент в конец дека"""
        if self._size == self.capacity():
            print("Дек заполнен")
            return
        # Вычислить индекс вставки в конец дека: прибавить 1 к индексу последнего элемента с учётом перехода по кругу
        rear = self.index(self._front + self._size)
        # Добавить num в конец дека
        self._nums[rear] = num
        self._size += 1

    def pop_first(self) -> int:
        """Извлечь элемент из начала дека"""
        num = self.peek_first()
        # Сдвинуть индекс начала дека на одну позицию вперёд
        self._front = self.index(self._front + 1)
        self._size -= 1
        return num

    def pop_last(self) -> int:
        """Извлечь элемент из конца дека"""
        num = self.peek_last()
        self._size -= 1
        return num

    def peek_first(self) -> int:
        """Посмотреть первый элемент дека"""
        if self.is_empty():
            raise IndexError("Дек пуст")
        return self._nums[self._front]

    def peek_last(self) -> int:
        """Посмотреть последний элемент дека"""
        if self.is_empty():
            raise IndexError("Дек пуст")
        # Вычислить индекс последнего элемента
        last = self.index(self._front + self._size - 1)
        return self._nums[last]

    def to_array(self) -> list[int]:
        """Вернуть список для вывода"""
        # Преобразовать только те элементы, которые сейчас находятся в деке
        res = []
        for i in range(self._size):
            res.append(self._nums[self.index(self._front + i)])
        return res


"""Driver Code"""
if __name__ == "__main__":
    # Инициализировать дек
    deque = ArrayDeque(10)
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
