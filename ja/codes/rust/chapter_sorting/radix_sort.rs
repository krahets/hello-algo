/*
 * File: radix_sort.rs
 * Created Time: 2023-07-09
 * Author: night-cruise (2586447362@qq.com)
 */

use hello_algo_rust::include::print_util;

/* 要素 num の下から k 桁目を取得（exp = 10^(k-1)） */
fn digit(num: i32, exp: i32) -> usize {
    // ここで高コストな累乗計算を繰り返さないよう、k ではなく exp を渡す
    return ((num / exp) % 10) as usize;
}

/* 計数ソート（nums の k 桁目でソート） */
fn counting_sort_digit(nums: &mut [i32], exp: i32) {
    // 10 進数の各桁は 0~9 の範囲なので、長さ 10 のバケット配列が必要
    let mut counter = [0; 10];
    let n = nums.len();
    // 0~9 の各数字の出現回数を集計する
    for i in 0..n {
        let d = digit(nums[i], exp); // nums[i] の第 k 位を取得し、d とする
        counter[d] += 1; // 数字 d の出現回数を数える
    }
    // 累積和を求め、「出現回数」を「配列インデックス」に変換する
    for i in 1..10 {
        counter[i] += counter[i - 1];
    }
    // 逆順に走査し、バケット内の集計結果に従って各要素を res に格納する
    let mut res = vec![0; n];
    for i in (0..n).rev() {
        let d = digit(nums[i], exp);
        let j = counter[d] - 1; // d の配列内インデックス j を取得する
        res[j] = nums[i]; // 現在の要素をインデックス j に格納する
        counter[d] -= 1; // d の個数を 1 減らす
    }
    // 結果で元の配列 nums を上書きする
    nums.copy_from_slice(&res);
}

/* 基数ソート */
fn radix_sort(nums: &mut [i32]) {
    // 最大桁数の判定用に配列の最大要素を取得
    let m = *nums.into_iter().max().unwrap();
    // 下位桁から上位桁の順に走査する
    let mut exp = 1;
    while exp <= m {
        counting_sort_digit(nums, exp);
        exp *= 10;
    }
}

/* Driver Code */
fn main() {
    // 基数ソート
    let mut nums = [
        10546151, 35663510, 42865989, 34862445, 81883077, 88906420, 72429244, 30524779, 82060337,
        63832996,
    ];
    radix_sort(&mut nums);
    print!("基数ソート完了後 nums = ");
    print_util::print_array(&nums);
}
