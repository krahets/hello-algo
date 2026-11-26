"""
File: my_list.py
Created Time: 2022-11-25
Author: krahets (krahets@163.com)
"""


class MyList:
    """Класс списка"""

    def __init__(self):
        """Конструктор"""
        self._capacity: int = 10  # Ёмкость списка
        self._arr: list[int] = [0] * self._capacity  # Массив для хранения элементов списка
        self._size: int = 0  # Длина списка (текущее количество элементов)
        self._extend_ratio: int = 2  # Коэффициент увеличения ёмкости списка

    def size(self) -> int:
        """Получить длину списка (текущее количество элементов)"""
        return self._size

    def capacity(self) -> int:
        """Получить ёмкость списка"""
        return self._capacity

    def get(self, index: int) -> int:
        """Доступ к элементу"""
        # При выходе индекса за границы выбросить исключение. То же правило действует ниже
        if index < 0 or index >= self._size:
            raise IndexError("Индекс за пределами списка")
        return self._arr[index]

    def set(self, num: int, index: int):
        """Изменение элемента"""
        if index < 0 or index >= self._size:
            raise IndexError("Индекс за пределами списка")
        self._arr[index] = num

    def add(self, num: int):
        """Добавление элемента в конец"""
        # Если для элементов не хватает места, увеличить ёмкость
        if self.size() == self.capacity():
            self.extend_capacity()
        self._arr[self._size] = num
        self._size += 1

    def insert(self, num: int, index: int):
        """Вставка элемента в середину"""
        if index < 0 or index >= self._size:
            raise IndexError("Индекс за пределами списка")
        # Если для элементов не хватает места, увеличить ёмкость
        if self._size == self.capacity():
            self.extend_capacity()
        # Сдвинуть все элементы начиная с index на одну позицию вправо
        for j in range(self._size - 1, index - 1, -1):
            self._arr[j + 1] = self._arr[j]
        self._arr[index] = num
        # Обновить количество элементов
        self._size += 1

    def remove(self, index: int) -> int:
        """Удаление элемента"""
        if index < 0 or index >= self._size:
            raise IndexError("Индекс за пределами списка")
        num = self._arr[index]
        # Сдвинуть все элементы после index на одну позицию влево
        for j in range(index, self._size - 1):
            self._arr[j] = self._arr[j + 1]
        # Обновить количество элементов
        self._size -= 1
        # Вернуть удалённый элемент
        return num

    def extend_capacity(self):
        """Увеличение ёмкости списка"""
        # Создать массив в _extend_ratio раз длиннее исходного и скопировать в него исходный массив
        self._arr = self._arr + [0] * self.capacity() * (self._extend_ratio - 1)
        # Обновить ёмкость списка
        self._capacity = len(self._arr)

    def to_array(self) -> list[int]:
        """Вернуть список в пределах фактической длины"""
        return self._arr[: self._size]


"""Driver Code"""
if __name__ == "__main__":
    # Инициализация списка
    nums = MyList()
    # Добавление элемента в конец
    nums.add(1)
    nums.add(3)
    nums.add(2)
    nums.add(5)
    nums.add(4)
    print(f"Список nums = {nums.to_array()}, ёмкость = {nums.capacity()}, длина = {nums.size()}")

    # Вставка элемента в середину
    nums.insert(6, index=3)
    print("После вставки числа 6 по индексу 3 nums =", nums.to_array())

    # Удаление элемента
    nums.remove(3)
    print("После удаления элемента по индексу 3 nums =", nums.to_array())

    # Доступ к элементу
    num = nums.get(1)
    print("Элемент по индексу 1: num =", num)

    # Изменение элемента
    nums.set(0, 1)
    print("После записи 0 по индексу 1 nums =", nums.to_array())

    # Проверка увеличения ёмкости
    for i in range(10):
        # При i = 5 длина списка превысит его ёмкость, поэтому потребуется увеличить ёмкость
        nums.add(i)
    print(f"Список после увеличения ёмкости: {nums.to_array()}, ёмкость = {nums.capacity()}, длина = {nums.size()}")
