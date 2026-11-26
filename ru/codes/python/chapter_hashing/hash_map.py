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
    # Создать хеш-таблицу
    hmap = dict[int, str]()

    # Вставка
    # Добавить в таблицу пару (key, value)
    hmap[12836] = "Сяо Ха"
    hmap[15937] = "Сяо Ло"
    hmap[16750] = "Сяо Суань"
    hmap[13276] = "Сяо Фа"
    hmap[10583] = "Сяо Я"
    print("\nХеш-таблица после вставки:\nКлюч -> Значение")
    print_dict(hmap)

    # Поиск
    # Получить из таблицы значение value по ключу key
    name: str = hmap[15937]
    print("\nИмя студента с номером 15937: " + name)

    # Удаление
    # Удалить из таблицы пару (key, value)
    hmap.pop(10583)
    print("\nХеш-таблица после удаления 10583:\nКлюч -> Значение")
    print_dict(hmap)

    # Обход хеш-таблицы
    print("\nОбход пар «ключ -> значение»")
    for key, value in hmap.items():
        print(key, "->", value)

    print("\nОбход только ключей")
    for key in hmap.keys():
        print(key)

    print("\nОбход только значений")
    for val in hmap.values():
        print(val)
