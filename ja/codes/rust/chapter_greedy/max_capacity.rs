/*
 * File: coin_change_greedy.rs
 * Created Time: 2023-07-22
 * Author: night-cruise (2586447362@qq.com)
 */

/* 最大容量：貪欲法 */
fn max_capacity(ht: &[i32]) -> i32 {
    // i, j を初期化し、配列の両端をそれぞれ指すようにする
    let mut i = 0;
    let mut j = ht.len() - 1;
    // 最大容量の初期値は 0
    let mut res = 0;
    // 2 枚の板が出会うまで貪欲な選択を繰り返す
    while i < j {
        // 最大容量を更新する
        let cap = std::cmp::min(ht[i], ht[j]) * (j - i) as i32;
        res = std::cmp::max(res, cap);
        // 低い方の仕切り板を内側に移動する
        if ht[i] < ht[j] {
            i += 1;
        } else {
            j -= 1;
        }
    }
    res
}

/* 実行用コード */
fn main() {
    let ht = [3, 8, 5, 2, 7, 7, 3, 4];

    // 貪欲アルゴリズム
    let res = max_capacity(&ht);
    println!("最大容量は {}", res);
}
