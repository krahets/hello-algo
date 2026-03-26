/**
 * File: hash_map_open_addressing.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_hashing

/* Хеш-таблица с открытой адресацией */
class HashMapOpenAddressing {
    private var size: Int               // Количество пар ключ-значение
    private var capacity: Int           // Вместимость хеш-таблицы
    private val loadThres: Double       // Порог коэффициента загрузки, запускающий расширение
    private val extendRatio: Int        // Коэффициент расширения
    private var buckets: Array<Pair?>   // Массив бакетов
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

    /* Коэффициент загрузки */
    fun loadFactor(): Double {
        return (size / capacity).toDouble()
    }

    /* Найти индекс корзины, соответствующей ключу key */
    fun findBucket(key: Int): Int {
        var index = hashFunc(key)
        var firstTombstone = -1
        // Выполнять линейное пробирование и остановиться при встрече с пустым бакетом
        while (buckets[index] != null) {
            // Если встретился key, вернуть соответствующий индекс бакета
            if (buckets[index]?.key == key) {
                // Если ранее встретилась метка удаления, переместить пару ключ-значение в этот индекс
                if (firstTombstone != -1) {
                    buckets[firstTombstone] = buckets[index]
                    buckets[index] = TOMBSTONE
                    return firstTombstone // Вернуть индекс бакета после перемещения
                }
                return index // Вернуть индекс бакета
            }
            // Записать первую встретившуюся метку удаления
            if (firstTombstone == -1 && buckets[index] == TOMBSTONE) {
                firstTombstone = index
            }
            // Вычислить индекс бакета; при выходе за конец вернуться к началу
            index = (index + 1) % capacity
        }
        // Если key не существует, вернуть индекс точки добавления
        return if (firstTombstone == -1) index else firstTombstone
    }

    /* Операция поиска */
    fun get(key: Int): String? {
        // Найти индекс корзины, соответствующей ключу key
        val index = findBucket(key)
        // Если пара ключ-значение найдена, вернуть соответствующее val
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            return buckets[index]?._val
        }
        // Если пара ключ-значение не существует, вернуть null
        return null
    }

    /* Операция добавления */
    fun put(key: Int, _val: String) {
        // Когда коэффициент загрузки превышает порог, выполнить расширение
        if (loadFactor() > loadThres) {
            extend()
        }
        // Найти индекс корзины, соответствующей ключу key
        val index = findBucket(key)
        // Если пара ключ-значение найдена, перезаписать val и вернуть результат
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            buckets[index]!!._val = _val
            return
        }
        // Если пара ключ-значение не существует, добавить ее
        buckets[index] = Pair(key, _val)
        size++
    }

    /* Операция удаления */
    fun remove(key: Int) {
        // Найти индекс корзины, соответствующей ключу key
        val index = findBucket(key)
        // Если пара ключ-значение найдена, пометить ее меткой удаления
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            buckets[index] = TOMBSTONE
            size--
        }
    }

    /* Расширить хеш-таблицу */
    fun extend() {
        // Временно сохранить исходную хеш-таблицу
        val bucketsTmp = buckets
        // Инициализировать новую хеш-таблицу после расширения
        capacity *= extendRatio
        buckets = arrayOfNulls(capacity)
        size = 0
        // Перенести пары ключ-значение из исходной хеш-таблицы в новую
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

/* Driver Code */
fun main() {
    // Инициализировать хеш-таблицу
    val hashmap = HashMapOpenAddressing()

    // Операция добавления
    // Добавить пару ключ-значение (key, val) в хеш-таблицу
    hashmap.put(12836, "Сяо Ха")
    hashmap.put(15937, "Сяо Ло")
    hashmap.put(16750, "Сяо Суань")
    hashmap.put(13276, "Сяо Фа")
    hashmap.put(10583, "Утенок")
    println("\nПосле добавления хеш-таблица имеет вид\nKey -> Value")
    hashmap.print()

    // Операция поиска
    // Ввести ключ key в хеш-таблицу и получить значение val
    val name = hashmap.get(13276)
    println("\nВходномер 13276, найденоимя $name")

    // Операция удаления
    // Удалить пару ключ-значение (key, val) из хеш-таблицы
    hashmap.remove(16750)
    println("\nПосле удаления 16750 хеш-таблица имеет вид\nKey -> Value")
    hashmap.print()
}
