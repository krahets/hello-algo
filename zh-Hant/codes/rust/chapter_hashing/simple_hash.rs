/*
 * File: simple_hash.rs
 * Created Time: 2023-09-07
 * Author: night-cruise (2586447362@qq.com)
 */

/* 加法雜湊 */
fn add_hash(key: &str) -> i32 {
    let mut hash = 0_i64;
    const MODULUS: i64 = 1000000007;

    for c in key.chars() {
        hash = (hash + c as i64) % MODULUS;
    }

    hash as i32
}

/* 乘法雜湊 */
fn mul_hash(key: &str) -> i32 {
    let mut hash = 0_i64;
    const MODULUS: i64 = 1000000007;

    for c in key.chars() {
        hash = (31 * hash + c as i64) % MODULUS;
    }

    hash as i32
}

/* 互斥或雜湊 */
fn xor_hash(key: &str) -> i32 {
    let mut hash = 0_i64;
    const MODULUS: i64 = 1000000007;

    for c in key.chars() {
        hash ^= c as i64;
    }

    (hash & MODULUS) as i32
}

/* 旋轉雜湊 */
fn rot_hash(key: &str) -> i32 {
    let mut hash = 0_i64;
    const MODULUS: i64 = 1000000007;

    for c in key.chars() {
        hash = ((hash << 4) ^ (hash >> 28) ^ c as i64) % MODULUS;
    }

    hash as i32
}

/* Driver Code */
fn main() {
    let key = "Hello 演算法";

    let hash = add_hash(key);
    println!("加法雜湊值為 {hash}");

    let hash = mul_hash(key);
    println!("乘法雜湊值為 {hash}");

    let hash = xor_hash(key);
    println!("互斥或雜湊值為 {hash}");

    let hash = rot_hash(key);
    println!("旋轉雜湊值為 {hash}");
}
