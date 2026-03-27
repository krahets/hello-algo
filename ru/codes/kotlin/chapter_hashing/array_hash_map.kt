/**
 * File: array_hash_map.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_hashing

/* пара ключ-значение */
class Pair(
    var key: Int,
    var _val: String
)

/* Хеш-таблица на основе массива */
class ArrayHashMap {
    // Инициализировать массив, содержащий 100 бакетов
    private val buckets = arrayOfNulls<Pair>(100)

    /* Хеш-функция */
    fun hashFunc(key: Int): Int {
        val index = key % 100
        return index
    }

    /* Операция поиска */
    fun get(key: Int): String? {
        val index = hashFunc(key)
        val pair = buckets[index] ?: return null
        return pair._val
    }

    /* Операция добавления */
    fun put(key: Int, _val: String) {
        val pair = Pair(key, _val)
        val index = hashFunc(key)
        buckets[index] = pair
    }

    /* Операция удаления */
    fun remove(key: Int) {
        val index = hashFunc(key)
        // Установить null, обозначая удаление
        buckets[index] = null
    }

    /* Получить все пары ключ-значение */
    fun pairSet(): MutableList<Pair> {
        val pairSet = mutableListOf<Pair>()
        for (pair in buckets) {
            if (pair != null)
                pairSet.add(pair)
        }
        return pairSet
    }

    /* Получить все ключи */
    fun keySet(): MutableList<Int> {
        val keySet = mutableListOf<Int>()
        for (pair in buckets) {
            if (pair != null)
                keySet.add(pair.key)
        }
        return keySet
    }

    /* Получить все значения */
    fun valueSet(): MutableList<String> {
        val valueSet = mutableListOf<String>()
        for (pair in buckets) {
            if (pair != null)
                valueSet.add(pair._val)
        }
        return valueSet
    }

    /* Вывести хеш-таблицу */
    fun print() {
        for (kv in pairSet()) {
            val key = kv.key
            val _val = kv._val
            println("$key -> $_val")
        }
    }
}

/* Driver Code */
fun main() {
    /* Инициализировать хеш-таблицу */
    val map = ArrayHashMap()

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
    val name = map.get(15937)
    println("\nПо номеру студента 15937 найдено имя $name")

    /* Операция удаления */
    // Удалить из хеш-таблицы пару ключ-значение (key, value)
    map.remove(10583)
    println("\nПосле удаления 10583 хеш-таблица выглядит так\nKey -> Value")
    map.print()

    /* Перебрать хеш-таблицу */
    println("\nПеребираем пары ключ-значение Key -> Value")
    for (kv in map.pairSet()) {
        println("${kv.key} -> ${kv._val}")
    }
    println("\nОтдельно перебираем ключи Key")
    for (key in map.keySet()) {
        println(key)
    }
    println("\nОтдельно перебираем значения Value")
    for (_val in map.valueSet()) {
        println(_val)
    }
}
