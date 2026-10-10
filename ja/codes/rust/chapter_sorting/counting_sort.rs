/*
 * File: counting_sort.rs
 * Created Time: 2023-07-09
 * Author: night-cruise (2586447362@qq.com)
 */

use hello_algo_rust::include::print_util;

/* 計数ソート */
// 簡易実装のため、オブジェクトのソートには使えない
fn counting_sort_naive(nums: &mut [i32]) {
    // 1. 配列の最大要素 m を求める
    let m = *nums.iter().max().unwrap();
    // 2. 各数値の出現回数を数える
    // counter[num] は num の出現回数を表す
    let mut counter = vec![0; m as usize + 1];
    for &num in nums.iter() {
        counter[num as usize] += 1;
    }
    // 3. counter を走査し、各要素を元の配列 nums に書き戻す
    let mut i = 0;
    for num in 0..m + 1 {
        for _ in 0..counter[num as usize] {
            nums[i] = num;
            i += 1;
        }
    }
}

/* 計数ソート */
// 完全な実装で、オブジェクトをソートでき、かつ安定ソートである
fn counting_sort(nums: &mut [i32]) {
    // 1. 配列の最大要素 m を求める
    let m = *nums.iter().max().unwrap() as usize;
    // 2. 各数値の出現回数を数える
    // counter[num] は num の出現回数を表す
    let mut counter = vec![0; m + 1];
    for &num in nums.iter() {
        counter[num as usize] += 1;
    }
    // 3. counter の累積和を求めて、「出現回数」を「末尾インデックス」に変換する
    // つまり counter[num]-1 は、num が res に最後に現れるインデックス
    for i in 0..m {
        counter[i + 1] += counter[i];
    }
    // 4. nums を逆順に走査し、各要素を結果配列 res に格納する
    // 結果を記録するための配列 res を初期化
    let n = nums.len();
    let mut res = vec![0; n];
    for i in (0..n).rev() {
        let num = nums[i];
        res[counter[num as usize] - 1] = num; // num を対応するインデックスに配置
        counter[num as usize] -= 1; // 累積和を 1 減らして、次に num を配置するインデックスを得る
    }
    // 結果配列 res で元の配列 nums を上書きする
    nums.copy_from_slice(&res)
}

/* Driver Code */
fn main() {
    let mut nums = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4];
    counting_sort_naive(&mut nums);
    print!("カウントソート（オブジェクトはソート不可）完了後 nums = ");
    print_util::print_array(&nums);

    let mut nums1 = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4];
    counting_sort(&mut nums1);
    print!("\nカウントソート完了後 nums1 = ");
    print_util::print_array(&nums1);
}
