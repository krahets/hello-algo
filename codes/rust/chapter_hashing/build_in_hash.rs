/*
 * File: build_in_hash.rs
 * Created Time: 2023-7-6
 * Author: WSL0809 (wslzzy@outlook.com)
 */

use hello_algo_rust::include::ListNode;

// [region]{import_hasher}
use std::collections::hash_map::DefaultHasher;
use std::hash::{Hash, Hasher};
// [endregion]{import_hasher}

/* Driver Code */
fn main() {
    // [region]{builtin_hash}
    let num = 3;
    let mut num_hasher = DefaultHasher::new();
    num.hash(&mut num_hasher);
    let hash_num = num_hasher.finish();
    println!("整数 {} 的哈希值为 {}", num, hash_num);
    // 整数 3 的哈希值为 568126464209439262

    let bol = true;
    let mut bol_hasher = DefaultHasher::new();
    bol.hash(&mut bol_hasher);
    let hash_bol = bol_hasher.finish();
    println!("布尔量 {} 的哈希值为 {}", bol, hash_bol);
    // 布尔量 true 的哈希值为 4952851536318644461

    let dec: f32 = 3.14159;
    let mut dec_hasher = DefaultHasher::new();
    dec.to_bits().hash(&mut dec_hasher);
    let hash_dec = dec_hasher.finish();
    println!("小数 {} 的哈希值为 {}", dec, hash_dec);
    // 小数 3.14159 的哈希值为 2566941990314602357

    let str = "Hello 算法";
    let mut str_hasher = DefaultHasher::new();
    str.hash(&mut str_hasher);
    let hash_str = str_hasher.finish();
    println!("字符串“{}”的哈希值为 {}", str, hash_str);
    // 字符串“Hello 算法”的哈希值为 16092673739211250988

    let tup = (&12836, &"小哈");
    let mut tup_hasher = DefaultHasher::new();
    tup.hash(&mut tup_hasher);
    let hash_tup = tup_hasher.finish();
    println!("元组 {:?} 的哈希值为 {}", tup, hash_tup);
    // 元组 (12836, "小哈") 的哈希值为 1885128010422702749

    let node = ListNode::new(42);
    let mut node_hasher = DefaultHasher::new();
    node.borrow().val.hash(&mut node_hasher);
    let hash_node = node_hasher.finish();
    println!("节点对象 {:?} 的哈希值为 {}", node, hash_node);
    // 节点对象 RefCell { value: ListNode { val: 42, next: None } } 的哈希值为 15387811073369036852
    // [endregion]{builtin_hash}
}
