/**
 * File: hash_map_chaining.swift
 * Created Time: 2023-06-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* Хеш-таблица с цепочками */
class HashMapChaining {
    var size: Int // Число пар «ключ — значение»
    var capacity: Int // Ёмкость хеш-таблицы
    var loadThres: Double // Порог коэффициента заполнения для расширения
    var extendRatio: Int // Во сколько раз увеличивается ёмкость
    var buckets: [[Pair]] // Массив корзин

    /* Конструктор */
    init() {
        size = 0
        capacity = 4
        loadThres = 2.0 / 3.0
        extendRatio = 2
        buckets = Array(repeating: [], count: capacity)
    }

    /* Хеш-функция */
    func hashFunc(key: Int) -> Int {
        key % capacity
    }

    /* Коэффициент заполнения */
    func loadFactor() -> Double {
        Double(size) / Double(capacity)
    }

    /* Поиск */
    func get(key: Int) -> String? {
        let index = hashFunc(key: key)
        let bucket = buckets[index]
        // Обойти корзину и при совпадении ключа key вернуть соответствующее значение val
        for pair in bucket {
            if pair.key == key {
                return pair.val
            }
        }
        // Если ключ key не найден, вернуть nil
        return nil
    }

    /* Вставка */
    func put(key: Int, val: String) {
        // Расширить таблицу, если коэффициент заполнения превысил порог
        if loadFactor() > loadThres {
            extend()
        }
        let index = hashFunc(key: key)
        let bucket = buckets[index]
        // Обойти корзину. Если найден ключ key, обновить val и завершить операцию
        for pair in bucket {
            if pair.key == key {
                pair.val = val
                return
            }
        }
        // Если ключа key нет, добавить пару в конец списка
        let pair = Pair(key: key, val: val)
        buckets[index].append(pair)
        size += 1
    }

    /* Удаление */
    func remove(key: Int) {
        let index = hashFunc(key: key)
        let bucket = buckets[index]
        // Обойти корзину и удалить из неё нужную пару
        for (pairIndex, pair) in bucket.enumerated() {
            if pair.key == key {
                buckets[index].remove(at: pairIndex)
                size -= 1
                break
            }
        }
    }

    /* Расширить хеш-таблицу */
    func extend() {
        // Временно сохранить исходную хеш-таблицу
        let bucketsTmp = buckets
        // Создать новую таблицу увеличенной ёмкости
        capacity *= extendRatio
        buckets = Array(repeating: [], count: capacity)
        size = 0
        // Перенести пары из исходной таблицы в новую
        for bucket in bucketsTmp {
            for pair in bucket {
                put(key: pair.key, val: pair.val)
            }
        }
    }

    /* Вывести хеш-таблицу */
    func print() {
        for bucket in buckets {
            let res = bucket.map { "\($0.key) -> \($0.val)" }
            Swift.print(res)
        }
    }
}

@main
enum _HashMapChaining {
    /* Демонстрационный код */
    static func main() {
        /* Создать хеш-таблицу */
        let map = HashMapChaining()

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
        let name = map.get(key: 13276)
        print("\nИмя студента с номером 13276: \(name!)")

        /* Удаление */
        // Удалить из таблицы пару (key, value)
        map.remove(key: 12836)
        print("\nХеш-таблица после удаления 12836:\nКлюч -> Значение")
        map.print()
    }
}
