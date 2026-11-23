/**
 * File: hash_map_open_addressing.swift
 * Created Time: 2023-06-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* Хеш-таблица с открытой адресацией */
class HashMapOpenAddressing {
    var size: Int // Число пар ключ-значение
    var capacity: Int // Вместимость хеш-таблицы
    var loadThres: Double // Порог коэффициента загрузки для запуска расширения
    var extendRatio: Int // Коэффициент расширения
    var buckets: [Pair?] // Массив корзин
    var TOMBSTONE: Pair // Удалить метку

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

    /* Коэффициент загрузки */
    func loadFactor() -> Double {
        Double(size) / Double(capacity)
    }

    /* Найти индекс корзины, соответствующий key */
    func findBucket(key: Int) -> Int {
        var index = hashFunc(key: key)
        var firstTombstone = -1
        // Выполнять линейное пробирование и завершить при встрече с пустой корзиной
        while buckets[index] != nil {
            // Если встретился key, вернуть соответствующий индекс корзины
            if buckets[index]!.key == key {
                // Если ранее встретилась метка удаления, переместить пару ключ-значение на этот индекс
                if firstTombstone != -1 {
                    buckets[firstTombstone] = buckets[index]
                    buckets[index] = TOMBSTONE
                    return firstTombstone // Вернуть индекс корзины после перемещения
                }
                return index // Вернуть индекс корзины
            }
            // Записать первую встретившуюся метку удаления
            if firstTombstone == -1 && buckets[index] == TOMBSTONE {
                firstTombstone = index
            }
            // Вычислить индекс корзины; при выходе за конец вернуться к началу
            index = (index + 1) % capacity
        }
        // Если key не существует, вернуть индекс точки добавления
        return firstTombstone == -1 ? index : firstTombstone
    }

    /* Операция поиска */
    func get(key: Int) -> String? {
        // Найти индекс корзины, соответствующий key
        let index = findBucket(key: key)
        // Если пара ключ-значение найдена, вернуть соответствующее val
        if buckets[index] != nil, buckets[index] != TOMBSTONE {
            return buckets[index]!.val
        }
        // Если пары ключ-значение не существует, вернуть null
        return nil
    }

    /* Операция добавления */
    func put(key: Int, val: String) {
        // Когда коэффициент загрузки превышает порог, выполнить расширение
        if loadFactor() > loadThres {
            extend()
        }
        // Найти индекс корзины, соответствующий key
        let index = findBucket(key: key)
        // Если пара ключ-значение найдена, перезаписать val и вернуть
        if buckets[index] != nil, buckets[index] != TOMBSTONE {
            buckets[index]!.val = val
            return
        }
        // Если пары ключ-значение нет, добавить ее
        buckets[index] = Pair(key: key, val: val)
        size += 1
    }

    /* Операция удаления */
    func remove(key: Int) {
        // Найти индекс корзины, соответствующий key
        let index = findBucket(key: key)
        // Если пара ключ-значение найдена, заменить ее меткой удаления
        if buckets[index] != nil, buckets[index] != TOMBSTONE {
            buckets[index] = TOMBSTONE
            size -= 1
        }
    }

    /* Расширить хеш-таблицу */
    func extend() {
        // Временно сохранить исходную хеш-таблицу
        let bucketsTmp = buckets
        // Инициализация новой хеш-таблицы после расширения
        capacity *= extendRatio
        buckets = Array(repeating: nil, count: capacity)
        size = 0
        // Перенести пары ключ-значение из исходной хеш-таблицы в новую
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
    /* Driver Code */
    static func main() {
        /* Инициализация хеш-таблицы */
        let map = HashMapOpenAddressing()

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
        map.remove(key: 16750)
        print("\nПосле удаления 16750 хеш-таблица имеет вид\nКлюч -> Значение")
        map.print()
    }
}
