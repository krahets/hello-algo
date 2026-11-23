/*
 * File: coin_change_greedy.rs
 * Created Time: 2023-07-22
 * Author: night-cruise (2586447362@qq.com)
 */

/* 分割後の積の最大化：貪欲法 */
fn max_product_cutting(n: i32) -> i32 {
    // n <= 3 の場合、必ず 1 を 1 つ切り出す必要がある
    if n <= 3 {
        return 1 * (n - 1);
    }
    // 貪欲に 3 を切り出す。a は 3 の個数、b は余り
    let a = n / 3;
    let b = n % 3;
    if b == 1 {
        // 余りが 1 の場合、1 * 3 の組を 2 * 2 に変換する
        3_i32.pow(a as u32 - 1) * 2 * 2
    } else if b == 2 {
        // 余りが 2 の場合、何もしない
        3_i32.pow(a as u32) * 2
    } else {
        // 余りが 0 の場合、何もしない
        3_i32.pow(a as u32)
    }
}

/* 実行用コード */
fn main() {
    let n = 58;

    // 貪欲アルゴリズム
    let res = max_product_cutting(n);
    println!("分割後の積の最大値は {}", res);
}
