/*
 * File: hash_map.rs
 * Created Time: 2023-02-05
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::print_util;

use std::collections::HashMap;

/* 実行用コード */
pub fn main() {
    // ハッシュテーブルを初期化する
    let mut map = HashMap::new();

    // 追加操作
    // ハッシュテーブルにキーと値のペア (key, value) を追加する
    map.insert(12836, "小哈");
    map.insert(15937, "小啰");
    map.insert(16750, "小算");
    map.insert(13276, "小法");
    map.insert(10583, "小鸭");
    println!("\n追加後のハッシュテーブル\nKey -> Value");
    print_util::print_hash_map(&map);

    // 取得操作
    // ハッシュテーブルにキー key を渡し、値 value を取得する
    let name = map.get(&15937).copied().unwrap();
    println!("\n学生番号 15937 に対応する氏名は {name}");

    // 削除操作
    // ハッシュテーブルからキーと値のペア (key, value) を削除する
    _ = map.remove(&10583);
    println!("\n10583 を削除した後のハッシュテーブル\nKey -> Value");
    print_util::print_hash_map(&map);

    // ハッシュテーブルを走査する
    println!("\nキーと値のペア Key->Value を走査する");
    print_util::print_hash_map(&map);
    println!("\nキー Key だけを走査する");
    for key in map.keys() {
        println!("{key}");
    }
    println!("\n値 value だけを走査する");
    for value in map.values() {
        println!("{value}");
    }
}
