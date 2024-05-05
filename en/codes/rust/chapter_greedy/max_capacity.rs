/*
 * File: coin_change_greedy.rs
 * Created Time: 2023-07-22
 * Author: night-cruise (2586447362@qq.com)
 */

/* Maximum capacity: Greedy */
fn max_capacity(ht: &[i32]) -> i32 {
    // Initialize i, j, making them split the array at both ends
    let mut i = 0;
    let mut j = ht.len() - 1;
    // Initial maximum capacity is 0
    let mut res = 0;
    // Loop for greedy selection until the two boards meet
    while i < j {
        // Update maximum capacity
        let cap = std::cmp::min(ht[i], ht[j]) * (j - i) as i32;
        res = std::cmp::max(res, cap);
        // Move the shorter board inward
        if ht[i] < ht[j] {
            i += 1;
        } else {
            j -= 1;
        }
    }
    res
}

/* Driver Code */
fn main() {
    let ht = [3, 8, 5, 2, 7, 7, 3, 4];

    // Greedy algorithm
    let res = max_capacity(&ht);
    println!("The maximum capacity is {}", res);
}
