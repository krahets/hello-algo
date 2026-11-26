/*
 * File: hash_map.rs
 * Created Time: 2023-02-05
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::print_util;

use std::collections::HashMap;

/* 主程式 */
pub fn main() {
    // 初始化雜湊表
    let mut map = HashMap::new();

    // 新增操作
    // 在雜湊表中新增鍵值對 (key, value)
    map.insert(12836, "小哈");
    map.insert(15937, "小囉");
    map.insert(16750, "小算");
    map.insert(13276, "小法");
    map.insert(10583, "小鴨");
    println!("\n新增後的雜湊表\nKey -> Value");
    print_util::print_hash_map(&map);

    // 查詢操作
    // 輸入鍵 key，從雜湊表取得對應的值 value
    let name = map.get(&15937).copied().unwrap();
    println!("\n輸入學號 15937，查得姓名 {name}");

    // 刪除操作
    // 從雜湊表刪除鍵值對 (key, value)
    _ = map.remove(&10583);
    println!("\n刪除 10583 後的雜湊表\nKey -> Value");
    print_util::print_hash_map(&map);

    // 走訪雜湊表
    println!("\n走訪鍵值對 Key->Value");
    print_util::print_hash_map(&map);
    println!("\n只走訪鍵 Key");
    for key in map.keys() {
        println!("{key}");
    }
    println!("\n只走訪值 value");
    for value in map.values() {
        println!("{value}");
    }
}
