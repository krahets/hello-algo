/**
 * File: hash_map.swift
 * Created Time: 2023-01-16
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

@main
enum HashMap {
    /* Driver Code */
    static func main() {
        // [region]{init_hash_map}
        /* Инициализация хеш-таблицы */
        var map: [Int: String] = [:]
        // [endregion]{init_hash_map}

        // [region]{add_pairs}
        /* Операция добавления */
        // Добавить пару (key, value) в хеш-таблицу
        map[12836] = "Сяо Ха"
        map[15937] = "Сяо Ло"
        map[16750] = "Сяо Суань"
        map[13276] = "Сяо Фа"
        map[10583] = "Сяо Я"
        // [endregion]{add_pairs}
        print("\nПосле добавления хеш-таблица имеет вид\nКлюч -> Значение")
        PrintUtil.printHashMap(map: map)

        // [region]{get_value}
        /* Операция поиска */
        // Ввести в хеш-таблицу ключ key и получить значение value
        let name = map[15937]!
        // [endregion]{get_value}
        print("\nДля номера 15937 найдено имя \(name)")

        // [region]{remove_pair}
        /* Операция удаления */
        // Удалить пару (key, value) из хеш-таблицы
        map.removeValue(forKey: 10583)
        // [endregion]{remove_pair}
        print("\nПосле удаления 10583 хеш-таблица имеет вид\nКлюч -> Значение")
        PrintUtil.printHashMap(map: map)

        print("\nОтдельный обход пар ключ-значение")
        // [region]{iterate_pairs}
        /* Обход хеш-таблицы */
        // Обход пар ключ-значение key->value
        for (key, value) in map {
            print("\(key) -> \(value)")
        }
        // [endregion]{iterate_pairs}

        print("\nОтдельный обход ключей")
        // [region]{iterate_keys}
        // Обход только ключей key
        for key in map.keys {
            print(key)
        }
        // [endregion]{iterate_keys}

        print("\nОтдельный обход значений")
        // [region]{iterate_values}
        // Обход только значений value
        for value in map.values {
            print(value)
        }
        // [endregion]{iterate_values}
    }
}
