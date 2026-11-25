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
    """Хеш-таблица с цепочками"""

    def __init__(self):
        """Конструктор"""
        self.size = 0  # Число пар «ключ — значение»
        self.capacity = 4  # Ёмкость хеш-таблицы
        self.load_thres = 2.0 / 3.0  # Порог коэффициента заполнения для расширения
        self.extend_ratio = 2  # Во сколько раз увеличивается ёмкость
        self.buckets = [[] for _ in range(self.capacity)]  # Массив корзин

    def hash_func(self, key: int) -> int:
        """Хеш-функция"""
        return key % self.capacity

    def load_factor(self) -> float:
        """Коэффициент заполнения"""
        return self.size / self.capacity

    def get(self, key: int) -> str | None:
        """Поиск"""
        index = self.hash_func(key)
        bucket = self.buckets[index]
        # Обойти корзину и при совпадении ключа key вернуть соответствующее значение val
        for pair in bucket:
            if pair.key == key:
                return pair.val
        # Если ключ key не найден, вернуть None
        return None

    def put(self, key: int, val: str):
        """Вставка"""
        # Расширить таблицу, если коэффициент заполнения превысил порог
        if self.load_factor() > self.load_thres:
            self.extend()
        index = self.hash_func(key)
        bucket = self.buckets[index]
        # Обойти корзину. Если найден ключ key, обновить val и завершить операцию
        for pair in bucket:
            if pair.key == key:
                pair.val = val
                return
        # Если ключа key нет, добавить пару в конец списка
        pair = Pair(key, val)
        bucket.append(pair)
        self.size += 1

    def remove(self, key: int):
        """Удаление"""
        index = self.hash_func(key)
        bucket = self.buckets[index]
        # Обойти корзину и удалить из неё нужную пару
        for pair in bucket:
            if pair.key == key:
                bucket.remove(pair)
                self.size -= 1
                break

    def extend(self):
        """Расширить хеш-таблицу"""
        # Временно сохранить исходную хеш-таблицу
        buckets = self.buckets
        # Создать новую таблицу увеличенной ёмкости
        self.capacity *= self.extend_ratio
        self.buckets = [[] for _ in range(self.capacity)]
        self.size = 0
        # Перенести пары из исходной таблицы в новую
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
    # Создать хеш-таблицу
    hashmap = HashMapChaining()

    # Вставка
    # Добавить в таблицу пару (key, value)
    hashmap.put(12836, "Сяо Ха")
    hashmap.put(15937, "Сяо Ло")
    hashmap.put(16750, "Сяо Суань")
    hashmap.put(13276, "Сяо Фа")
    hashmap.put(10583, "Сяо Я")
    print("\nХеш-таблица после вставки:\n[Ключ1 -> Значение1, Ключ2 -> Значение2, ...]")
    hashmap.print()

    # Поиск
    # Получить из таблицы значение value по ключу key
    name = hashmap.get(13276)
    print("\nИмя студента с номером 13276: " + name)

    # Удаление
    # Удалить из таблицы пару (key, value)
    hashmap.remove(12836)
    print("\nХеш-таблица после удаления 12836:\n[Ключ1 -> Значение1, Ключ2 -> Значение2, ...]")
    hashmap.print()
