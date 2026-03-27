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
        /* Инициализировать хеш-таблицу */
        var map: [Int: String] = [:]

        /* Операция добавления */
        // Добавить в хеш-таблицу пару ключ-значение (key, value)
        map[12836] = "Сяо Ха"
        map[15937] = "Сяо Ло"
        map[16750] = "Сяо Суань"
        map[13276] = "Сяо Фа"
        map[10583] = "Утенок"
        print("\nПосле добавления хеш-таблица выглядит так\nKey -> Value")
        PrintUtil.printHashMap(map: map)

        /* Операция поиска */
        // Передать ключ key в хеш-таблицу и получить значение value
        let name = map[15937]!
        print("\nПо номеру студента 15937 найдено имя \(name)")

        /* Операция удаления */
        // Удалить из хеш-таблицы пару ключ-значение (key, value)
        map.removeValue(forKey: 10583)
        print("\nПосле удаления 10583 хеш-таблица выглядит так\nKey -> Value")
        PrintUtil.printHashMap(map: map)

        /* Перебрать хеш-таблицу */
        print("\nПеребираем пары Key->Value")
        for (key, value) in map {
            print("\(key) -> \(value)")
        }
        print("\nОтдельно перебираем ключи Key")
        for key in map.keys {
            print(key)
        }
        print("\nОтдельно перебираем значения Value")
        for value in map.values {
            print(value)
        }
    }
}
