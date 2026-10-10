"""
File: array_hash_map.py
Created Time: 2022-12-14
Author: msk397 (machangxinq@gmail.com)
"""


class Pair:
    """Пара ключ-значение"""

    def __init__(self, key: int, val: str):
        self.key = key
        self.val = val


class ArrayHashMap:
    """Хеш-таблица на основе массива"""

    def __init__(self):
        """Конструктор"""
        # Инициализировать массив, содержащий 100 корзин
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
        # Присвоить None, что означает удаление
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
    # Инициализация хеш-таблицы
    hmap = ArrayHashMap()

    # Операция добавления
    # Добавить пару (key, value) в хеш-таблицу
    hmap.put(12836, "Сяо Ха")
    hmap.put(15937, "Сяо Ло")
    hmap.put(16750, "Сяо Суань")
    hmap.put(13276, "Сяо Фа")
    hmap.put(10583, "Сяо Я")
    print("\nПосле добавления хеш-таблица имеет вид\nКлюч -> Значение")
    hmap.print()

    # Операция поиска
    # Передать ключ key в хеш-таблицу и получить значение value
    name = hmap.get(15937)
    print("\nДля номера 15937 найдено имя " + name)

    # Операция удаления
    # Удалить пару (key, value) из хеш-таблицы
    hmap.remove(10583)
    print("\nПосле удаления 10583 хеш-таблица имеет вид\nКлюч -> Значение")
    hmap.print()

    # Обход хеш-таблицы
    print("\nОтдельный обход пар ключ-значение")
    for pair in hmap.entry_set():
        print(pair.key, "->", pair.val)

    print("\nОтдельный обход ключей")
    for key in hmap.key_set():
        print(key)

    print("\nОтдельный обход значений")
    for val in hmap.value_set():
        print(val)
