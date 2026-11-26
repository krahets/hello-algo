/*
 * File: hash_map.rs
 * Created Time: 2023-02-05
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::print_util;

use std::collections::HashMap;

/* Демонстрационный код */
pub fn main() {
    // Создать хеш-таблицу
    let mut map = HashMap::new();

    // Вставка
    // Добавить в таблицу пару (key, value)
    map.insert(12836, "Сяо Ха");
    map.insert(15937, "Сяо Ло");
    map.insert(16750, "Сяо Суань");
    map.insert(13276, "Сяо Фа");
    map.insert(10583, "Сяо Я");
    println!("\nХеш-таблица после вставки:\nКлюч -> Значение");
    print_util::print_hash_map(&map);

    // Поиск
    // Получить из таблицы значение value по ключу key
    let name = map.get(&15937).copied().unwrap();
    println!("\nИмя студента с номером 15937: {name}");

    // Удаление
    // Удалить из таблицы пару (key, value)
    _ = map.remove(&10583);
    println!("\nХеш-таблица после удаления 10583:\nКлюч -> Значение");
    print_util::print_hash_map(&map);

    // Обход хеш-таблицы
    println!("\nОбход пар «ключ -> значение»");
    print_util::print_hash_map(&map);
    println!("\nОбход только ключей");
    for key in map.keys() {
        println!("{key}");
    }
    println!("\nОбход только значений");
    for value in map.values() {
        println!("{value}");
    }
}
