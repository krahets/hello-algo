/*
 * File: build_in_hash.rs
 * Created Time: 2023-7-6
 * Author: WSL0809 (wslzzy@outlook.com)
 */

use hello_algo_rust::include::ListNode;

use std::collections::hash_map::DefaultHasher;
use std::hash::{Hash, Hasher};

/* Демонстрационный код */
fn main() {
    let num = 3;
    let mut num_hasher = DefaultHasher::new();
    num.hash(&mut num_hasher);
    let hash_num = num_hasher.finish();
    println!("Целое число {} имеет хеш {}", num, hash_num);

    let bol = true;
    let mut bol_hasher = DefaultHasher::new();
    bol.hash(&mut bol_hasher);
    let hash_bol = bol_hasher.finish();
    println!("Логическое значение {} имеет хеш {}", bol, hash_bol);

    let dec: f32 = 3.14159;
    let mut dec_hasher = DefaultHasher::new();
    dec.to_bits().hash(&mut dec_hasher);
    let hash_dec = dec_hasher.finish();
    println!("Вещественное число {} имеет хеш {}", dec, hash_dec);

    let str = "Hello 算法";
    let mut str_hasher = DefaultHasher::new();
    str.hash(&mut str_hasher);
    let hash_str = str_hasher.finish();
    println!("Строка {} имеет хеш {}", str, hash_str);

    let arr = (&12836, &"小哈");
    let mut tup_hasher = DefaultHasher::new();
    arr.hash(&mut tup_hasher);
    let hash_tup = tup_hasher.finish();
    println!("Кортеж {:?} имеет хеш {}", arr, hash_tup);

    let node = ListNode::new(42);
    let mut hasher = DefaultHasher::new();
    node.borrow().val.hash(&mut hasher);
    let hash = hasher.finish();
    println!("Значение узла {:?} имеет хеш {}", node, hash);
}
