/*
 * File: bucket_sort.rs
 * Created Time: 2023-07-09
 * Author: night-cruise (2586447362@qq.com)
 */

use hello_algo_rust::include::print_util;

/* バケットソート */
fn bucket_sort(nums: &mut [f64]) {
    // k = n/2 個のバケットを初期化し、各バケットに 2 要素ずつ割り当てる想定とする
    let k = nums.len() / 2;
    let mut buckets = vec![vec![]; k];
    // 1. 配列要素を各バケットに振り分ける
    for &num in nums.iter() {
        // 入力データの範囲は [0, 1) であり、num * k を用いてインデックス範囲 [0, k-1] に写像する
        let i = (num * k as f64) as usize;
        // num をバケット i に追加
        buckets[i].push(num);
    }
    // 2. 各バケットをソートする
    for bucket in &mut buckets {
        // 組み込みのソート関数を使う。他のソートアルゴリズムに置き換えてもよい
        bucket.sort_by(|a, b| a.partial_cmp(b).unwrap());
    }
    // 3. バケットを走査して結果を結合
    let mut i = 0;
    for bucket in buckets.iter() {
        for &num in bucket.iter() {
            nums[i] = num;
            i += 1;
        }
    }
}

/* Driver Code */
fn main() {
    // 入力データは範囲 [0, 1) の浮動小数点数とする
    let mut nums = [0.49, 0.96, 0.82, 0.09, 0.57, 0.43, 0.91, 0.75, 0.15, 0.37];
    bucket_sort(&mut nums);
    print!("バケットソート完了後 nums = ");
    print_util::print_array(&nums);
}
