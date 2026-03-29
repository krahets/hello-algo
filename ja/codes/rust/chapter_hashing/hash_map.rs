/*
 * File: hash_map.rs
 * Created Time: 2023-02-05
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::print_util;

use std::collections::HashMap;

/* Driver Code */
pub fn main() {
    // ハッシュテーブルを初期化
    let mut map = HashMap::new();

    // 追加操作
    // ハッシュテーブルにキーと値の組 (key, value) を追加する
    map.insert(12836, "シャオハー");
    map.insert(15937, "シャオロー");
    map.insert(16750, "シャオスワン");
    map.insert(13276, "シャオファー");
    map.insert(10583, "シャオヤー");
    println!("\n追加後、ハッシュテーブルは\nKey -> Value");
    print_util::print_hash_map(&map);

    // 検索操作
    // ハッシュテーブルにキー key を入力し、値 value を取得する
    let name = map.get(&15937).copied().unwrap();
    println!("\n学籍番号 15937 を入力すると、名前 {name} が見つかります");

    // 削除操作
    // ハッシュテーブルからキーと値の組 (key, value) を削除する
    _ = map.remove(&10583);
    println!("\n10583 を削除した後、ハッシュテーブルは\nKey -> Value");
    print_util::print_hash_map(&map);

    // ハッシュテーブルを走査
    println!("\nキーと値のペア Key->Value を走査");
    print_util::print_hash_map(&map);
    println!("\nキー Key のみを走査");
    for key in map.keys() {
        println!("{key}");
    }
    println!("\n値 value のみを走査");
    for value in map.values() {
        println!("{value}");
    }
}
