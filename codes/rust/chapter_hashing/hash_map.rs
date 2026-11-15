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
    // 初始化哈希表
    let mut map = HashMap::new();
    // [endregion]{init_hash_map}

    // [region]{add_pairs}
    // 添加操作
    // 在哈希表中添加键值对 (key, value)
    map.insert(12836, "小哈");
    map.insert(15937, "小啰");
    map.insert(16750, "小算");
    map.insert(13276, "小法");
    map.insert(10583, "小鸭");
    // [endregion]{add_pairs}
    println!("\n添加完成后，哈希表为\nKey -> Value");
    print_util::print_hash_map(&map);

    // [region]{get_value}
    // 查询操作
    // 向哈希表中输入键 key ，得到值 value
    let name = map.get(&15937).copied().unwrap();
    // [endregion]{get_value}
    println!("\n输入学号 15937 ，查询到姓名 {name}");

    // [region]{remove_pair}
    // 删除操作
    // 在哈希表中删除键值对 (key, value)
    _ = map.remove(&10583);
    // [endregion]{remove_pair}
    println!("\n删除 10583 后，哈希表为\nKey -> Value");
    print_util::print_hash_map(&map);

    println!("\n遍历键值对 Key->Value");
    // [region]{iterate_pairs}
    // 遍历哈希表
    // 遍历键值对 key->value
    for (key, value) in &map {
        println!("{key} -> {value}");
    }
    // [endregion]{iterate_pairs}

    println!("\n单独遍历键 Key");
    // [region]{iterate_keys}
    // 单独遍历键 key
    for key in map.keys() {
        println!("{key}");
    }
    // [endregion]{iterate_keys}

    println!("\n单独遍历值 value");
    // [region]{iterate_values}
    // 单独遍历值 value
    for value in map.values() {
        println!("{value}");
    }
    // [endregion]{iterate_values}
}
