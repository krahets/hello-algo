/*
 * File: simple_hash.rs
 * Created Time: 2023-09-07
 * Author: night-cruise (2586447362@qq.com)
 */

/* Аддитивное хеширование */
fn add_hash(key: &str) -> i32 {
    let mut hash = 0_i64;
    const MODULUS: i64 = 1000000007;

    for c in key.chars() {
        hash = (hash + c as i64) % MODULUS;
    }

    hash as i32
}

/* Мультипликативное хеширование */
fn mul_hash(key: &str) -> i32 {
    let mut hash = 0_i64;
    const MODULUS: i64 = 1000000007;

    for c in key.chars() {
        hash = (31 * hash + c as i64) % MODULUS;
    }

    hash as i32
}

/* XOR-хеширование */
fn xor_hash(key: &str) -> i32 {
    let mut hash = 0_i64;
    const MODULUS: i64 = 1000000007;

    for c in key.chars() {
        hash ^= c as i64;
    }

    (hash & MODULUS) as i32
}

/* Вращательное хеширование */
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
    let key = "Hello Algo";

    let hash = add_hash(key);
    println!("Аддитивное хешированиезначениеравно {hash}");

    let hash = mul_hash(key);
    println!("Мультипликативное хешированиезначениеравно {hash}");

    let hash = xor_hash(key);
    println!("XOR-хешированиезначениеравно {hash}");

    let hash = rot_hash(key);
    println!("Вращательное хешированиезначениеравно {hash}");
}
