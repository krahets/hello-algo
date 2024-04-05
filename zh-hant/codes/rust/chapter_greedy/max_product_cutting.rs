/*
 * File: coin_change_greedy.rs
 * Created Time: 2023-07-22
 * Author: night-cruise (2586447362@qq.com)
 */

/* 最大切分乘積：貪婪 */
fn max_product_cutting(n: i32) -> i32 {
    // 當 n <= 3 時，必須切分出一個 1
    if n <= 3 {
        return 1 * (n - 1);
    }
    // 貪婪地切分出 3 ，a 為 3 的個數，b 為餘數
    let a = n / 3;
    let b = n % 3;
    if b == 1 {
        // 當餘數為 1 時，將一對 1 * 3 轉化為 2 * 2
        3_i32.pow(a as u32 - 1) * 2 * 2
    } else if b == 2 {
        // 當餘數為 2 時，不做處理
        3_i32.pow(a as u32) * 2
    } else {
        // 當餘數為 0 時，不做處理
        3_i32.pow(a as u32)
    }
}

/* Driver Code */
fn main() {
    let n = 58;

    // 貪婪演算法
    let res = max_product_cutting(n);
    println!("最大切分乘積為 {}", res);
}
