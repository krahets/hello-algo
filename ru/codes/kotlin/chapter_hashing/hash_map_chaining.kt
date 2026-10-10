/**
 * File: hash_map_chaining.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_hashing

/* Хеш-таблица с цепочками */
class HashMapChaining {
    var size: Int // Число пар ключ-значение
    var capacity: Int // Вместимость хеш-таблицы
    val loadThres: Double // Порог коэффициента загрузки для запуска расширения
    val extendRatio: Int // Коэффициент расширения
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

    /* Коэффициент загрузки */
    fun loadFactor(): Double {
        return (size / capacity).toDouble()
    }

    /* Операция поиска */
    fun get(key: Int): String? {
        val index = hashFunc(key)
        val bucket = buckets[index]
        // Обойти корзину; если найден key, вернуть соответствующее val
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
        // Обойти корзину; если встретился указанный key, обновить соответствующее val и вернуть
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
        // Обойти корзину и удалить из нее пару ключ-значение
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
        // Инициализация новой хеш-таблицы после расширения
        capacity *= extendRatio
        // mutablelist не имеет фиксированного размера
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
    /* Инициализация хеш-таблицы */
    val map = HashMapChaining()

    /* Операция добавления */
    // Добавить пару (key, value) в хеш-таблицу
    map.put(12836, "Сяо Ха")
    map.put(15937, "Сяо Ло")
    map.put(16750, "Сяо Суань")
    map.put(13276, "Сяо Фа")
    map.put(10583, "Сяо Я")
    println("\nПосле добавления хеш-таблица имеет вид\nКлюч -> Значение")
    map.print()

    /* Операция поиска */
    // Ввести в хеш-таблицу ключ key и получить значение value
    val name = map.get(13276)
    println("\nДля номера 13276 найдено имя $name")

    /* Операция удаления */
    // Удалить пару (key, value) из хеш-таблицы
    map.remove(12836)
    println("\nПосле удаления 12836 хеш-таблица имеет вид\nКлюч -> Значение")
    map.print()
}