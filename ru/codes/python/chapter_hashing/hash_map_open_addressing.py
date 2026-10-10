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
        self.size = 0  # Число пар ключ-значение
        self.capacity = 4  # Вместимость хеш-таблицы
        self.load_thres = 2.0 / 3.0  # Порог коэффициента загрузки для запуска расширения
        self.extend_ratio = 2  # Коэффициент расширения
        self.buckets: list[Pair | None] = [None] * self.capacity  # Массив корзин
        self.TOMBSTONE = Pair(-1, "-1")  # Удалить метку

    def hash_func(self, key: int) -> int:
        """Хеш-функция"""
        return key % self.capacity

    def load_factor(self) -> float:
        """Коэффициент загрузки"""
        return self.size / self.capacity

    def find_bucket(self, key: int) -> int:
        """Найти индекс корзины, соответствующий key"""
        index = self.hash_func(key)
        first_tombstone = -1
        # Выполнять линейное пробирование и завершить при встрече с пустой корзиной
        while self.buckets[index] is not None:
            # Если встретился key, вернуть соответствующий индекс корзины
            if self.buckets[index].key == key:
                # Если ранее встретилась метка удаления, переместить пару ключ-значение на этот индекс
                if first_tombstone != -1:
                    self.buckets[first_tombstone] = self.buckets[index]
                    self.buckets[index] = self.TOMBSTONE
                    return first_tombstone  # Вернуть индекс корзины после перемещения
                return index  # Вернуть индекс корзины
            # Записать первую встретившуюся метку удаления
            if first_tombstone == -1 and self.buckets[index] is self.TOMBSTONE:
                first_tombstone = index
            # Вычислить индекс корзины; при выходе за конец вернуться к началу
            index = (index + 1) % self.capacity
        # Если key не существует, вернуть индекс точки добавления
        return index if first_tombstone == -1 else first_tombstone

    def get(self, key: int) -> str:
        """Операция поиска"""
        # Найти индекс корзины, соответствующий key
        index = self.find_bucket(key)
        # Если пара ключ-значение найдена, вернуть соответствующее val
        if self.buckets[index] not in [None, self.TOMBSTONE]:
            return self.buckets[index].val
        # Если пара ключ-значение не существует, вернуть None
        return None

    def put(self, key: int, val: str):
        """Операция добавления"""
        # Когда коэффициент загрузки превышает порог, выполнить расширение
        if self.load_factor() > self.load_thres:
            self.extend()
        # Найти индекс корзины, соответствующий key
        index = self.find_bucket(key)
        # Если пара ключ-значение найдена, перезаписать val и вернуть
        if self.buckets[index] not in [None, self.TOMBSTONE]:
            self.buckets[index].val = val
            return
        # Если пары ключ-значение нет, добавить ее
        self.buckets[index] = Pair(key, val)
        self.size += 1

    def remove(self, key: int):
        """Операция удаления"""
        # Найти индекс корзины, соответствующий key
        index = self.find_bucket(key)
        # Если пара ключ-значение найдена, заменить ее меткой удаления
        if self.buckets[index] not in [None, self.TOMBSTONE]:
            self.buckets[index] = self.TOMBSTONE
            self.size -= 1

    def extend(self):
        """Расширить хеш-таблицу"""
        # Временно сохранить исходную хеш-таблицу
        buckets_tmp = self.buckets
        # Инициализация новой хеш-таблицы после расширения
        self.capacity *= self.extend_ratio
        self.buckets = [None] * self.capacity
        self.size = 0
        # Перенести пары ключ-значение из исходной хеш-таблицы в новую
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
    # Инициализация хеш-таблицы
    hashmap = HashMapOpenAddressing()

    # Операция добавления
    # Добавить пару (key, val) в хеш-таблицу
    hashmap.put(12836, "Сяо Ха")
    hashmap.put(15937, "Сяо Ло")
    hashmap.put(16750, "Сяо Суань")
    hashmap.put(13276, "Сяо Фа")
    hashmap.put(10583, "Сяо Я")
    print("\nПосле добавления хеш-таблица имеет вид\nКлюч -> Значение")
    hashmap.print()

    # Операция поиска
    # Передать ключ key в хеш-таблицу и получить значение val
    name = hashmap.get(13276)
    print("\nДля номера 13276 найдено имя " + name)

    # Операция удаления
    # Удалить пару (key, val) из хеш-таблицы
    hashmap.remove(16750)
    print("\nПосле удаления 16750 хеш-таблица имеет вид\nКлюч -> Значение")
    hashmap.print()
