/**
 * File: array_hash_map.swift
 * Created Time: 2023-01-16
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* Хеш-таблица на основе массива */
class ArrayHashMap {
    private var buckets: [Pair?]

    init() {
        // Создать массив из 100 корзин
        buckets = Array(repeating: nil, count: 100)
    }

    /* Хеш-функция */
    private func hashFunc(key: Int) -> Int {
        let index = key % 100
        return index
    }

    /* Поиск */
    func get(key: Int) -> String? {
        let index = hashFunc(key: key)
        let pair = buckets[index]
        return pair?.val
    }

    /* Вставка */
    func put(key: Int, val: String) {
        let pair = Pair(key: key, val: val)
        let index = hashFunc(key: key)
        buckets[index] = pair
    }

    /* Удаление */
    func remove(key: Int) {
        let index = hashFunc(key: key)
        // Записать nil в знак удаления
        buckets[index] = nil
    }

    /* Получить все пары «ключ — значение» */
    func pairSet() -> [Pair] {
        buckets.compactMap { $0 }
    }

    /* Получить все ключи */
    func keySet() -> [Int] {
        buckets.compactMap { $0?.key }
    }

    /* Получить все значения */
    func valueSet() -> [String] {
        buckets.compactMap { $0?.val }
    }

    /* Вывести хеш-таблицу */
    func print() {
        for pair in pairSet() {
            Swift.print("\(pair.key) -> \(pair.val)")
        }
    }
}

@main
enum _ArrayHashMap {
    /* Демонстрационный код */
    static func main() {
        /* Создать хеш-таблицу */
        let map = ArrayHashMap()

        /* Вставка */
        // Добавить в таблицу пару (key, value)
        map.put(key: 12836, val: "Сяо Ха")
        map.put(key: 15937, val: "Сяо Ло")
        map.put(key: 16750, val: "Сяо Суань")
        map.put(key: 13276, val: "Сяо Фа")
        map.put(key: 10583, val: "Сяо Я")
        print("\nХеш-таблица после вставки:\nКлюч -> Значение")
        map.print()

        /* Поиск */
        // Получить из таблицы значение value по ключу key
        let name = map.get(key: 15937)!
        print("\nИмя студента с номером 15937: \(name)")

        /* Удаление */
        // Удалить из таблицы пару (key, value)
        map.remove(key: 10583)
        print("\nХеш-таблица после удаления 10583:\nКлюч -> Значение")
        map.print()

        /* Обход хеш-таблицы */
        print("\nОбход пар «ключ -> значение»")
        for pair in map.pairSet() {
            print("\(pair.key) -> \(pair.val)")
        }
        print("\nОбход только ключей")
        for key in map.keySet() {
            print(key)
        }
        print("\nОбход только значений")
        for val in map.valueSet() {
            print(val)
        }
    }
}
