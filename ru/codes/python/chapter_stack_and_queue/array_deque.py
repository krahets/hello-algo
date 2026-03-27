"""
File: array_deque.py
Created Time: 2023-03-01
Author: krahets (krahets@163.com)
"""


class ArrayDeque:
    """Двусторонняя очередь на основе циклического массива"""

    def __init__(self, capacity: int):
        """Конструктор"""
        self._nums: list[int] = [0] * capacity
        self._front: int = 0
        self._size: int = 0

    def capacity(self) -> int:
        """Получить вместимость двусторонней очереди"""
        return len(self._nums)

    def size(self) -> int:
        """Получить длину двусторонней очереди"""
        return self._size

    def is_empty(self) -> bool:
        """Проверить, пуста ли двусторонняя очередь"""
        return self._size == 0

    def index(self, i: int) -> int:
        """Вычислить индекс циклического массива"""
        # Сделать начало и конец массива циклически связанными с помощью операции взятия по модулю
        # Когда i выходит за конец массива, он возвращается к началу
        # Когда i выходит за начало массива, он возвращается к концу
        return (i + self.capacity()) % self.capacity()

    def push_first(self, num: int):
        """Поместить в голову очереди"""
        if self._size == self.capacity():
            print("Двусторонняя очередь заполнена")
            return
        # Указатель головы очереди сдвигается на одну позицию влево
        # Операция взятия по модулю позволяет front после выхода за начало массива вернуться к его концу
        self._front = self.index(self._front - 1)
        # Добавить num в голову очереди
        self._nums[self._front] = num
        self._size += 1

    def push_last(self, num: int):
        """Поместить в хвост очереди"""
        if self._size == self.capacity():
            print("Двусторонняя очередь заполнена")
            return
        # Вычислить указатель хвоста, указывающий на индекс за последним элементом
        rear = self.index(self._front + self._size)
        # Добавить num в конец очереди
        self._nums[rear] = num
        self._size += 1

    def pop_first(self) -> int:
        """Извлечь из головы очереди"""
        num = self.peek_first()
        # Указатель головы очереди сдвигается на одну позицию вперед
        self._front = self.index(self._front + 1)
        self._size -= 1
        return num

    def pop_last(self) -> int:
        """Извлечь из хвоста очереди"""
        num = self.peek_last()
        self._size -= 1
        return num

    def peek_first(self) -> int:
        """Получить элемент в начале очереди"""
        if self.is_empty():
            raise IndexError("Двусторонняя очередь пуста")
        return self._nums[self._front]

    def peek_last(self) -> int:
        """Обратиться к элементу в хвосте очереди"""
        if self.is_empty():
            raise IndexError("Двусторонняя очередь пуста")
        # Вычислить индекс хвостового элемента
        last = self.index(self._front + self._size - 1)
        return self._nums[last]

    def to_array(self) -> list[int]:
        """Вернуть массив для печати"""
        # Преобразовать только элементы списка в пределах действительной длины
        res = []
        for i in range(self._size):
            res.append(self._nums[self.index(self._front + i)])
        return res


"""Driver Code"""
if __name__ == "__main__":
    # Инициализировать двустороннюю очередь
    deque = ArrayDeque(10)
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
    print("После помещения элемента 4 в хвост очереди deque =", deque.to_array())
    deque.push_first(1)
    print("После помещения элемента 1 в голову очереди deque =", deque.to_array())

    # Извлечь элемент из очереди
    pop_last: int = deque.pop_last()
    print("Элемент, извлеченный из хвоста очереди =", pop_last, ", deque после извлечения из хвоста =", deque.to_array())
    pop_first: int = deque.pop_first()
    print("Элемент, извлеченный из головы очереди =", pop_first, ", deque после извлечения из головы =", deque.to_array())

    # Получить длину двусторонней очереди
    size: int = deque.size()
    print("Длина двусторонней очереди size =", size)

    # Проверить, пуста ли двусторонняя очередь
    is_empty: bool = deque.is_empty()
    print("Пуста ли двусторонняя очередь =", is_empty)
