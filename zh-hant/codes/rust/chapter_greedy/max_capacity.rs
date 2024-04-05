/*
 * File: coin_change_greedy.rs
 * Created Time: 2023-07-22
 * Author: night-cruise (2586447362@qq.com)
 */

/* 最大容量：貪婪 */
fn max_capacity(ht: &[i32]) -> i32 {
    // 初始化 i, j，使其分列陣列兩端
    let mut i = 0;
    let mut j = ht.len() - 1;
    // 初始最大容量為 0
    let mut res = 0;
    // 迴圈貪婪選擇，直至兩板相遇
    while i < j {
        // 更新最大容量
        let cap = std::cmp::min(ht[i], ht[j]) * (j - i) as i32;
        res = std::cmp::max(res, cap);
        // 向內移動短板
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

    // 貪婪演算法
    let res = max_capacity(&ht);
    println!("最大容量為 {}", res);
}
