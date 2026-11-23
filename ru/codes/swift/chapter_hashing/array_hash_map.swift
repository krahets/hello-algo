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
        // Инициализировать массив, содержащий 100 корзин
        buckets = Array(repeating: nil, count: 100)
    }

    /* Хеш-функция */
    private func hashFunc(key: Int) -> Int {
        let index = key % 100
        return index
    }

    /* Операция поиска */
    func get(key: Int) -> String? {
        let index = hashFunc(key: key)
        let pair = buckets[index]
        return pair?.val
    }

    /* Операция добавления */
    func put(key: Int, val: String) {
        let pair = Pair(key: key, val: val)
        let index = hashFunc(key: key)
        buckets[index] = pair
    }

    /* Операция удаления */
    func remove(key: Int) {
        let index = hashFunc(key: key)
        // Присвоить nil, что означает удаление
        buckets[index] = nil
    }

    /* Получить все пары ключ-значение */
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
    /* Driver Code */
    static func main() {
        /* Инициализация хеш-таблицы */
        let map = ArrayHashMap()

        /* Операция добавления */
        // Добавить пару (key, value) в хеш-таблицу
        map.put(key: 12836, val: "Сяо Ха")
        map.put(key: 15937, val: "Сяо Ло")
        map.put(key: 16750, val: "Сяо Суань")
        map.put(key: 13276, val: "Сяо Фа")
        map.put(key: 10583, val: "Сяо Я")
        print("\nПосле добавления хеш-таблица имеет вид\nКлюч -> Значение")
        map.print()

        /* Операция поиска */
        // Ввести в хеш-таблицу ключ key и получить значение value
        let name = map.get(key: 15937)!
        print("\nДля номера 15937 найдено имя \(name)")

        /* Операция удаления */
        // Удалить пару (key, value) из хеш-таблицы
        map.remove(key: 10583)
        print("\nПосле удаления 10583 хеш-таблица имеет вид\nКлюч -> Значение")
        map.print()

        /* Обход хеш-таблицы */
        print("\nОтдельный обход пар ключ-значение")
        for pair in map.pairSet() {
            print("\(pair.key) -> \(pair.val)")
        }
        print("\nОтдельный обход ключей")
        for key in map.keySet() {
            print(key)
        }
        print("\nОтдельный обход значений")
        for val in map.valueSet() {
            print(val)
        }
    }
}
