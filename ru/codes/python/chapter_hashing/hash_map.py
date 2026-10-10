"""
File: hash_map.py
Created Time: 2022-12-14
Author: msk397 (machangxinq@gmail.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from modules import print_dict

"""Driver Code"""
if __name__ == "__main__":
    # Инициализация хеш-таблицы
    hmap = dict[int, str]()

    # Операция добавления
    # Добавить пару (key, value) в хеш-таблицу
    hmap[12836] = "Сяо Ха"
    hmap[15937] = "Сяо Ло"
    hmap[16750] = "Сяо Суань"
    hmap[13276] = "Сяо Фа"
    hmap[10583] = "Сяо Я"
    print("\nПосле добавления хеш-таблица имеет вид\nКлюч -> Значение")
    print_dict(hmap)

    # Операция поиска
    # Передать ключ key в хеш-таблицу и получить значение value
    name: str = hmap[15937]
    print("\nДля номера 15937 найдено имя " + name)

    # Операция удаления
    # Удалить пару (key, value) из хеш-таблицы
    hmap.pop(10583)
    print("\nПосле удаления 10583 хеш-таблица имеет вид\nКлюч -> Значение")
    print_dict(hmap)

    # Обход хеш-таблицы
    print("\nОтдельный обход пар ключ-значение")
    for key, value in hmap.items():
        print(key, "->", value)

    print("\nОтдельный обход ключей")
    for key in hmap.keys():
        print(key)

    print("\nОтдельный обход значений")
    for val in hmap.values():
        print(val)
