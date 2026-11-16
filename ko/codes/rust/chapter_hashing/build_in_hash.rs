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

/* 실행 코드 */
fn main() {
    // [region]{builtin_hash}
    let num = 3;
    let mut num_hasher = DefaultHasher::new();
    num.hash(&mut num_hasher);
    let hash_num = num_hasher.finish();
    println!("정수 {} → 해시값: {}", num, hash_num);
    // 정수 3 → 해시값: 568126464209439262

    let bol = true;
    let mut bol_hasher = DefaultHasher::new();
    bol.hash(&mut bol_hasher);
    let hash_bol = bol_hasher.finish();
    println!("불리언 값 {} → 해시값: {}", bol, hash_bol);
    // 불리언 값 true → 해시값: 4952851536318644461

    let dec: f32 = 3.14159;
    let mut dec_hasher = DefaultHasher::new();
    dec.to_bits().hash(&mut dec_hasher);
    let hash_dec = dec_hasher.finish();
    println!("소수 {} → 해시값: {}", dec, hash_dec);
    // 소수 3.14159 → 해시값: 2566941990314602357

    let str = "Hello 算法";
    let mut str_hasher = DefaultHasher::new();
    str.hash(&mut str_hasher);
    let hash_str = str_hasher.finish();
    println!("문자열 ‘{}’ → 해시값: {}", str, hash_str);
    // 문자열 ‘Hello 算法’ → 해시값: 16092673739211250988

    let tup = (&12836, &"小哈");
    let mut tup_hasher = DefaultHasher::new();
    tup.hash(&mut tup_hasher);
    let hash_tup = tup_hasher.finish();
    println!("튜플 {:?} → 해시값: {}", tup, hash_tup);
    // 튜플 (12836, "小哈") → 해시값: 1885128010422702749

    let node = ListNode::new(42);
    let mut node_hasher = DefaultHasher::new();
    node.borrow().val.hash(&mut node_hasher);
    let hash_node = node_hasher.finish();
    println!("노드 객체 {:?} → 해시값: {}", node, hash_node);
    // 노드 객체 RefCell { value: ListNode { val: 42, next: None } } → 해시값: 15387811073369036852
    // [endregion]{builtin_hash}
}
