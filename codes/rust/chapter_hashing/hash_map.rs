/*
 * File: hash_map.rs
 * Created Time: 2023-02-05
 * Author: codingonion (coderonion@gmail.com)
 */

use std::collections::HashMap;

/* Driver Code */
fn main() {
    // 初始化哈希表
    let mut map = HashMap::new();

    // 添加操作
    // 在哈希表中添加键值对 (key, value)
    map.insert(12836, "小哈");
    map.insert(15937, "小啰");
    map.insert(16750, "小算");
    map.insert(13276, "小法");
    map.insert(10583, "小鸭");
    println!("添加完成后，哈希表为\nKey -> Value");
    for (key, value) in &map {
        println!("{key} -> {value}");
    }

    println!();

    // 查询操作
    // 向哈希表中输入键 key，得到值 value
    let name = map.get(&15937).copied().unwrap();
    println!("输入学号 15937 ，查询到姓名 {name}");

    println!();

    // 删除操作
    // 在哈希表中删除键值对 (key, value)
    map.remove(&10583);
    println!("删除 10583 后，哈希表为\nKey -> Value");
    for (key, value) in &map {
        println!("{key} -> {value}");
    }

    println!();

    // 遍历哈希表
    println!("遍历键值对 Key -> Value");
    for (key, value) in &map {
        println!("{key} -> {value}");
    }

    println!();

    println!("单独遍历键 Key");
    for key in map.keys() {
        println!("{key}");
    }

    println!();

    println!("单独遍历值 Value");
    for value in map.values() {
        println!("{value}");
    }
}
