/**
 * File: hash_map_chaining.swift
 * Created Time: 2023-06-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* Хеш-таблица с цепочечной адресацией */
class HashMapChaining {
    var size: Int // Количество пар ключ-значение
    var capacity: Int // Вместимость хеш-таблицы
    var loadThres: Double // Порог коэффициента загрузки, запускающий расширение
    var extendRatio: Int // Коэффициент расширения
    var buckets: [[Pair]] // Массив бакетов

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

    /* Коэффициент загрузки */
    func loadFactor() -> Double {
        Double(size) / Double(capacity)
    }

    /* Операция поиска */
    func get(key: Int) -> String? {
        let index = hashFunc(key: key)
        let bucket = buckets[index]
        // Обойти бакет; если найден key, вернуть соответствующее val
        for pair in bucket {
            if pair.key == key {
                return pair.val
            }
        }
        // Если key не найден, вернуть nil
        return nil
    }

    /* Операция добавления */
    func put(key: Int, val: String) {
        // Когда коэффициент загрузки превышает порог, выполнить расширение
        if loadFactor() > loadThres {
            extend()
        }
        let index = hashFunc(key: key)
        let bucket = buckets[index]
        // Обойти бакет; если встретился указанный key, обновить соответствующее val и вернуть результат
        for pair in bucket {
            if pair.key == key {
                pair.val = val
                return
            }
        }
        // Если такого key нет, добавить пару ключ-значение в конец
        let pair = Pair(key: key, val: val)
        buckets[index].append(pair)
        size += 1
    }

    /* Операция удаления */
    func remove(key: Int) {
        let index = hashFunc(key: key)
        let bucket = buckets[index]
        // Обойти бакет и удалить из него пару ключ-значение
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
        // Инициализировать новую хеш-таблицу после расширения
        capacity *= extendRatio
        buckets = Array(repeating: [], count: capacity)
        size = 0
        // Перенести пары ключ-значение из исходной хеш-таблицы в новую
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
    /* Driver Code */
    static func main() {
        /* Инициализировать хеш-таблицу */
        let map = HashMapChaining()

        /* Операция добавления */
        // Добавить в хеш-таблицу пару ключ-значение (key, value)
        map.put(key: 12836, val: "Сяо Ха")
        map.put(key: 15937, val: "Сяо Ло")
        map.put(key: 16750, val: "Сяо Суань")
        map.put(key: 13276, val: "Сяо Фа")
        map.put(key: 10583, val: "Утенок")
        print("\nПосле добавления хеш-таблица имеет вид\nKey -> Value")
        map.print()

        /* Операция поиска */
        // Передать ключ key в хеш-таблицу и получить значение value
        let name = map.get(key: 13276)
        print("\nВходномер 13276, найденоимя \(name!)")

        /* Операция удаления */
        // Удалить из хеш-таблицы пару ключ-значение (key, value)
        map.remove(key: 12836)
        print("\nПосле удаления 12836 хеш-таблица имеет вид\nKey -> Value")
        map.print()
    }
}
