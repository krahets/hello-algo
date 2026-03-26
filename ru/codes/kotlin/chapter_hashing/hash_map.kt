/**
 * File: hash_map.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_hashing

import utils.printHashMap

/* Driver Code */
fun main() {
    /* Инициализировать хеш-таблицу */
    val map = HashMap<Int, String>()

    /* Операция добавления */
    // Добавить в хеш-таблицу пару ключ-значение (key, value)
    map[12836] = "Сяо Ха"
    map[15937] = "Сяо Ло"
    map[16750] = "Сяо Суань"
    map[13276] = "Сяо Фа"
    map[10583] = "Утенок"
    println("\nПосле добавления хеш-таблица имеет вид\nKey -> Value")
    printHashMap(map)

    /* Операция поиска */
    // Передать ключ key в хеш-таблицу и получить значение value
    val name = map[15937]
    println("\nВходномер 15937, найденоимя $name")

    /* Операция удаления */
    // Удалить из хеш-таблицы пару ключ-значение (key, value)
    map.remove(10583)
    println("\nПосле удаления 10583 хеш-таблица имеет вид\nKey -> Value")
    printHashMap(map)

    /* Перебрать хеш-таблицу */
    println("\nОбойтипара ключ-значение Key->Value")
    for ((key, value) in map) {
        println("$key -> $value")
    }
    println("\nотдельноОбойтиключ Key")
    for (key in map.keys) {
        println(key)
    }
    println("\nотдельноОбойтизначение Value")
    for (_val in map.values) {
        println(_val)
    }
}
