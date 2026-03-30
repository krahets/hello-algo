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
        self._arr: list[int] = [0] * self._capacity  # Массив (для хранения элементов списка)
        self._size: int = 0  # Длина списка (текущее число элементов)
        self._extend_ratio: int = 2  # Коэффициент увеличения списка при каждом расширении

    def size(self) -> int:
        """Получить длину списка (текущее число элементов)"""
        return self._size

    def capacity(self) -> int:
        """Получить вместимость списка"""
        return self._capacity

    def get(self, index: int) -> int:
        """Доступ к элементу"""
        # Если индекс выходит за границы, выбрасывается исключение; далее аналогично
        if index < 0 or index >= self._size:
            raise IndexError("индекс выходит за границы")
        return self._arr[index]

    def set(self, num: int, index: int):
        """Обновление элемента"""
        if index < 0 or index >= self._size:
            raise IndexError("индекс выходит за границы")
        self._arr[index] = num

    def add(self, num: int):
        """Добавление элемента в конец"""
        # При превышении вместимости по числу элементов запускается расширение
        if self.size() == self.capacity():
            self.extend_capacity()
        self._arr[self._size] = num
        self._size += 1

    def insert(self, num: int, index: int):
        """Вставка элемента в середину"""
        if index < 0 or index >= self._size:
            raise IndexError("индекс выходит за границы")
        # При превышении вместимости по числу элементов запускается расширение
        if self._size == self.capacity():
            self.extend_capacity()
        # Сдвинуть элемент с индексом index и все следующие элементы на одну позицию назад
        for j in range(self._size - 1, index - 1, -1):
            self._arr[j + 1] = self._arr[j]
        self._arr[index] = num
        # Обновить число элементов
        self._size += 1

    def remove(self, index: int) -> int:
        """Удаление элемента"""
        if index < 0 or index >= self._size:
            raise IndexError("индекс выходит за границы")
        num = self._arr[index]
        # Сдвинуть все элементы после индекса index на одну позицию вперед
        for j in range(index, self._size - 1):
            self._arr[j] = self._arr[j + 1]
        # Обновить число элементов
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
        """Вернуть список фактической длины"""
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
    print(f"Список nums = {nums.to_array()}, вместимость = {nums.capacity()}, длина = {nums.size()}")

    # Вставка элемента в середину
    nums.insert(6, index=3)
    print("После вставки числа 6 по индексу 3 nums =", nums.to_array())

    # Удаление элемента
    nums.remove(3)
    print("После удаления элемента по индексу 3 nums =", nums.to_array())

    # Доступ к элементу
    num = nums.get(1)
    print("Элемент по индексу 1: num =", num)

    # Обновление элемента
    nums.set(0, 1)
    print("После обновления элемента по индексу 1 до 0 nums =", nums.to_array())

    # Проверка механизма расширения
    for i in range(10):
        # При i = 5 длина списка превысит его вместимость, и в этот момент сработает механизм расширения
        nums.add(i)
    print(f"Список nums после увеличения вместимости = {nums.to_array()}, вместимость = {nums.capacity()}, длина = {nums.size()}")
