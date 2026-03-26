"""
File: my_list.py
Created Time: 2022-11-25
Author: krahets (krahets@163.com)
"""


class MyList:
    """Класс списка"""

    def __init__(self):
        """Конструктор"""
        self._capacity: int = 10  # Вместимость списка
        self._arr: list[int] = [0] * self._capacity  # Массив (хранит элементы списка)
        self._size: int = 0  # Длина списка (текущее количество элементов)
        self._extend_ratio: int = 2  # Коэффициент расширения списка при каждом увеличении

    def size(self) -> int:
        """Получить длину списка (текущее количество элементов)"""
        return self._size

    def capacity(self) -> int:
        """Получить вместимость списка"""
        return self._capacity

    def get(self, index: int) -> int:
        """Получить доступ к элементу"""
        # Если индекс выходит за границы, выбросить исключение; далее аналогично
        if index < 0 or index >= self._size:
            raise IndexError("Индекс вне допустимого диапазона")
        return self._arr[index]

    def set(self, num: int, index: int):
        """Обновить элемент"""
        if index < 0 or index >= self._size:
            raise IndexError("Индекс вне допустимого диапазона")
        self._arr[index] = num

    def add(self, num: int):
        """Добавить элемент в конец"""
        # Если число элементов превышает вместимость, запустить механизм расширения
        if self.size() == self.capacity():
            self.extend_capacity()
        self._arr[self._size] = num
        self._size += 1

    def insert(self, num: int, index: int):
        """Вставить элемент в середину"""
        if index < 0 or index >= self._size:
            raise IndexError("Индекс вне допустимого диапазона")
        # Если число элементов превышает вместимость, запустить механизм расширения
        if self._size == self.capacity():
            self.extend_capacity()
        # Сдвинуть на одну позицию назад элемент с индексом index и все последующие элементы
        for j in range(self._size - 1, index - 1, -1):
            self._arr[j + 1] = self._arr[j]
        self._arr[index] = num
        # Обновить количество элементов
        self._size += 1

    def remove(self, index: int) -> int:
        """Удалить элемент"""
        if index < 0 or index >= self._size:
            raise IndexError("Индекс вне допустимого диапазона")
        num = self._arr[index]
        # Сдвинуть на одну позицию вперед все элементы после индекса index
        for j in range(index, self._size - 1):
            self._arr[j] = self._arr[j + 1]
        # Обновить количество элементов
        self._size -= 1
        # Вернуть удаленный элемент
        return num

    def extend_capacity(self):
        """Расширение списка"""
        # Создать новый массив длиной в _extend_ratio раз больше исходного массива и скопировать в него исходный массив
        self._arr = self._arr + [0] * self.capacity() * (self._extend_ratio - 1)
        # Обновить вместимость списка
        self._capacity = len(self._arr)

    def to_array(self) -> list[int]:
        """Вернуть список действительной длины"""
        return self._arr[: self._size]


"""Driver Code"""
if __name__ == "__main__":
    # Инициализировать список
    nums = MyList()
    # Добавить элемент в конец
    nums.add(1)
    nums.add(3)
    nums.add(2)
    nums.add(5)
    nums.add(4)
    print(f"список nums = {nums.to_array()}, вместимость = {nums.capacity()}, длина = {nums.size()}")

    # Вставить элемент в середину
    nums.insert(6, index=3)
    print("После вставки числа 6 по индексу 3 получаем nums =", nums.to_array())

    # Удалить элемент
    nums.remove(3)
    print("После удаления элемента по индексу 3 получаем nums =", nums.to_array())

    # Получить доступ к элементу
    num = nums.get(1)
    print("обратиться киндекс 1 поэлемент, получаем num =", num)

    # Обновить элемент
    nums.set(0, 1)
    print("После обновления элемента по индексу 1 на 0 получаем nums =", nums.to_array())

    # Проверить механизм расширения
    for i in range(10):
        # При i = 5 длина списка превысит его вместимость, и тогда сработает механизм расширения
        nums.add(i)
    print(f"Список после расширения {nums.to_array()}, вместимость = {nums.capacity()}, длина = {nums.size()}")
