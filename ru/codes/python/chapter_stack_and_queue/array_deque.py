"""
File: array_deque.py
Created Time: 2023-03-01
Author: krahets (krahets@163.com)
"""


class ArrayDeque:
    """Двусторонняя очередь на основе кольцевого массива"""

    def __init__(self, capacity: int):
        """Конструктор"""
        self._nums: list[int] = [0] * capacity
        self._front: int = 0
        self._size: int = 0

    def capacity(self) -> int:
        """Получить вместимость двусторонней очереди"""
        return len(self._nums)

    def size(self) -> int:
        """Получение длины двусторонней очереди"""
        return self._size

    def is_empty(self) -> bool:
        """Проверка, пуста ли двусторонняя очередь"""
        return self._size == 0

    def index(self, i: int) -> int:
        """Вычислить индекс в кольцевом массиве"""
        # С помощью операции взятия по модулю соединить начало и конец массива
        # Когда i выходит за конец массива, он возвращается в начало
        # Когда i выходит за начало массива, он возвращается в конец
        return (i + self.capacity()) % self.capacity()

    def push_first(self, num: int):
        """Добавление в голову очереди"""
        if self._size == self.capacity():
            print("Двусторонняя очередь заполнена")
            return
        # Указатель головы сдвигается на одну позицию влево
        # С помощью операции взятия по модулю front после выхода за начало массива возвращается в хвост
        self._front = self.index(self._front - 1)
        # Добавить num в голову очереди
        self._nums[self._front] = num
        self._size += 1

    def push_last(self, num: int):
        """Добавление в хвост очереди"""
        if self._size == self.capacity():
            print("Двусторонняя очередь заполнена")
            return
        # Вычислить указатель хвоста, указывающий на индекс хвоста + 1
        rear = self.index(self._front + self._size)
        # Добавить num в хвост очереди
        self._nums[rear] = num
        self._size += 1

    def pop_first(self) -> int:
        """Извлечение из головы очереди"""
        num = self.peek_first()
        # Указатель головы сдвигается на одну позицию назад
        self._front = self.index(self._front + 1)
        self._size -= 1
        return num

    def pop_last(self) -> int:
        """Извлечение из хвоста очереди"""
        num = self.peek_last()
        self._size -= 1
        return num

    def peek_first(self) -> int:
        """Доступ к элементу в начале очереди"""
        if self.is_empty():
            raise IndexError("двусторонняя очередь пуста")
        return self._nums[self._front]

    def peek_last(self) -> int:
        """Доступ к элементу в конце очереди"""
        if self.is_empty():
            raise IndexError("двусторонняя очередь пуста")
        # Вычислить индекс хвостового элемента
        last = self.index(self._front + self._size - 1)
        return self._nums[last]

    def to_array(self) -> list[int]:
        """Вернуть массив для вывода"""
        # Преобразовывать только элементы списка в пределах фактической длины
        res = []
        for i in range(self._size):
            res.append(self._nums[self.index(self._front + i)])
        return res


"""Driver Code"""
if __name__ == "__main__":
    # Инициализация двусторонней очереди
    deque = ArrayDeque(10)
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
