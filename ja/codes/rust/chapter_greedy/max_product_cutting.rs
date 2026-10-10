/*
 * File: coin_change_greedy.rs
 * Created Time: 2023-07-22
 * Author: night-cruise (2586447362@qq.com)
 */

/* 最大切断積：貪欲法 */
fn max_product_cutting(n: i32) -> i32 {
    // n <= 3 のときは、必ず 1 を切り出す
    if n <= 3 {
        return 1 * (n - 1);
    }
    // 貪欲に 3 を切り出し、a を 3 の個数、b を余りとする
    let a = n / 3;
    let b = n % 3;
    if b == 1 {
        // 余りが 1 のときは、1 * 3 を 2 * 2 に変える
        3_i32.pow(a as u32 - 1) * 2 * 2
    } else if b == 2 {
        // 余りが 2 のときは、そのままにする
        3_i32.pow(a as u32) * 2
    } else {
        // 余りが 0 のときは、そのままにする
        3_i32.pow(a as u32)
    }
}

/* Driver Code */
fn main() {
    let n = 58;

    // 貪欲法
    let res = max_product_cutting(n);
    println!("最大分割積は {}", res);
}
