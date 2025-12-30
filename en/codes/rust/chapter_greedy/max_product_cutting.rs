/*
 * File: coin_change_greedy.rs
 * Created Time: 2023-07-22
 * Author: night-cruise (2586447362@qq.com)
 */

/* Max product cutting: Greedy algorithm */
fn max_product_cutting(n: i32) -> i32 {
    // When n <= 3, must cut out a 1
    if n <= 3 {
        return 1 * (n - 1);
    }
    // Greedily cut out 3, a is the number of 3s, b is the remainder
    let a = n / 3;
    let b = n % 3;
    if b == 1 {
        // When the remainder is 1, convert a pair of 1 * 3 to 2 * 2
        3_i32.pow(a as u32 - 1) * 2 * 2
    } else if b == 2 {
        // When the remainder is 2, do nothing
        3_i32.pow(a as u32) * 2
    } else {
        // When the remainder is 0, do nothing
        3_i32.pow(a as u32)
    }
}

/* Driver Code */
fn main() {
    let n = 58;

    // Greedy algorithm
    let res = max_product_cutting(n);
    println!("Maximum cutting product is {}", res);
}
