/*
 * File: hash_map.rs
 * Created Time: 2023-02-05
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::print_util;

use std::collections::HashMap;

/* 実行例 */
pub fn main() {
    // ハッシュ表を初期化する
    let mut map = HashMap::new();

    // 追加
    // ハッシュ表にペア (key, value) を追加する
    map.insert(12836, "小哈");
    map.insert(15937, "小啰");
    map.insert(16750, "小算");
    map.insert(13276, "小法");
    map.insert(10583, "小鸭");
    println!("\n追加後のハッシュ表\nKey -> Value");
    print_util::print_hash_map(&map);

    // 検索
    // ハッシュ表でキー key に対応する値 value を取得する
    let name = map.get(&15937).copied().unwrap();
    println!("\n学籍番号 15937 に対応する名前は {name}");

    // 削除
    // ハッシュ表からペア (key, value) を削除する
    _ = map.remove(&10583);
    println!("\n10583 を削除した後のハッシュ表\nKey -> Value");
    print_util::print_hash_map(&map);

    // ハッシュ表を走査する
    println!("\nキーと値のペアを順に表示 Key->Value");
    print_util::print_hash_map(&map);
    println!("\nキーだけを順に表示 Key");
    for key in map.keys() {
        println!("{key}");
    }
    println!("\n値だけを順に表示 value");
    for value in map.values() {
        println!("{value}");
    }
}
