/**
 * File: hash_map.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_hashing

import utils.printHashMap

/* Driver Code */
fun main() {
    /* Инициализация хеш-таблицы */
    val map = HashMap<Int, String>()

    /* Операция добавления */
    // Добавить пару (key, value) в хеш-таблицу
    map[12836] = "Сяо Ха"
    map[15937] = "Сяо Ло"
    map[16750] = "Сяо Суань"
    map[13276] = "Сяо Фа"
    map[10583] = "Сяо Я"
    println("\nПосле добавления хеш-таблица имеет вид\nКлюч -> Значение")
    printHashMap(map)

    /* Операция поиска */
    // Ввести в хеш-таблицу ключ key и получить значение value
    val name = map[15937]
    println("\nДля номера 15937 найдено имя $name")

    /* Операция удаления */
    // Удалить пару (key, value) из хеш-таблицы
    map.remove(10583)
    println("\nПосле удаления 10583 хеш-таблица имеет вид\nКлюч -> Значение")
    printHashMap(map)

    /* Обход хеш-таблицы */
    println("\nОтдельный обход пар ключ-значение")
    for ((key, value) in map) {
        println("$key -> $value")
    }
    println("\nОтдельный обход ключей")
    for (key in map.keys) {
        println(key)
    }
    println("\nОтдельный обход значений")
    for (_val in map.values) {
        println(_val)
    }
}