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
        /* Инициализация хеш-таблицы */
        var map: [Int: String] = [:]

        /* Операция добавления */
        // Добавить пару (key, value) в хеш-таблицу
        map[12836] = "Сяо Ха"
        map[15937] = "Сяо Ло"
        map[16750] = "Сяо Суань"
        map[13276] = "Сяо Фа"
        map[10583] = "Сяо Я"
        print("\nПосле добавления хеш-таблица имеет вид\nКлюч -> Значение")
        PrintUtil.printHashMap(map: map)

        /* Операция поиска */
        // Ввести в хеш-таблицу ключ key и получить значение value
        let name = map[15937]!
        print("\nДля номера 15937 найдено имя \(name)")

        /* Операция удаления */
        // Удалить пару (key, value) из хеш-таблицы
        map.removeValue(forKey: 10583)
        print("\nПосле удаления 10583 хеш-таблица имеет вид\nКлюч -> Значение")
        PrintUtil.printHashMap(map: map)

        /* Обход хеш-таблицы */
        print("\nОтдельный обход пар ключ-значение")
        for (key, value) in map {
            print("\(key) -> \(value)")
        }
        print("\nОтдельный обход ключей")
        for key in map.keys {
            print(key)
        }
        print("\nОтдельный обход значений")
        for value in map.values {
            print(value)
        }
    }
}
