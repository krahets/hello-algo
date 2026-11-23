/*
 * File: coin_change_greedy.rs
 * Created Time: 2023-07-22
 * Author: night-cruise (2586447362@qq.com)
 */

/* Maximum product after splitting: greedy algorithm */
fn max_product_cutting(n: i32) -> i32 {
    // When n <= 3, one part must be 1
    if n <= 3 {
        return 1 * (n - 1);
    }
    // Greedily split off parts of size 3; a is the number of 3s and b is the remainder
    let a = n / 3;
    let b = n % 3;
    if b == 1 {
        // When the remainder is 1, replace one pair 1 * 3 with 2 * 2
        3_i32.pow(a as u32 - 1) * 2 * 2
    } else if b == 2 {
        // When the remainder is 2, no adjustment is needed
        3_i32.pow(a as u32) * 2
    } else {
        // When the remainder is 0, no adjustment is needed
        3_i32.pow(a as u32)
    }
}

/* Driver code */
fn main() {
    let n = 58;

    // Greedy algorithm
    let res = max_product_cutting(n);
    println!("Maximum product after cutting: {}", res);
}
