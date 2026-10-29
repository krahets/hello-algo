/**
 * File: merge_sort.rs
 * Created Time: 2023-02-14
 * Author: xBLACKICEx (xBLACKICEx@outlook.com)
 */

/* 左部分配列と右部分配列をマージする */
fn merge(nums: &mut [i32], left: usize, mid: usize, right: usize) {
    // 左部分配列の区間は [left, mid]、右部分配列の区間は [mid+1, right]
    // マージ後の結果を格納する一時配列 tmp を作成する
    let tmp_size = right - left + 1;
    let mut tmp = vec![0; tmp_size];
    // 左部分配列と右部分配列の開始インデックスを初期化する
    let (mut i, mut j, mut k) = (left, mid + 1, 0);
    // 左右両方の部分配列に要素が残っている間、比較して小さいほうの要素を一時配列にコピーする
    while i <= mid && j <= right {
        if nums[i] <= nums[j] {
            tmp[k] = nums[i];
            i += 1;
        } else {
            tmp[k] = nums[j];
            j += 1;
        }
        k += 1;
    }
    // 左部分配列と右部分配列の残りの要素を一時配列にコピーする
    while i <= mid {
        tmp[k] = nums[i];
        k += 1;
        i += 1;
    }
    while j <= right {
        tmp[k] = nums[j];
        k += 1;
        j += 1;
    }
    // 一時配列 tmp の要素を元の配列 nums の対応する区間にコピーし戻す
    for k in 0..tmp_size {
        nums[left + k] = tmp[k];
    }
}

/* マージソート */
fn merge_sort(nums: &mut [i32], left: usize, right: usize) {
    // 終了条件
    if left >= right {
        return; // 部分配列の長さが 1 になったら再帰を終了する
    }

    // 分割段階
    let mid = left + (right - left) / 2; // 中央を計算する
    merge_sort(nums, left, mid); // 左部分配列を再帰的に処理する
    merge_sort(nums, mid + 1, right); // 右部分配列を再帰的に処理する

    // マージ段階
    merge(nums, left, mid, right);
}

/* 実行用コード */
fn main() {
    /* マージソート */
    let mut nums = [7, 3, 2, 6, 0, 1, 5, 4];
    let right = nums.len() - 1;
    merge_sort(&mut nums, 0, right);
    println!("マージソート完了後 nums = {:?}", nums);
}
