/*
 * File: simple_hash.rs
 * Created Time: 2023-09-07
 * Author: night-cruise (2586447362@qq.com)
 */

/* 加法哈希 */
fn add_hash(key: &str) -> i32 {
    let mut hash: i64 = 0;
    const MODULUS: i64 = 1000000007;

    for char in key.chars() {
        hash = (hash + char as i64) % MODULUS;
    }

    hash as i32
}

/* 乘法哈希 */
fn mul_hash(key: &str) -> i32 {
    let mut hash: i64 = 0;
    const MODULUS: i64 = 1000000007;

    for char in key.chars() {
        hash = (31 * hash + char as i64) % MODULUS;
    }

    hash as i32
}

/* 异或哈希 */
fn xor_hash(key: &str) -> i32 {
    let mut hash: i64 = 0;
    const MODULUS: i64 = 1000000007;

    for char in key.chars() {
        hash ^= char as i64;
    }

    (hash & MODULUS) as i32
}

/* 旋转哈希 */
fn rot_hash(key: &str) -> i32 {
    let mut hash: i64 = 0;
    const MODULUS: i64 = 1000000007;

    for char in key.chars() {
        hash = ((hash << 4) ^ (hash >> 28) ^ char as i64) % MODULUS;
    }

    hash as i32
}

/* Driver Code */
fn main() {
    let key = "Hello 算法";

    let hash = add_hash(key);
    println!("加法哈希值为 {hash}");

    let hash = mul_hash(key);
    println!("乘法哈希值为 {hash}");

    let hash = xor_hash(key);
    println!("异或哈希值为 {hash}");

    let hash = rot_hash(key);
    println!("旋转哈希值为 {hash}");
}
