/**
 * File: hash_map_chaining.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_hashing

/* Хеш-таблица с цепочечной адресацией */
class HashMapChaining {
    var size: Int // Количество пар ключ-значение
    var capacity: Int // Вместимость хеш-таблицы
    val loadThres: Double // Порог коэффициента загрузки, запускающий расширение
    val extendRatio: Int // Коэффициент расширения
    var buckets: MutableList<MutableList<Pair>> // Массив бакетов

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

    /* Коэффициент загрузки */
    fun loadFactor(): Double {
        return (size / capacity).toDouble()
    }

    /* Операция поиска */
    fun get(key: Int): String? {
        val index = hashFunc(key)
        val bucket = buckets[index]
        // Обойти бакет; если найден key, вернуть соответствующее val
        for (pair in bucket) {
            if (pair.key == key) return pair._val
        }
        // Если key не найден, вернуть null
        return null
    }

    /* Операция добавления */
    fun put(key: Int, _val: String) {
        // Когда коэффициент загрузки превышает порог, выполнить расширение
        if (loadFactor() > loadThres) {
            extend()
        }
        val index = hashFunc(key)
        val bucket = buckets[index]
        // Обойти бакет; если встретился указанный key, обновить соответствующее val и вернуть результат
        for (pair in bucket) {
            if (pair.key == key) {
                pair._val = _val
                return
            }
        }
        // Если такого key нет, добавить пару ключ-значение в конец
        val pair = Pair(key, _val)
        bucket.add(pair)
        size++
    }

    /* Операция удаления */
    fun remove(key: Int) {
        val index = hashFunc(key)
        val bucket = buckets[index]
        // Обойти бакет и удалить из него пару ключ-значение
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
        // Инициализировать новую хеш-таблицу после расширения
        capacity *= extendRatio
        // MutableList не имеет фиксированного размера
        buckets = mutableListOf()
        for (i in 0..<capacity) {
            buckets.add(mutableListOf())
        }
        size = 0
        // Перенести пары ключ-значение из исходной хеш-таблицы в новую
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

/* Driver Code */
fun main() {
    /* Инициализировать хеш-таблицу */
    val map = HashMapChaining()

    /* Операция добавления */
    // Добавить в хеш-таблицу пару ключ-значение (key, value)
    map.put(12836, "Сяо Ха")
    map.put(15937, "Сяо Ло")
    map.put(16750, "Сяо Суань")
    map.put(13276, "Сяо Фа")
    map.put(10583, "Утенок")
    println("\nПосле добавления хеш-таблица выглядит так\nKey -> Value")
    map.print()

    /* Операция поиска */
    // Передать ключ key в хеш-таблицу и получить значение value
    val name = map.get(13276)
    println("\nПо номеру студента 13276 найдено имя $name")

    /* Операция удаления */
    // Удалить из хеш-таблицы пару ключ-значение (key, value)
    map.remove(12836)
    println("\nПосле удаления 12836 хеш-таблица выглядит так\nKey -> Value")
    map.print()
}
