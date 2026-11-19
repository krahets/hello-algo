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

/* 実行用コード */
fn main() {
    // [region]{builtin_hash}
    let num = 3;
    let mut num_hasher = DefaultHasher::new();
    num.hash(&mut num_hasher);
    let hash_num = num_hasher.finish();
    println!("整数 {} のハッシュ値は {}", num, hash_num);
    // 整数 3 のハッシュ値は 568126464209439262

    let bol = true;
    let mut bol_hasher = DefaultHasher::new();
    bol.hash(&mut bol_hasher);
    let hash_bol = bol_hasher.finish();
    println!("真偽値 {} のハッシュ値は {}", bol, hash_bol);
    // 真偽値 true のハッシュ値は 4952851536318644461

    let dec: f32 = 3.14159;
    let mut dec_hasher = DefaultHasher::new();
    dec.to_bits().hash(&mut dec_hasher);
    let hash_dec = dec_hasher.finish();
    println!("小数 {} のハッシュ値は {}", dec, hash_dec);
    // 小数 3.14159 のハッシュ値は 2566941990314602357

    let str = "Hello 算法";
    let mut str_hasher = DefaultHasher::new();
    str.hash(&mut str_hasher);
    let hash_str = str_hasher.finish();
    println!("文字列「{}」のハッシュ値は {}", str, hash_str);
    // 文字列「Hello 算法」のハッシュ値は 16092673739211250988

    let tup = (&12836, &"小哈");
    let mut tup_hasher = DefaultHasher::new();
    tup.hash(&mut tup_hasher);
    let hash_tup = tup_hasher.finish();
    println!("タプル {:?} のハッシュ値は {}", tup, hash_tup);
    // タプル (12836, "小哈") のハッシュ値は 1885128010422702749

    let node = ListNode::new(42);
    let mut node_hasher = DefaultHasher::new();
    node.borrow().val.hash(&mut node_hasher);
    let hash_node = node_hasher.finish();
    println!("ノードオブジェクト {:?} のハッシュ値は {}", node, hash_node);
    // ノードオブジェクト RefCell { value: ListNode { val: 42, next: None } } のハッシュ値は 15387811073369036852
    // [endregion]{builtin_hash}
}
