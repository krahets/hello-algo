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
        self.size = 0  # Число пар ключ-значение
        self.capacity = 4  # Вместимость хеш-таблицы
        self.load_thres = 2.0 / 3.0  # Порог коэффициента загрузки для запуска расширения
        self.extend_ratio = 2  # Коэффициент расширения
        self.buckets = [[] for _ in range(self.capacity)]  # Массив корзин

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
        # Обойти корзину; если найден key, вернуть соответствующее val
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
        # Обойти корзину; если встретился указанный key, обновить соответствующее val и вернуть
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
        # Обойти корзину и удалить из нее пару ключ-значение
        for pair in bucket:
            if pair.key == key:
                bucket.remove(pair)
                self.size -= 1
                break

    def extend(self):
        """Расширить хеш-таблицу"""
        # Временно сохранить исходную хеш-таблицу
        buckets = self.buckets
        # Инициализация новой хеш-таблицы после расширения
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
    # Инициализация хеш-таблицы
    hashmap = HashMapChaining()

    # Операция добавления
    # Добавить пару (key, value) в хеш-таблицу
    hashmap.put(12836, "Сяо Ха")
    hashmap.put(15937, "Сяо Ло")
    hashmap.put(16750, "Сяо Суань")
    hashmap.put(13276, "Сяо Фа")
    hashmap.put(10583, "Сяо Я")
    print("\nПосле завершения добавления хеш-таблица имеет вид\n[Key1 -> Value1, Key2 -> Value2, ...]")
    hashmap.print()

    # Операция поиска
    # Передать ключ key в хеш-таблицу и получить значение value
    name = hashmap.get(13276)
    print("\nДля номера 13276 найдено имя " + name)

    # Операция удаления
    # Удалить пару (key, value) из хеш-таблицы
    hashmap.remove(12836)
    print("\nПосле удаления 12836 хеш-таблица имеет вид\n[Key1 -> Value1, Key2 -> Value2, ...]")
    hashmap.print()
