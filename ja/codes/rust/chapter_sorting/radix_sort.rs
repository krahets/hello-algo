/*
 * File: radix_sort.rs
 * Created Time: 2023-07-09
 * Author: night-cruise (2586447362@qq.com)
 */

use hello_algo_rust::include::print_util;

/* 要素 num の第 k 桁を取得する。exp = 10^(k-1) とする */
fn digit(num: i32, exp: i32) -> usize {
    // k ではなく exp を渡すことで、ここで高コストのべき乗計算を繰り返すのを避ける
    return ((num / exp) % 10) as usize;
}

/* カウントソート（nums の第 k 桁に基づくソート） */
fn counting_sort_digit(nums: &mut [i32], exp: i32) {
    // 十進数の各桁の範囲は 0~9 なので、長さ 10 のバケット配列が必要
    let mut counter = [0; 10];
    let n = nums.len();
    // 0~9 の各数字の出現回数を数える
    for i in 0..n {
        let d = digit(nums[i], exp); // nums[i] の第 k 桁を取得し、d とする
        counter[d] += 1; // 数字 d の出現回数を数える
    }
    // 累積和を求め、「出現回数」を「配列のインデックス」に変換する
    for i in 1..10 {
        counter[i] += counter[i - 1];
    }
    // 逆順に走査し、バケット内の集計結果に基づいて各要素を res に入れる
    let mut res = vec![0; n];
    for i in (0..n).rev() {
        let d = digit(nums[i], exp);
        let j = counter[d] - 1; // 配列内での d のインデックス j を取得する
        res[j] = nums[i]; // 現在の要素をインデックス j に入れる
        counter[d] -= 1; // d の個数を 1 減らす
    }
    // 結果で元の配列 nums を上書きする
    nums.copy_from_slice(&res);
}

/* 基数ソート */
fn radix_sort(nums: &mut [i32]) {
    // 最大桁数を判定するため、配列の最大要素を取得する
    let m = *nums.into_iter().max().unwrap();
    // 下位の桁から上位の桁へ順に走査する
    let mut exp = 1;
    while exp <= m {
        counting_sort_digit(nums, exp);
        exp *= 10;
    }
}

/* 実行用コード */
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
