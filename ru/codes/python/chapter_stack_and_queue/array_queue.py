"""
File: array_queue.py
Created Time: 2022-12-01
Author: Peng Chen (pengchzn@gmail.com)
"""


class ArrayQueue:
    """Очередь на основе кольцевого массива"""

    def __init__(self, size: int):
        """Конструктор"""
        self._nums: list[int] = [0] * size  # Массив для хранения элементов очереди
        self._front: int = 0  # Индекс первого элемента очереди
        self._size: int = 0  # Длина очереди

    def capacity(self) -> int:
        """Получить ёмкость очереди"""
        return len(self._nums)

    def size(self) -> int:
        """Получить длину очереди"""
        return self._size

    def is_empty(self) -> bool:
        """Проверить, пуста ли очередь"""
        return self._size == 0

    def push(self, num: int):
        """Добавить элемент в очередь"""
        if self._size == self.capacity():
            raise IndexError("Очередь заполнена")
        # Вычислить индекс вставки в конец очереди: прибавить 1 к индексу последнего элемента с учётом перехода по кругу
        # При выходе за конец массива операция взятия остатка возвращает rear в начало
        rear: int = (self._front + self._size) % self.capacity()
        # Добавить num в конец очереди
        self._nums[rear] = num
        self._size += 1

    def pop(self) -> int:
        """Извлечь элемент из очереди"""
        num: int = self.peek()
        # Сдвинуть индекс начала очереди на одну позицию вперёд. При выходе за конец массива перейти к его началу
        self._front = (self._front + 1) % self.capacity()
        self._size -= 1
        return num

    def peek(self) -> int:
        """Посмотреть первый элемент очереди"""
        if self.is_empty():
            raise IndexError("Очередь пуста")
        return self._nums[self._front]

    def to_list(self) -> list[int]:
        """Вернуть список для вывода"""
        res = [0] * self.size()
        j: int = self._front
        for i in range(self.size()):
            res[i] = self._nums[(j % self.capacity())]
            j += 1
        return res


"""Driver Code"""
if __name__ == "__main__":
    # Инициализировать очередь
    queue = ArrayQueue(10)

    # Добавить элементы в очередь
    queue.push(1)
    queue.push(3)
    queue.push(2)
    queue.push(5)
    queue.push(4)
    print("Очередь queue =", queue.to_list())

    # Посмотреть первый элемент очереди
    peek: int = queue.peek()
    print("Первый элемент очереди peek =", peek)

    # Извлечь элемент из очереди
    pop: int = queue.pop()
    print("Извлечённый элемент pop =", pop)
    print("После извлечения queue =", queue.to_list())

    # Получить длину очереди
    size: int = queue.size()
    print("Длина очереди size =", size)

    # Проверить, пуста ли очередь
    is_empty: bool = queue.is_empty()
    print("Очередь пуста =", is_empty)

    # Проверить работу кольцевого массива
    for i in range(10):
        queue.push(i)
        queue.pop()
        print("В цикле", i, "после добавления и извлечения элемента queue = ", queue.to_list())
