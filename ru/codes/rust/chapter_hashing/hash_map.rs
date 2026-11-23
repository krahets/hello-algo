/*
 * File: hash_map.rs
 * Created Time: 2023-02-05
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::print_util;

use std::collections::HashMap;

/* Driver Code */
pub fn main() {
    // Инициализация хеш-таблицы
    let mut map = HashMap::new();

    // Операция добавления
    // Добавить пару (key, value) в хеш-таблицу
    map.insert(12836, "Сяо Ха");
    map.insert(15937, "Сяо Ло");
    map.insert(16750, "Сяо Суань");
    map.insert(13276, "Сяо Фа");
    map.insert(10583, "Сяо Я");
    println!("\nПосле добавления хеш-таблица имеет вид\nКлюч -> Значение");
    print_util::print_hash_map(&map);

    // Операция поиска
    // Передать ключ key в хеш-таблицу и получить значение value
    let name = map.get(&15937).copied().unwrap();
    println!("\nДля номера 15937 найдено имя {name}");

    // Операция удаления
    // Удалить пару (key, value) из хеш-таблицы
    _ = map.remove(&10583);
    println!("\nПосле удаления 10583 хеш-таблица имеет вид\nКлюч -> Значение");
    print_util::print_hash_map(&map);

    // Обход хеш-таблицы
    println!("\nОтдельный обход пар ключ-значение");
    print_util::print_hash_map(&map);
    println!("\nОтдельный обход ключей");
    for key in map.keys() {
        println!("{key}");
    }
    println!("\nОтдельный обход значений");
    for value in map.values() {
        println!("{value}");
    }
}
