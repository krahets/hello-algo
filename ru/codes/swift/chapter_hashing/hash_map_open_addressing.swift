/**
 * File: hash_map_open_addressing.swift
 * Created Time: 2023-06-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* Хеш-таблица с открытой адресацией */
class HashMapOpenAddressing {
    var size: Int // Число пар «ключ — значение»
    var capacity: Int // Ёмкость хеш-таблицы
    var loadThres: Double // Порог коэффициента заполнения для расширения
    var extendRatio: Int // Во сколько раз увеличивается ёмкость
    var buckets: [Pair?] // Массив корзин
    var TOMBSTONE: Pair // Метка удаления

    /* Конструктор */
    init() {
        size = 0
        capacity = 4
        loadThres = 2.0 / 3.0
        extendRatio = 2
        buckets = Array(repeating: nil, count: capacity)
        TOMBSTONE = Pair(key: -1, val: "-1")
    }

    /* Хеш-функция */
    func hashFunc(key: Int) -> Int {
        key % capacity
    }

    /* Коэффициент заполнения */
    func loadFactor() -> Double {
        Double(size) / Double(capacity)
    }

    /* Найти индекс корзины для ключа key */
    func findBucket(key: Int) -> Int {
        var index = hashFunc(key: key)
        var firstTombstone = -1
        // Линейное пробирование до первой пустой корзины
        while buckets[index] != nil {
            // При совпадении ключа key вернуть индекс его корзины
            if buckets[index]!.key == key {
                // Если ранее встретилась метка удаления, переместить пару на её место
                if firstTombstone != -1 {
                    buckets[firstTombstone] = buckets[index]
                    buckets[index] = TOMBSTONE
                    return firstTombstone // Вернуть индекс корзины после перемещения
                }
                return index // Вернуть индекс корзины
            }
            // Запомнить первую встретившуюся метку удаления
            if firstTombstone == -1 && buckets[index] == TOMBSTONE {
                firstTombstone = index
            }
            // Вычислить индекс корзины, после конца массива перейти в начало
            index = (index + 1) % capacity
        }
        // Если ключа key нет, вернуть индекс для вставки
        return firstTombstone == -1 ? index : firstTombstone
    }

    /* Поиск */
    func get(key: Int) -> String? {
        // Найти индекс корзины для ключа key
        let index = findBucket(key: key)
        // Если пара найдена, вернуть её значение val
        if buckets[index] != nil, buckets[index] != TOMBSTONE {
            return buckets[index]!.val
        }
        // Если пары нет, вернуть null
        return nil
    }

    /* Вставка */
    func put(key: Int, val: String) {
        // Расширить таблицу, если коэффициент заполнения превысил порог
        if loadFactor() > loadThres {
            extend()
        }
        // Найти индекс корзины для ключа key
        let index = findBucket(key: key)
        // Если пара найдена, заменить val и завершить операцию
        if buckets[index] != nil, buckets[index] != TOMBSTONE {
            buckets[index]!.val = val
            return
        }
        // Если пары нет, добавить её
        buckets[index] = Pair(key: key, val: val)
        size += 1
    }

    /* Удаление */
    func remove(key: Int) {
        // Найти индекс корзины для ключа key
        let index = findBucket(key: key)
        // Если пара найдена, заменить её меткой удаления
        if buckets[index] != nil, buckets[index] != TOMBSTONE {
            buckets[index] = TOMBSTONE
            size -= 1
        }
    }

    /* Расширить хеш-таблицу */
    func extend() {
        // Временно сохранить исходную хеш-таблицу
        let bucketsTmp = buckets
        // Создать новую таблицу увеличенной ёмкости
        capacity *= extendRatio
        buckets = Array(repeating: nil, count: capacity)
        size = 0
        // Перенести пары из исходной таблицы в новую
        for pair in bucketsTmp {
            if let pair, pair != TOMBSTONE {
                put(key: pair.key, val: pair.val)
            }
        }
    }

    /* Вывести хеш-таблицу */
    func print() {
        for pair in buckets {
            if pair == nil {
                Swift.print("null")
            } else if pair == TOMBSTONE {
                Swift.print("TOMBSTONE")
            } else {
                Swift.print("\(pair!.key) -> \(pair!.val)")
            }
        }
    }
}

@main
enum _HashMapOpenAddressing {
    /* Демонстрационный код */
    static func main() {
        /* Создать хеш-таблицу */
        let map = HashMapOpenAddressing()

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
        map.remove(key: 16750)
        print("\nХеш-таблица после удаления 16750:\nКлюч -> Значение")
        map.print()
    }
}
