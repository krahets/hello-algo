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

/* Driver code */
fn main() {
    // [region]{builtin_hash}
    let num = 3;
    let mut num_hasher = DefaultHasher::new();
    num.hash(&mut num_hasher);
    let hash_num = num_hasher.finish();
    println!("Integer {} has hash value {}", num, hash_num);
    // Integer 3 has hash value 568126464209439262

    let bol = true;
    let mut bol_hasher = DefaultHasher::new();
    bol.hash(&mut bol_hasher);
    let hash_bol = bol_hasher.finish();
    println!("Boolean {} has hash value {}", bol, hash_bol);
    // Boolean true has hash value 4952851536318644461

    let dec: f32 = 3.14159;
    let mut dec_hasher = DefaultHasher::new();
    dec.to_bits().hash(&mut dec_hasher);
    let hash_dec = dec_hasher.finish();
    println!("Bit representation of floating-point number {} has hash value {}", dec, hash_dec);
    // Bit representation of floating-point number 3.14159 has hash value 2566941990314602357

    let str = "Hello 算法";
    let mut str_hasher = DefaultHasher::new();
    str.hash(&mut str_hasher);
    let hash_str = str_hasher.finish();
    println!("String '{}' has hash value {}", str, hash_str);
    // String 'Hello 算法' has hash value 16092673739211250988

    let tup = (&12836, &"小哈");
    let mut tup_hasher = DefaultHasher::new();
    tup.hash(&mut tup_hasher);
    let hash_tup = tup_hasher.finish();
    println!("Tuple {:?} has hash value {}", tup, hash_tup);
    // Tuple (12836, "小哈") has hash value 1885128010422702749

    let node = ListNode::new(42);
    let mut node_hasher = DefaultHasher::new();
    node.borrow().val.hash(&mut node_hasher);
    let hash_node = node_hasher.finish();
    println!("Value in node {:?} has hash value {}", node, hash_node);
    // Value in node RefCell { value: ListNode { val: 42, next: None } } has hash value 15387811073369036852
    // [endregion]{builtin_hash}
}
