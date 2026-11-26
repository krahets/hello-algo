/**
 * File: hash_map.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_hashing

import utils.printHashMap

/* Демонстрационный код */
fun main() {
    /* Создать хеш-таблицу */
    val map = HashMap<Int, String>()

    /* Вставка */
    // Добавить в таблицу пару (key, value)
    map[12836] = "Сяо Ха"
    map[15937] = "Сяо Ло"
    map[16750] = "Сяо Суань"
    map[13276] = "Сяо Фа"
    map[10583] = "Сяо Я"
    println("\nХеш-таблица после вставки:\nКлюч -> Значение")
    printHashMap(map)

    /* Поиск */
    // Получить из таблицы значение value по ключу key
    val name = map[15937]
    println("\nИмя студента с номером 15937: $name")

    /* Удаление */
    // Удалить из таблицы пару (key, value)
    map.remove(10583)
    println("\nХеш-таблица после удаления 10583:\nКлюч -> Значение")
    printHashMap(map)

    /* Обход хеш-таблицы */
    println("\nОбход пар «ключ -> значение»")
    for ((key, value) in map) {
        println("$key -> $value")
    }
    println("\nОбход только ключей")
    for (key in map.keys) {
        println(key)
    }
    println("\nОбход только значений")
    for (_val in map.values) {
        println(_val)
    }
}