/**
 * File: hash_map.swift
 * Created Time: 2023-01-16
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

@main
enum HashMap {
    /* Демонстрационный код */
    static func main() {
        /* Создать хеш-таблицу */
        var map: [Int: String] = [:]

        /* Вставка */
        // Добавить в таблицу пару (key, value)
        map[12836] = "Сяо Ха"
        map[15937] = "Сяо Ло"
        map[16750] = "Сяо Суань"
        map[13276] = "Сяо Фа"
        map[10583] = "Сяо Я"
        print("\nХеш-таблица после вставки:\nКлюч -> Значение")
        PrintUtil.printHashMap(map: map)

        /* Поиск */
        // Получить из таблицы значение value по ключу key
        let name = map[15937]!
        print("\nИмя студента с номером 15937: \(name)")

        /* Удаление */
        // Удалить из таблицы пару (key, value)
        map.removeValue(forKey: 10583)
        print("\nХеш-таблица после удаления 10583:\nКлюч -> Значение")
        PrintUtil.printHashMap(map: map)

        /* Обход хеш-таблицы */
        print("\nОбход пар «ключ -> значение»")
        for (key, value) in map {
            print("\(key) -> \(value)")
        }
        print("\nОбход только ключей")
        for key in map.keys {
            print(key)
        }
        print("\nОбход только значений")
        for value in map.values {
            print(value)
        }
    }
}
