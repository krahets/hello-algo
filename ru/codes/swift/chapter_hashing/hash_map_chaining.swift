/**
 * File: hash_map_chaining.swift
 * Created Time: 2023-06-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* Хеш-таблица с цепочками */
class HashMapChaining {
    var size: Int // Число пар ключ-значение
    var capacity: Int // Вместимость хеш-таблицы
    var loadThres: Double // Порог коэффициента загрузки для запуска расширения
    var extendRatio: Int // Коэффициент расширения
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

    /* Коэффициент загрузки */
    func loadFactor() -> Double {
        Double(size) / Double(capacity)
    }

    /* Операция поиска */
    func get(key: Int) -> String? {
        let index = hashFunc(key: key)
        let bucket = buckets[index]
        // Обойти корзину; если найден key, вернуть соответствующее val
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
        // Обойти корзину; если встретился указанный key, обновить соответствующее val и вернуть
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
        // Обойти корзину и удалить из нее пару ключ-значение
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
        // Инициализация новой хеш-таблицы после расширения
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
        /* Инициализация хеш-таблицы */
        let map = HashMapChaining()

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
        let name = map.get(key: 13276)
        print("\nДля номера 13276 найдено имя \(name!)")

        /* Операция удаления */
        // Удалить пару (key, value) из хеш-таблицы
        map.remove(key: 12836)
        print("\nПосле удаления 12836 хеш-таблица имеет вид\nКлюч -> Значение")
        map.print()
    }
}
