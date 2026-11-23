/*
 * File: heap_sort.rs
 * Created Time: 2023-07-04
 * Author: night-cruise (2586447362@qq.com)
 */

use hello_algo_rust::include::print_util;

/* 長さ n のヒープを、ノード i から下向きにヒープ化する */
fn sift_down(nums: &mut [i32], n: usize, mut i: usize) {
    loop {
        // ノード i, l, r のうち値が最大のノードを求め、ma とする
        let l = 2 * i + 1;
        let r = 2 * i + 2;
        let mut ma = i;
        if l < n && nums[l] > nums[ma] {
            ma = l;
        }
        if r < n && nums[r] > nums[ma] {
            ma = r;
        }
        // ノード i が最大か添字 l, r が範囲外なら、ヒープ化は不要なので終了
        if ma == i {
            break;
        }
        // 2 つのノードを交換する
        nums.swap(i, ma);
        // 下向きのヒープ化を繰り返す
        i = ma;
    }
}

/* ヒープソート */
fn heap_sort(nums: &mut [i32]) {
    // ヒープの構築：葉ノード以外の全ノードをヒープ化する
    for i in (0..nums.len() / 2).rev() {
        sift_down(nums, nums.len(), i);
    }
    // ヒープから最大要素を取り出す処理を n-1 回繰り返す
    for i in (1..nums.len()).rev() {
        // 根と最右の葉を交換（先頭要素と末尾要素を交換）
        nums.swap(0, i);
        // 根ノードから下向きにヒープ化する
        sift_down(nums, i, 0);
    }
}

/* 実行用コード */
fn main() {
    let mut nums = [4, 1, 3, 1, 5, 2];
    heap_sort(&mut nums);
    print!("ヒープソート完了後 nums = ");
    print_util::print_array(&nums);
}
