/*
 * File: hash_map.rs
 * Created Time: 2023-02-05
 * Author: codingonion (coderonion@gmail.com)
 */

include!("../include/include.rs");

use std::collections::HashMap;

/* Driver Code */
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
    println!("\n新增完成後，雜湊表為\nKey -> Value");
    print_util::print_hash_map(&map);

    // 查詢操作
    // 向雜湊表中輸入鍵 key ，得到值 value
    let name = map.get(&15937).copied().unwrap();
    println!("\n輸入學號 15937 ，查詢到姓名 {name}");

    // 刪除操作
    // 在雜湊表中刪除鍵值對 (key, value)
    _ = map.remove(&10583);
    println!("\n刪除 10583 後，雜湊表為\nKey -> Value");
    print_util::print_hash_map(&map);

    // 走訪雜湊表
    println!("\n走訪鍵值對 Key->Value");
    print_util::print_hash_map(&map);
    println!("\n單獨走訪鍵 Key");
    for key in map.keys() {
        println!("{key}");
    }
    println!("\n單獨走訪值 value");
    for value in map.values() {
        println!("{value}");
    }
}
