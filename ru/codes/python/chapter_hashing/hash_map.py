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
    # Инициализировать хеш-таблицу
    hmap = dict[int, str]()

    # Операция добавления
    # Добавить в хеш-таблицу пару ключ-значение (key, value)
    hmap[12836] = "Сяо Ха"
    hmap[15937] = "Сяо Ло"
    hmap[16750] = "Сяо Суань"
    hmap[13276] = "Сяо Фа"
    hmap[10583] = "Утенок"
    print("\nПосле добавления хеш-таблица выглядит так\nKey -> Value")
    print_dict(hmap)

    # Операция поиска
    # Передать ключ key в хеш-таблицу и получить значение value
    name: str = hmap[15937]
    print("\nПо номеру студента 15937 найдено имя " + name)

    # Операция удаления
    # Удалить из хеш-таблицы пару ключ-значение (key, value)
    hmap.pop(10583)
    print("\nПосле удаления 10583 хеш-таблица выглядит так\nKey -> Value")
    print_dict(hmap)

    # Перебрать хеш-таблицу
    print("\nПеребираем пары Key->Value")
    for key, value in hmap.items():
        print(key, "->", value)

    print("\nОтдельно перебираем ключи Key")
    for key in hmap.keys():
        print(key)

    print("\nОтдельно перебираем значения Value")
    for val in hmap.values():
        print(val)
