/**
 * File: array_hash_map.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_hashing

/* Пара «ключ — значение» */
class Pair(
    var key: Int,
    var _val: String
)

/* Хеш-таблица на основе массива */
class ArrayHashMap {
    // Создать массив из 100 корзин
    private val buckets = arrayOfNulls<Pair>(100)

    /* Хеш-функция */
    fun hashFunc(key: Int): Int {
        val index = key % 100
        return index
    }

    /* Поиск */
    fun get(key: Int): String? {
        val index = hashFunc(key)
        val pair = buckets[index] ?: return null
        return pair._val
    }

    /* Вставка */
    fun put(key: Int, _val: String) {
        val pair = Pair(key, _val)
        val index = hashFunc(key)
        buckets[index] = pair
    }

    /* Удаление */
    fun remove(key: Int) {
        val index = hashFunc(key)
        // Записать null в знак удаления
        buckets[index] = null
    }

    /* Получить все пары «ключ — значение» */
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

/* Демонстрационный код */
fun main() {
    /* Создать хеш-таблицу */
    val map = ArrayHashMap()

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
    val name = map.get(15937)
    println("\nИмя студента с номером 15937: $name")

    /* Удаление */
    // Удалить из таблицы пару (key, value)
    map.remove(10583)
    println("\nХеш-таблица после удаления 10583:\nКлюч -> Значение")
    map.print()

    /* Обход хеш-таблицы */
    println("\nОбход пар «ключ -> значение»")
    for (kv in map.pairSet()) {
        println("${kv.key} -> ${kv._val}")
    }
    println("\nОбход только ключей")
    for (key in map.keySet()) {
        println(key)
    }
    println("\nОбход только значений")
    for (_val in map.valueSet()) {
        println(_val)
    }
}