/*
 * File: heap_sort.rs
 * Created Time: 2023-07-04
 * Author: night-cruise (2586447362@qq.com)
 */

use hello_algo_rust::include::print_util;

/* ヒープの長さは n。ノード i から下方向にヒープ化 */
fn sift_down(nums: &mut [i32], n: usize, mut i: usize) {
    loop {
        // ノード i, l, r のうち値が最大のノードを ma とする
        let l = 2 * i + 1;
        let r = 2 * i + 2;
        let mut ma = i;
        if l < n && nums[l] > nums[ma] {
            ma = l;
        }
        if r < n && nums[r] > nums[ma] {
            ma = r;
        }
        // ノード i が最大、またはインデックス l, r が範囲外なら、ヒープ化は不要なので抜ける
        if ma == i {
            break;
        }
        // 2 つのノードを交換
        nums.swap(i, ma);
        // ループで上から下へヒープ化
        i = ma;
    }
}

/* ヒープソート */
fn heap_sort(nums: &mut [i32]) {
    // ヒープ構築：葉ノード以外のすべてのノードをヒープ化する
    for i in (0..nums.len() / 2).rev() {
        sift_down(nums, nums.len(), i);
    }
    // ヒープから最大要素を取り出し、n-1 回繰り返す
    for i in (1..nums.len()).rev() {
        // 根ノードと最も右の葉ノードを交換（先頭要素と末尾要素を交換）
        nums.swap(0, i);
        // 根ノードを起点に、上から下へヒープ化
        sift_down(nums, i, 0);
    }
}

/* Driver Code */
fn main() {
    let mut nums = [4, 1, 3, 1, 5, 2];
    heap_sort(&mut nums);
    print!("ヒープソート完了後 nums = ");
    print_util::print_array(&nums);
}
