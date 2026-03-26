"""
File: array_queue.py
Created Time: 2022-12-01
Author: Peng Chen (pengchzn@gmail.com)
"""


class ArrayQueue:
    """Очередь на основе циклического массива"""

    def __init__(self, size: int):
        """Конструктор"""
        self._nums: list[int] = [0] * size  # Массив для хранения элементов очереди
        self._front: int = 0  # Указатель front, указывающий на первый элемент очереди
        self._size: int = 0  # Длина очереди

    def capacity(self) -> int:
        """Получить вместимость очереди"""
        return len(self._nums)

    def size(self) -> int:
        """Получить длину очереди"""
        return self._size

    def is_empty(self) -> bool:
        """Проверить, пуста ли очередь"""
        return self._size == 0

    def push(self, num: int):
        """Поместить в очередь"""
        if self._size == self.capacity():
            raise IndexError("Очередь заполнена")
        # Вычислить указатель хвоста очереди, указывающий на индекс хвоста + 1
        # Операция взятия по модулю позволяет rear после выхода за конец массива вернуться к его началу
        rear: int = (self._front + self._size) % self.capacity()
        # Добавить num в конец очереди
        self._nums[rear] = num
        self._size += 1

    def pop(self) -> int:
        """Извлечь из очереди"""
        num: int = self.peek()
        # Указатель головы очереди сдвигается на одну позицию вперед; если он выходит за конец, то возвращается в начало массива
        self._front = (self._front + 1) % self.capacity()
        self._size -= 1
        return num

    def peek(self) -> int:
        """Получить элемент в начале очереди"""
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

    # Поместить элемент в очередь
    queue.push(1)
    queue.push(3)
    queue.push(2)
    queue.push(5)
    queue.push(4)
    print("Очередь queue =", queue.to_list())

    # Получить элемент в начале очереди
    peek: int = queue.peek()
    print("элемент в голове очереди peek =", peek)

    # Извлечь элемент из очереди
    pop: int = queue.pop()
    print("Извлеченный из очереди элемент pop =", pop)
    print("После извлечения queue =", queue.to_list())

    # Получить длину очереди
    size: int = queue.size()
    print("Длина очереди size =", size)

    # Проверить, пуста ли очередь
    is_empty: bool = queue.is_empty()
    print("Пуста ли очередь =", is_empty)

    # Проверить кольцевой массив
    for i in range(10):
        queue.push(i)
        queue.pop()
        print("После", i, "-й итерации enqueue + dequeue queue =", queue.to_list())
