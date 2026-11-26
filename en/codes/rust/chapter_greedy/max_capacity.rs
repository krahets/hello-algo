/*
 * File: coin_change_greedy.rs
 * Created Time: 2023-07-22
 * Author: night-cruise (2586447362@qq.com)
 */

/* Greedy maximum capacity algorithm */
fn max_capacity(ht: &[i32]) -> i32 {
    // Start i and j at opposite ends of the array
    let mut i = 0;
    let mut j = ht.len() - 1;
    // The initial maximum capacity is 0
    let mut res = 0;
    // Make greedy choices until the two pointers meet
    while i < j {
        // Update the maximum capacity
        let cap = std::cmp::min(ht[i], ht[j]) * (j - i) as i32;
        res = std::cmp::max(res, cap);
        // Move the pointer at the shorter board inward
        if ht[i] < ht[j] {
            i += 1;
        } else {
            j -= 1;
        }
    }
    res
}

/* Driver code */
fn main() {
    let ht = [3, 8, 5, 2, 7, 7, 3, 4];

    // Greedy algorithm
    let res = max_capacity(&ht);
    println!("The maximum capacity is {}", res);
}
