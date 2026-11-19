/**
 * File: hash_map.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_hashing

import utils.printHashMap

/* Driver Code */
fun main() {
    // [region]{init_hash_map}
    /* Инициализация хеш-таблицы */
    val map = HashMap<Int, String>()
    // [endregion]{init_hash_map}

    // [region]{add_pairs}
    /* Операция добавления */
    // Добавить пару (key, value) в хеш-таблицу
    map[12836] = "Сяо Ха"
    map[15937] = "Сяо Ло"
    map[16750] = "Сяо Суань"
    map[13276] = "Сяо Фа"
    map[10583] = "Сяо Я"
    // [endregion]{add_pairs}
    println("\nПосле добавления хеш-таблица имеет вид\nКлюч -> Значение")
    printHashMap(map)

    // [region]{get_value}
    /* Операция поиска */
    // Ввести в хеш-таблицу ключ key и получить значение value
    val name = map[15937]
    // [endregion]{get_value}
    println("\nДля номера 15937 найдено имя $name")

    // [region]{remove_pair}
    /* Операция удаления */
    // Удалить пару (key, value) из хеш-таблицы
    map.remove(10583)
    // [endregion]{remove_pair}
    println("\nПосле удаления 10583 хеш-таблица имеет вид\nКлюч -> Значение")
    printHashMap(map)

    println("\nОтдельный обход пар ключ-значение")
    // [region]{iterate_pairs}
    /* Обход хеш-таблицы */
    // Обход пар ключ-значение key->value
    for ((key, value) in map) {
        println("$key -> $value")
    }
    // [endregion]{iterate_pairs}

    println("\nОтдельный обход ключей")
    // [region]{iterate_keys}
    // Обход только ключей key
    for (key in map.keys) {
        println(key)
    }
    // [endregion]{iterate_keys}

    println("\nОтдельный обход значений")
    // [region]{iterate_values}
    // Обход только значений value
    for (_val in map.values) {
        println(_val)
    }
    // [endregion]{iterate_values}
}