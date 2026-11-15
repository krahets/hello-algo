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
    // 初始化雜湊表
    let mut map = HashMap::new();
    // [endregion]{init_hash_map}

    // [region]{add_pairs}
    // 新增操作
    // 在雜湊表中新增鍵值對 (key, value)
    map.insert(12836, "小哈");
    map.insert(15937, "小囉");
    map.insert(16750, "小算");
    map.insert(13276, "小法");
    map.insert(10583, "小鴨");
    // [endregion]{add_pairs}
    println!("\n新增完成後，雜湊表為\nKey -> Value");
    print_util::print_hash_map(&map);

    // [region]{get_value}
    // 查詢操作
    // 向雜湊表中輸入鍵 key ，得到值 value
    let name = map.get(&15937).copied().unwrap();
    // [endregion]{get_value}
    println!("\n輸入學號 15937 ，查詢到姓名 {name}");

    // [region]{remove_pair}
    // 刪除操作
    // 在雜湊表中刪除鍵值對 (key, value)
    _ = map.remove(&10583);
    // [endregion]{remove_pair}
    println!("\n刪除 10583 後，雜湊表為\nKey -> Value");
    print_util::print_hash_map(&map);

    println!("\n走訪鍵值對 Key->Value");
    // [region]{iterate_pairs}
    // 走訪雜湊表
    // 走訪鍵值對 key->value
    for (key, value) in &map {
        println!("{key} -> {value}");
    }
    // [endregion]{iterate_pairs}

    println!("\n單獨走訪鍵 Key");
    // [region]{iterate_keys}
    // 單獨走訪鍵 key
    for key in map.keys() {
        println!("{key}");
    }
    // [endregion]{iterate_keys}

    println!("\n單獨走訪值 value");
    // [region]{iterate_values}
    // 單獨走訪值 value
    for value in map.values() {
        println!("{value}");
    }
    // [endregion]{iterate_values}
}
