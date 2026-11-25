/**
 * File: hash_map_chaining.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_hashing

/* Хеш-таблица с цепочками */
class HashMapChaining {
    var size: Int // Число пар «ключ — значение»
    var capacity: Int // Ёмкость хеш-таблицы
    val loadThres: Double // Порог коэффициента заполнения для расширения
    val extendRatio: Int // Во сколько раз увеличивается ёмкость
    var buckets: MutableList<MutableList<Pair>> // Массив корзин

    /* Конструктор */
    init {
        size = 0
        capacity = 4
        loadThres = 2.0 / 3.0
        extendRatio = 2
        buckets = mutableListOf()
        for (i in 0..<capacity) {
            buckets.add(mutableListOf())
        }
    }

    /* Хеш-функция */
    fun hashFunc(key: Int): Int {
        return key % capacity
    }

    /* Коэффициент заполнения */
    fun loadFactor(): Double {
        return (size / capacity).toDouble()
    }

    /* Поиск */
    fun get(key: Int): String? {
        val index = hashFunc(key)
        val bucket = buckets[index]
        // Обойти корзину и при совпадении ключа key вернуть соответствующее значение val
        for (pair in bucket) {
            if (pair.key == key) return pair._val
        }
        // Если ключ key не найден, вернуть null
        return null
    }

    /* Вставка */
    fun put(key: Int, _val: String) {
        // Расширить таблицу, если коэффициент заполнения превысил порог
        if (loadFactor() > loadThres) {
            extend()
        }
        val index = hashFunc(key)
        val bucket = buckets[index]
        // Обойти корзину. Если найден ключ key, обновить val и завершить операцию
        for (pair in bucket) {
            if (pair.key == key) {
                pair._val = _val
                return
            }
        }
        // Если ключа key нет, добавить пару в конец списка
        val pair = Pair(key, _val)
        bucket.add(pair)
        size++
    }

    /* Удаление */
    fun remove(key: Int) {
        val index = hashFunc(key)
        val bucket = buckets[index]
        // Обойти корзину и удалить из неё нужную пару
        for (pair in bucket) {
            if (pair.key == key) {
                bucket.remove(pair)
                size--
                break
            }
        }
    }

    /* Расширить хеш-таблицу */
    fun extend() {
        // Временно сохранить исходную хеш-таблицу
        val bucketsTmp = buckets
        // Создать новую таблицу увеличенной ёмкости
        capacity *= extendRatio
        // Размер mutablelist не фиксирован
        buckets = mutableListOf()
        for (i in 0..<capacity) {
            buckets.add(mutableListOf())
        }
        size = 0
        // Перенести пары из исходной таблицы в новую
        for (bucket in bucketsTmp) {
            for (pair in bucket) {
                put(pair.key, pair._val)
            }
        }
    }

    /* Вывести хеш-таблицу */
    fun print() {
        for (bucket in buckets) {
            val res = mutableListOf<String>()
            for (pair in bucket) {
                val k = pair.key
                val v = pair._val
                res.add("$k -> $v")
            }
            println(res)
        }
    }
}

/* Демонстрационный код */
fun main() {
    /* Создать хеш-таблицу */
    val map = HashMapChaining()

    /* Вставка */
    // Добавить в таблицу пару (key, value)
    map.put(12836, "Сяо Ха")
    map.put(15937, "Сяо Ло")
    map.put(16750, "Сяо Суань")
    map.put(13276, "Сяо Фа")
    map.put(10583, "Сяо Я")
    println("\nХеш-таблица после вставки:\nКлюч -> Значение")
    map.print()

    /* Поиск */
    // Получить из таблицы значение value по ключу key
    val name = map.get(13276)
    println("\nИмя студента с номером 13276: $name")

    /* Удаление */
    // Удалить из таблицы пару (key, value)
    map.remove(12836)
    println("\nХеш-таблица после удаления 12836:\nКлюч -> Значение")
    map.print()
}