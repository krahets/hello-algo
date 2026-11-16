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
    println!("整數 {} 的雜湊值為 {}", num, hash_num);
    // 整數 3 的雜湊值為 568126464209439262

    let bol = true;
    let mut bol_hasher = DefaultHasher::new();
    bol.hash(&mut bol_hasher);
    let hash_bol = bol_hasher.finish();
    println!("布林量 {} 的雜湊值為 {}", bol, hash_bol);
    // 布林量 true 的雜湊值為 4952851536318644461

    let dec: f32 = 3.14159;
    let mut dec_hasher = DefaultHasher::new();
    dec.to_bits().hash(&mut dec_hasher);
    let hash_dec = dec_hasher.finish();
    println!("小數 {} 的雜湊值為 {}", dec, hash_dec);
    // 小數 3.14159 的雜湊值為 2566941990314602357

    let str = "Hello 演算法";
    let mut str_hasher = DefaultHasher::new();
    str.hash(&mut str_hasher);
    let hash_str = str_hasher.finish();
    println!("字串“{}”的雜湊值為 {}", str, hash_str);
    // 字串“Hello 演算法”的雜湊值為 16092673739211250988

    let tup = (&12836, &"小哈");
    let mut tup_hasher = DefaultHasher::new();
    tup.hash(&mut tup_hasher);
    let hash_tup = tup_hasher.finish();
    println!("元組 {:?} 的雜湊值為 {}", tup, hash_tup);
    // 元組 (12836, "小哈") 的雜湊值為 1885128010422702749

    let node = ListNode::new(42);
    let mut node_hasher = DefaultHasher::new();
    node.borrow().val.hash(&mut node_hasher);
    let hash_node = node_hasher.finish();
    println!("節點物件 {:?} 的雜湊值為 {}", node, hash_node);
    // 節點物件 RefCell { value: ListNode { val: 42, next: None } } 的雜湊值為 15387811073369036852
    // [endregion]{builtin_hash}
}
