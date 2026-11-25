/**
 * File: hash_map_open_addressing.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_hashing

/* Хеш-таблица с открытой адресацией */
class HashMapOpenAddressing {
    private var size: Int               // Число пар «ключ — значение»
    private var capacity: Int           // Ёмкость хеш-таблицы
    private val loadThres: Double       // Порог коэффициента заполнения для расширения
    private val extendRatio: Int        // Во сколько раз увеличивается ёмкость
    private var buckets: Array<Pair?>   // Массив корзин
    private val TOMBSTONE: Pair         // Метка удаления

    /* Конструктор */
    init {
        size = 0
        capacity = 4
        loadThres = 2.0 / 3.0
        extendRatio = 2
        buckets = arrayOfNulls(capacity)
        TOMBSTONE = Pair(-1, "-1")
    }

    /* Хеш-функция */
    fun hashFunc(key: Int): Int {
        return key % capacity
    }

    /* Коэффициент заполнения */
    fun loadFactor(): Double {
        return (size / capacity).toDouble()
    }

    /* Найти индекс корзины для ключа key */
    fun findBucket(key: Int): Int {
        var index = hashFunc(key)
        var firstTombstone = -1
        // Линейное пробирование до первой пустой корзины
        while (buckets[index] != null) {
            // При совпадении ключа key вернуть индекс его корзины
            if (buckets[index]?.key == key) {
                // Если ранее встретилась метка удаления, переместить пару на её место
                if (firstTombstone != -1) {
                    buckets[firstTombstone] = buckets[index]
                    buckets[index] = TOMBSTONE
                    return firstTombstone // Вернуть индекс корзины после перемещения
                }
                return index // Вернуть индекс корзины
            }
            // Запомнить первую встретившуюся метку удаления
            if (firstTombstone == -1 && buckets[index] == TOMBSTONE) {
                firstTombstone = index
            }
            // Вычислить индекс корзины, после конца массива перейти в начало
            index = (index + 1) % capacity
        }
        // Если ключа key нет, вернуть индекс для вставки
        return if (firstTombstone == -1) index else firstTombstone
    }

    /* Поиск */
    fun get(key: Int): String? {
        // Найти индекс корзины для ключа key
        val index = findBucket(key)
        // Если пара найдена, вернуть её значение val
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            return buckets[index]?._val
        }
        // Если пары нет, вернуть null
        return null
    }

    /* Вставка */
    fun put(key: Int, _val: String) {
        // Расширить таблицу, если коэффициент заполнения превысил порог
        if (loadFactor() > loadThres) {
            extend()
        }
        // Найти индекс корзины для ключа key
        val index = findBucket(key)
        // Если пара найдена, заменить val и завершить операцию
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            buckets[index]!!._val = _val
            return
        }
        // Если пары нет, добавить её
        buckets[index] = Pair(key, _val)
        size++
    }

    /* Удаление */
    fun remove(key: Int) {
        // Найти индекс корзины для ключа key
        val index = findBucket(key)
        // Если пара найдена, заменить её меткой удаления
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            buckets[index] = TOMBSTONE
            size--
        }
    }

    /* Расширить хеш-таблицу */
    fun extend() {
        // Временно сохранить исходную хеш-таблицу
        val bucketsTmp = buckets
        // Создать новую таблицу увеличенной ёмкости
        capacity *= extendRatio
        buckets = arrayOfNulls(capacity)
        size = 0
        // Перенести пары из исходной таблицы в новую
        for (pair in bucketsTmp) {
            if (pair != null && pair != TOMBSTONE) {
                put(pair.key, pair._val)
            }
        }
    }

    /* Вывести хеш-таблицу */
    fun print() {
        for (pair in buckets) {
            if (pair == null) {
                println("null")
            } else if (pair == TOMBSTONE) {
                println("TOMESTOME")
            } else {
                println("${pair.key} -> ${pair._val}")
            }
        }
    }
}

/* Демонстрационный код */
fun main() {
    // Создать хеш-таблицу
    val hashmap = HashMapOpenAddressing()

    // Вставка
    // Добавить в таблицу пару (key, val)
    hashmap.put(12836, "Сяо Ха")
    hashmap.put(15937, "Сяо Ло")
    hashmap.put(16750, "Сяо Суань")
    hashmap.put(13276, "Сяо Фа")
    hashmap.put(10583, "Сяо Я")
    println("\nХеш-таблица после вставки:\nКлюч -> Значение")
    hashmap.print()

    // Поиск
    // Получить из таблицы значение val по ключу key
    val name = hashmap.get(13276)
    println("\nИмя студента с номером 13276: $name")

    // Удаление
    // Удалить из таблицы пару (key, val)
    hashmap.remove(16750)
    println("\nХеш-таблица после удаления 16750:\nКлюч -> Значение")
    hashmap.print()
}