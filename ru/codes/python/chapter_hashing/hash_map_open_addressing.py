"""
File: hash_map_open_addressing.py
Created Time: 2023-06-13
Author: krahets (krahets@163.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from chapter_hashing.array_hash_map import Pair


class HashMapOpenAddressing:
    """Хеш-таблица с открытой адресацией"""

    def __init__(self):
        """Конструктор"""
        self.size = 0  # Число пар «ключ — значение»
        self.capacity = 4  # Ёмкость хеш-таблицы
        self.load_thres = 2.0 / 3.0  # Порог коэффициента заполнения для расширения
        self.extend_ratio = 2  # Во сколько раз увеличивается ёмкость
        self.buckets: list[Pair | None] = [None] * self.capacity  # Массив корзин
        self.TOMBSTONE = Pair(-1, "-1")  # Метка удаления

    def hash_func(self, key: int) -> int:
        """Хеш-функция"""
        return key % self.capacity

    def load_factor(self) -> float:
        """Коэффициент заполнения"""
        return self.size / self.capacity

    def find_bucket(self, key: int) -> int:
        """Найти индекс корзины для ключа key"""
        index = self.hash_func(key)
        first_tombstone = -1
        for _ in range(self.capacity):
            bucket = self.buckets[index]
            if bucket is None:
                break
            # Запомнить первую встретившуюся метку удаления
            if bucket is self.TOMBSTONE:
                if first_tombstone == -1:
                    first_tombstone = index
            # При совпадении ключа key вернуть индекс его корзины
            elif bucket.key == key:
                # Если ранее встретилась метка удаления, переместить пару на её место
                if first_tombstone != -1:
                    self.buckets[first_tombstone] = bucket
                    self.buckets[index] = self.TOMBSTONE
                    return first_tombstone  # Вернуть индекс корзины после перемещения
                return index  # Вернуть индекс корзины
            # Вычислить индекс корзины, после конца массива перейти в начало
            index = (index + 1) % self.capacity
        # Если ключа key нет, вернуть индекс для вставки
        return index if first_tombstone == -1 else first_tombstone

    def get(self, key: int) -> str:
        """Поиск"""
        # Найти индекс корзины для ключа key
        index = self.find_bucket(key)
        # Если пара найдена, вернуть её значение val
        if self.buckets[index] not in [None, self.TOMBSTONE]:
            return self.buckets[index].val
        # Если пары нет, вернуть None
        return None

    def put(self, key: int, val: str):
        """Вставка"""
        # Расширить таблицу, если коэффициент заполнения превысил порог
        if self.load_factor() > self.load_thres:
            self.extend()
        # Найти индекс корзины для ключа key
        index = self.find_bucket(key)
        # Если пара найдена, заменить val и завершить операцию
        if self.buckets[index] not in [None, self.TOMBSTONE]:
            self.buckets[index].val = val
            return
        # Если пары нет, добавить её
        self.buckets[index] = Pair(key, val)
        self.size += 1

    def remove(self, key: int):
        """Удаление"""
        # Найти индекс корзины для ключа key
        index = self.find_bucket(key)
        # Если пара найдена, заменить её меткой удаления
        if self.buckets[index] not in [None, self.TOMBSTONE]:
            self.buckets[index] = self.TOMBSTONE
            self.size -= 1

    def extend(self):
        """Расширить хеш-таблицу"""
        # Временно сохранить исходную хеш-таблицу
        buckets_tmp = self.buckets
        # Создать новую таблицу увеличенной ёмкости
        self.capacity *= self.extend_ratio
        self.buckets = [None] * self.capacity
        self.size = 0
        # Перенести пары из исходной таблицы в новую
        for pair in buckets_tmp:
            if pair not in [None, self.TOMBSTONE]:
                self.put(pair.key, pair.val)

    def print(self):
        """Вывести хеш-таблицу"""
        for pair in self.buckets:
            if pair is None:
                print("None")
            elif pair is self.TOMBSTONE:
                print("TOMBSTONE")
            else:
                print(pair.key, "->", pair.val)


"""Driver Code"""
if __name__ == "__main__":
    # Создать хеш-таблицу
    hashmap = HashMapOpenAddressing()

    # Вставка
    # Добавить в таблицу пару (key, val)
    hashmap.put(12836, "Сяо Ха")
    hashmap.put(15937, "Сяо Ло")
    hashmap.put(16750, "Сяо Суань")
    hashmap.put(13276, "Сяо Фа")
    hashmap.put(10583, "Сяо Я")
    print("\nХеш-таблица после вставки:\nКлюч -> Значение")
    hashmap.print()

    # Поиск
    # Получить из таблицы значение val по ключу key
    name = hashmap.get(13276)
    print("\nИмя студента с номером 13276: " + name)

    # Удаление
    # Удалить из таблицы пару (key, val)
    hashmap.remove(16750)
    print("\nХеш-таблица после удаления 16750:\nКлюч -> Значение")
    hashmap.print()
