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
    # [region]{init_hash_map}
    # Инициализация хеш-таблицы
    hmap = dict[int, str]()
    # [endregion]{init_hash_map}

    # [region]{add_pairs}
    # Операция добавления
    # Добавить пару (key, value) в хеш-таблицу
    hmap[12836] = "Сяо Ха"
    hmap[15937] = "Сяо Ло"
    hmap[16750] = "Сяо Суань"
    hmap[13276] = "Сяо Фа"
    hmap[10583] = "Сяо Я"
    # [endregion]{add_pairs}
    print("\nПосле добавления хеш-таблица имеет вид\nКлюч -> Значение")
    print_dict(hmap)

    # [region]{get_value}
    # Операция поиска
    # Передать ключ key в хеш-таблицу и получить значение value
    name: str = hmap[15937]
    # [endregion]{get_value}
    print("\nДля номера 15937 найдено имя " + name)

    # [region]{remove_pair}
    # Операция удаления
    # Удалить пару (key, value) из хеш-таблицы
    hmap.pop(10583)
    # [endregion]{remove_pair}
    print("\nПосле удаления 10583 хеш-таблица имеет вид\nКлюч -> Значение")
    print_dict(hmap)

    print("\nОтдельный обход пар ключ-значение")
    # [region]{iterate_pairs}
    # Обход хеш-таблицы
    # Обход пар ключ-значение key->value
    for key, value in hmap.items():
        print(key, "->", value)
    # [endregion]{iterate_pairs}

    print("\nОтдельный обход ключей")
    # [region]{iterate_keys}
    # Обход только ключей key
    for key in hmap.keys():
        print(key)
    # [endregion]{iterate_keys}

    print("\nОтдельный обход значений")
    # [region]{iterate_values}
    # Обход только значений value
    for val in hmap.values():
        print(val)
    # [endregion]{iterate_values}
