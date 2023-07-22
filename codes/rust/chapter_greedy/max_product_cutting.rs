/*
 * File: coin_change_greedy.rs
 * Created Time: 2023-07-22
 * Author: night-cruise (2586447362@qq.com)
 */

/* 最大切分乘积：贪心 */
fn max_product_cutting(n: i32) -> i32 {
    // 当 n <= 3 时，必须切分出一个 1
    if n <= 3 {
        return 1 * (n - 1);
    }
    // 贪心地切分出 3 ，a 为 3 的个数，b 为余数
    let a = n / 3;
    let b = n % 3;
    if b == 1 {
        // 当余数为 1 时，将一对 1 * 3 转化为 2 * 2
        3_i32.pow(a as u32 - 1) * 2 * 2
    } else if b == 2 {
        // 当余数为 2 时，不做处理
        3_i32.pow(a as u32) * 2
    } else {
        // 当余数为 0 时，不做处理
        3_i32.pow(a as u32)
    }
}

/* Driver Code */
fn main() {
    let n = 58;

    // 贪心算法
    let res = max_product_cutting(n);
    println!("最大切分乘积为 {}", res);
}
