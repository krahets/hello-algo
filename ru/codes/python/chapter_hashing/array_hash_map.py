"""
File: array_hash_map.py
Created Time: 2022-12-14
Author: msk397 (machangxinq@gmail.com)
"""


class Pair:
    """пара ключ-значение"""

    def __init__(self, key: int, val: str):
        self.key = key
        self.val = val


class ArrayHashMap:
    """Хеш-таблица на основе массива"""

    def __init__(self):
        """Конструктор"""
        # Инициализировать массив, содержащий 100 бакетов
        self.buckets: list[Pair | None] = [None] * 100

    def hash_func(self, key: int) -> int:
        """Хеш-функция"""
        index = key % 100
        return index

    def get(self, key: int) -> str | None:
        """Операция поиска"""
        index: int = self.hash_func(key)
        pair: Pair = self.buckets[index]
        if pair is None:
            return None
        return pair.val

    def put(self, key: int, val: str):
        """Операции добавления и обновления"""
        pair = Pair(key, val)
        index: int = self.hash_func(key)
        self.buckets[index] = pair

    def remove(self, key: int):
        """Операция удаления"""
        index: int = self.hash_func(key)
        # Установить None, обозначая удаление
        self.buckets[index] = None

    def entry_set(self) -> list[Pair]:
        """Получить все пары ключ-значение"""
        result: list[Pair] = []
        for pair in self.buckets:
            if pair is not None:
                result.append(pair)
        return result

    def key_set(self) -> list[int]:
        """Получить все ключи"""
        result = []
        for pair in self.buckets:
            if pair is not None:
                result.append(pair.key)
        return result

    def value_set(self) -> list[str]:
        """Получить все значения"""
        result = []
        for pair in self.buckets:
            if pair is not None:
                result.append(pair.val)
        return result

    def print(self):
        """Вывести хеш-таблицу"""
        for pair in self.buckets:
            if pair is not None:
                print(pair.key, "->", pair.val)


"""Driver Code"""
if __name__ == "__main__":
    # Инициализировать хеш-таблицу
    hmap = ArrayHashMap()

    # Операция добавления
    # Добавить в хеш-таблицу пару ключ-значение (key, value)
    hmap.put(12836, "Сяо Ха")
    hmap.put(15937, "Сяо Ло")
    hmap.put(16750, "Сяо Суань")
    hmap.put(13276, "Сяо Фа")
    hmap.put(10583, "Утенок")
    print("\nПосле добавления хеш-таблица выглядит так\nKey -> Value")
    hmap.print()

    # Операция поиска
    # Передать ключ key в хеш-таблицу и получить значение value
    name = hmap.get(15937)
    print("\nПо номеру студента 15937 найдено имя " + name)

    # Операция удаления
    # Удалить из хеш-таблицы пару ключ-значение (key, value)
    hmap.remove(10583)
    print("\nПосле удаления 10583 хеш-таблица выглядит так\nKey -> Value")
    hmap.print()

    # Перебрать хеш-таблицу
    print("\nПеребираем пары Key->Value")
    for pair in hmap.entry_set():
        print(pair.key, "->", pair.val)

    print("\nОтдельно перебираем ключи Key")
    for key in hmap.key_set():
        print(key)

    print("\nОтдельно перебираем значения Value")
    for val in hmap.value_set():
        print(val)
