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
    println!("Хеш-значение целого числа {} = {}", num, hash_num);
    // Хеш-значение целого числа 3 = 568126464209439262

    let bol = true;
    let mut bol_hasher = DefaultHasher::new();
    bol.hash(&mut bol_hasher);
    let hash_bol = bol_hasher.finish();
    println!("Хеш-значение булева значения {} = {}", bol, hash_bol);
    // Хеш-значение булева значения true = 4952851536318644461

    let dec: f32 = 3.14159;
    let mut dec_hasher = DefaultHasher::new();
    dec.to_bits().hash(&mut dec_hasher);
    let hash_dec = dec_hasher.finish();
    println!("Хеш-значение десятичного числа {} = {}", dec, hash_dec);
    // Хеш-значение десятичного числа 3.14159 = 2566941990314602357

    let str = "Hello Algo";
    let mut str_hasher = DefaultHasher::new();
    str.hash(&mut str_hasher);
    let hash_str = str_hasher.finish();
    println!("Хеш-значение строки «{}» = {}", str, hash_str);
    // Хеш-значение строки «Hello Algo» = 17488118421444754255

    let tup = (&12836, &"Сяо Ха");
    let mut tup_hasher = DefaultHasher::new();
    tup.hash(&mut tup_hasher);
    let hash_tup = tup_hasher.finish();
    println!("Хеш-значение кортежа {:?} = {}", tup, hash_tup);
    // Хеш-значение кортежа (12836, "Сяо Ха") = 11477145348646942370

    let node = ListNode::new(42);
    let mut node_hasher = DefaultHasher::new();
    node.borrow().val.hash(&mut node_hasher);
    let hash_node = node_hasher.finish();
    println!("Хеш-значение объекта узла {:?} = {}", node, hash_node);
    // Хеш-значение объекта узла RefCell { value: ListNode { val: 42, next: None } } = 15387811073369036852
    // [endregion]{builtin_hash}
}
