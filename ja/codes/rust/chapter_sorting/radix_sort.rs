/*
 * File: radix_sort.rs
 * Created Time: 2023-07-09
 * Author: night-cruise (2586447362@qq.com)
 */

use hello_algo_rust::include::print_util;

/* 要素 num の下から k 桁目を取得。ここで exp = 10^(k-1) */
fn digit(num: i32, exp: i32) -> usize {
    // k ではなく exp を渡し、負荷の高いべき乗計算の繰り返しを避ける
    return ((num / exp) % 10) as usize;
}

/* カウントソート（nums の下から k 桁目でソート） */
fn counting_sort_digit(nums: &mut [i32], exp: i32) {
    // 十進数の各桁は 0～9 なので、長さ 10 のバケット配列を用意
    let mut counter = [0; 10];
    let n = nums.len();
    // 0～9 の各数字の出現回数を数える
    for i in 0..n {
        let d = digit(nums[i], exp); // nums[i] の下から k 桁目を d とする
        counter[d] += 1; // 数字 d の出現回数を数える
    }
    // 累積和を求め、出現回数を配列のインデックスに対応する値に変換
    for i in 1..10 {
        counter[i] += counter[i - 1];
    }
    // 配列を逆順に走査し、バケットの集計値を使って各要素を res に書き込む
    let mut res = vec![0; n];
    for i in (0..n).rev() {
        let d = digit(nums[i], exp);
        let j = counter[d] - 1; // 配列内での d のインデックス j を求める
        res[j] = nums[i]; // 現在の要素をインデックス j に書き込む
        counter[d] -= 1; // d の個数を 1 減らす
    }
    // 結果で元の配列 nums を上書き
    nums.copy_from_slice(&res);
}

/* 基数ソート */
fn radix_sort(nums: &mut [i32]) {
    // 配列の最大値から最大桁数を求める
    let m = *nums.into_iter().max().unwrap();
    // 下位桁から上位桁へ順に走査
    let mut exp = 1;
    while exp <= m {
        counting_sort_digit(nums, exp);
        exp *= 10;
    }
}

/* 実行例 */
fn main() {
    // 基数ソート
    let mut nums = [
        10546151, 35663510, 42865989, 34862445, 81883077, 88906420, 72429244, 30524779, 82060337,
        63832996,
    ];
    radix_sort(&mut nums);
    print!("基数ソート後の nums = ");
    print_util::print_array(&nums);
}
