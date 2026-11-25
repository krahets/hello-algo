/**
 * File: merge_sort.rs
 * Created Time: 2023-02-14
 * Author: xBLACKICEx (xBLACKICEx@outlook.com)
 */

/* 左右の部分配列をマージ */
fn merge(nums: &mut [i32], left: usize, mid: usize, right: usize) {
    // 左の部分配列は [left, mid]、右の部分配列は [mid+1, right]
    // マージ結果を格納する一時配列 tmp を作成
    let tmp_size = right - left + 1;
    let mut tmp = vec![0; tmp_size];
    // 左右の部分配列の開始インデックスを初期化
    let (mut i, mut j, mut k) = (left, mid + 1, 0);
    // 両方の部分配列に要素が残っている間、値を比較し、小さいほうを一時配列にコピー
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
    // 左右の部分配列に残った要素を一時配列にコピー
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
    // 一時配列 tmp の要素を元の配列 nums の対応区間に書き戻す
    for k in 0..tmp_size {
        nums[left + k] = tmp[k];
    }
}

/* マージソート */
fn merge_sort(nums: &mut [i32], left: usize, right: usize) {
    // 終了条件
    if left >= right {
        return; // 部分配列の長さが 1 になったら再帰を終了
    }

    // 分割段階
    let mid = left + (right - left) / 2; // 中央のインデックスを求める
    merge_sort(nums, left, mid); // 左の部分配列を再帰的に処理
    merge_sort(nums, mid + 1, right); // 右の部分配列を再帰的に処理

    // マージ段階
    merge(nums, left, mid, right);
}

/* 実行例 */
fn main() {
    /* マージソート */
    let mut nums = [7, 3, 2, 6, 0, 1, 5, 4];
    let right = nums.len() - 1;
    merge_sort(&mut nums, 0, right);
    println!("マージソート後の nums = {:?}", nums);
}
