/*
 * File: hash_map.rs
 * Created Time: 2023-02-05
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::print_util;

use std::collections::HashMap;

/* Driver Code */
pub fn main() {
    // Инициализировать хеш-таблицу
    let mut map = HashMap::new();

    // Операция добавления
    // Добавить в хеш-таблицу пару ключ-значение (key, value)
    map.insert(12836, "Сяо Ха");
    map.insert(15937, "Сяо Ло");
    map.insert(16750, "Сяо Суань");
    map.insert(13276, "Сяо Фа");
    map.insert(10583, "Утенок");
    println!("\nПосле добавления хеш-таблица выглядит так\nKey -> Value");
    print_util::print_hash_map(&map);

    // Операция поиска
    // Передать ключ key в хеш-таблицу и получить значение value
    let name = map.get(&15937).copied().unwrap();
    println!("\nПо номеру студента 15937 найдено имя {name}");

    // Операция удаления
    // Удалить из хеш-таблицы пару ключ-значение (key, value)
    _ = map.remove(&10583);
    println!("\nПосле удаления 10583 хеш-таблица выглядит так\nKey -> Value");
    print_util::print_hash_map(&map);

    // Перебрать хеш-таблицу
    println!("\nПеребираем пары Key->Value");
    print_util::print_hash_map(&map);
    println!("\nОтдельно перебираем ключи Key");
    for key in map.keys() {
        println!("{key}");
    }
    println!("\nОтдельно перебираем значения value");
    for value in map.values() {
        println!("{value}");
    }
}
