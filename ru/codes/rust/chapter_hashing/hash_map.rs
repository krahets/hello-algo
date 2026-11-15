/*
 * File: hash_map.rs
 * Created Time: 2023-02-05
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::print_util;

// [region]{import_hash_map}
use std::collections::HashMap;
// [endregion]{import_hash_map}

/* Driver Code */
pub fn main() {
    // [region]{init_hash_map}
    // Инициализация хеш-таблицы
    let mut map = HashMap::new();
    // [endregion]{init_hash_map}

    // [region]{add_pairs}
    // Операция добавления
    // Добавить пару (key, value) в хеш-таблицу
    map.insert(12836, "Сяо Ха");
    map.insert(15937, "Сяо Ло");
    map.insert(16750, "Сяо Суань");
    map.insert(13276, "Сяо Фа");
    map.insert(10583, "Сяо Я");
    // [endregion]{add_pairs}
    println!("\nПосле добавления хеш-таблица имеет вид\nКлюч -> Значение");
    print_util::print_hash_map(&map);

    // [region]{get_value}
    // Операция поиска
    // Передать ключ key в хеш-таблицу и получить значение value
    let name = map.get(&15937).copied().unwrap();
    // [endregion]{get_value}
    println!("\nДля номера 15937 найдено имя {name}");

    // [region]{remove_pair}
    // Операция удаления
    // Удалить пару (key, value) из хеш-таблицы
    _ = map.remove(&10583);
    // [endregion]{remove_pair}
    println!("\nПосле удаления 10583 хеш-таблица имеет вид\nКлюч -> Значение");
    print_util::print_hash_map(&map);

    println!("\nОтдельный обход пар ключ-значение");
    // [region]{iterate_pairs}
    // Обход хеш-таблицы
    // Обход пар ключ-значение key->value
    for (key, value) in &map {
        println!("{key} -> {value}");
    }
    // [endregion]{iterate_pairs}

    println!("\nОтдельный обход ключей");
    // [region]{iterate_keys}
    // Обход только ключей key
    for key in map.keys() {
        println!("{key}");
    }
    // [endregion]{iterate_keys}

    println!("\nОтдельный обход значений");
    // [region]{iterate_values}
    // Обход только значений value
    for value in map.values() {
        println!("{value}");
    }
    // [endregion]{iterate_values}
}
