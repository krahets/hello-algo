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
        self._front: int = 0  # Указатель head, указывающий на первый элемент очереди
        self._size: int = 0  # Длина очереди

    def capacity(self) -> int:
        """Получить вместимость очереди"""
        return len(self._nums)

    def size(self) -> int:
        """Получение длины очереди"""
        return self._size

    def is_empty(self) -> bool:
        """Проверка, пуста ли очередь"""
        return self._size == 0

    def push(self, num: int):
        """Поместить в очередь"""
        if self._size == self.capacity():
            raise IndexError("очередь заполнена")
        # Вычислить указатель хвоста, указывающий на индекс хвоста + 1
        # С помощью операции взятия по модулю вернуть rear к началу после выхода за конец массива
        rear: int = (self._front + self._size) % self.capacity()
        # Добавить num в хвост очереди
        self._nums[rear] = num
        self._size += 1

    def pop(self) -> int:
        """Извлечь из очереди"""
        num: int = self.peek()
        # Указатель head сдвигается на одну позицию назад; если он выходит за конец, то возвращается в начало массива
        self._front = (self._front + 1) % self.capacity()
        self._size -= 1
        return num

    def peek(self) -> int:
        """Доступ к элементу в начале очереди"""
        if self.is_empty():
            raise IndexError("очередь пуста")
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
    # Инициализация очереди
    queue = ArrayQueue(10)

    # Добавление элемента в очередь
    queue.push(1)
    queue.push(3)
    queue.push(2)
    queue.push(5)
    queue.push(4)
    print("Очередь queue =", queue.to_list())

    # Доступ к элементу в начале очереди
    peek: int = queue.peek()
    print("Первый элемент peek =", peek)

    # Извлечение элемента из очереди
    pop: int = queue.pop()
    print("Извлеченный элемент pop =", pop)
    print("queue после извлечения =", queue.to_list())

    # Получение длины очереди
    size: int = queue.size()
    print("Длина очереди size =", size)

    # Проверка, пуста ли очередь
    is_empty: bool = queue.is_empty()
    print("Пуста ли очередь =", is_empty)

    # Проверка кольцевого массива
    for i in range(10):
        queue.push(i)
        queue.pop()
        print("После", i, "-го раунда операций enqueue и dequeue queue =", queue.to_list())
