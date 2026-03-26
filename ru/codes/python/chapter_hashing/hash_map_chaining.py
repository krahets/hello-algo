"""
File: hash_map_chaining.py
Created Time: 2023-06-13
Author: krahets (krahets@163.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from chapter_hashing.array_hash_map import Pair


class HashMapChaining:
    """Хеш-таблица с цепочечной адресацией"""

    def __init__(self):
        """Конструктор"""
        self.size = 0  # Количество пар ключ-значение
        self.capacity = 4  # Вместимость хеш-таблицы
        self.load_thres = 2.0 / 3.0  # Порог коэффициента загрузки, запускающий расширение
        self.extend_ratio = 2  # Коэффициент расширения
        self.buckets = [[] for _ in range(self.capacity)]  # Массив бакетов

    def hash_func(self, key: int) -> int:
        """Хеш-функция"""
        return key % self.capacity

    def load_factor(self) -> float:
        """Коэффициент загрузки"""
        return self.size / self.capacity

    def get(self, key: int) -> str | None:
        """Операция поиска"""
        index = self.hash_func(key)
        bucket = self.buckets[index]
        # Обойти бакет; если найден key, вернуть соответствующее val
        for pair in bucket:
            if pair.key == key:
                return pair.val
        # Если key не найден, вернуть None
        return None

    def put(self, key: int, val: str):
        """Операция добавления"""
        # Когда коэффициент загрузки превышает порог, выполнить расширение
        if self.load_factor() > self.load_thres:
            self.extend()
        index = self.hash_func(key)
        bucket = self.buckets[index]
        # Обойти бакет; если встретился указанный key, обновить соответствующее val и вернуть результат
        for pair in bucket:
            if pair.key == key:
                pair.val = val
                return
        # Если такого key нет, добавить пару ключ-значение в конец
        pair = Pair(key, val)
        bucket.append(pair)
        self.size += 1

    def remove(self, key: int):
        """Операция удаления"""
        index = self.hash_func(key)
        bucket = self.buckets[index]
        # Обойти бакет и удалить из него пару ключ-значение
        for pair in bucket:
            if pair.key == key:
                bucket.remove(pair)
                self.size -= 1
                break

    def extend(self):
        """Расширить хеш-таблицу"""
        # Временно сохранить исходную хеш-таблицу
        buckets = self.buckets
        # Инициализировать новую хеш-таблицу после расширения
        self.capacity *= self.extend_ratio
        self.buckets = [[] for _ in range(self.capacity)]
        self.size = 0
        # Перенести пары ключ-значение из исходной хеш-таблицы в новую
        for bucket in buckets:
            for pair in bucket:
                self.put(pair.key, pair.val)

    def print(self):
        """Вывести хеш-таблицу"""
        for bucket in self.buckets:
            res = []
            for pair in bucket:
                res.append(str(pair.key) + " -> " + pair.val)
            print(res)


"""Driver Code"""
if __name__ == "__main__":
    # Инициализировать хеш-таблицу
    hashmap = HashMapChaining()

    # Операция добавления
    # Добавить в хеш-таблицу пару ключ-значение (key, value)
    hashmap.put(12836, "Сяо Ха")
    hashmap.put(15937, "Сяо Ло")
    hashmap.put(16750, "Сяо Суань")
    hashmap.put(13276, "Сяо Фа")
    hashmap.put(10583, "Утенок")
    print("\nПосле добавления хеш-таблица выглядит так\n[Key1 -> Value1, Key2 -> Value2, ...]")
    hashmap.print()

    # Операция поиска
    # Передать ключ key в хеш-таблицу и получить значение value
    name = hashmap.get(13276)
    print("\nПо номеру студента 13276 найдено имя " + name)

    # Операция удаления
    # Удалить из хеш-таблицы пару ключ-значение (key, value)
    hashmap.remove(12836)
    print("\nПосле удаления 12836 хеш-таблица выглядит так\n[Key1 -> Value1, Key2 -> Value2, ...]")
    hashmap.print()
