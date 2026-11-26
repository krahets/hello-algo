/**
 * File: merge_sort.ts
 * Created Time: 2022-12-12
 * Author: Justin (xiefahit@gmail.com)
 */

/* 左右の部分配列をマージ */
function merge(nums: number[], left: number, mid: number, right: number): void {
    // 左の部分配列は [left, mid]、右の部分配列は [mid+1, right]
    // マージ結果を格納する一時配列 tmp を作成
    const tmp = new Array(right - left + 1);
    // 左右の部分配列の開始インデックスを初期化
    let i = left,
        j = mid + 1,
        k = 0;
    // 両方の部分配列に要素が残っている間、値を比較し、小さいほうを一時配列にコピー
    while (i <= mid && j <= right) {
        if (nums[i] <= nums[j]) {
            tmp[k++] = nums[i++];
        } else {
            tmp[k++] = nums[j++];
        }
    }
    // 左右の部分配列に残った要素を一時配列にコピー
    while (i <= mid) {
        tmp[k++] = nums[i++];
    }
    while (j <= right) {
        tmp[k++] = nums[j++];
    }
    // 一時配列 tmp の要素を元の配列 nums の対応区間に書き戻す
    for (k = 0; k < tmp.length; k++) {
        nums[left + k] = tmp[k];
    }
}

/* マージソート */
function mergeSort(nums: number[], left: number, right: number): void {
    // 終了条件
    if (left >= right) return; // 部分配列の長さが 1 になったら再帰を終了
    // 分割段階
    let mid = Math.floor(left + (right - left) / 2); // 中央のインデックスを求める
    mergeSort(nums, left, mid); // 左の部分配列を再帰的に処理
    mergeSort(nums, mid + 1, right); // 右の部分配列を再帰的に処理
    // マージ段階
    merge(nums, left, mid, right);
}

/* 実行例 */
const nums = [7, 3, 2, 6, 0, 1, 5, 4];
mergeSort(nums, 0, nums.length - 1);
console.log('マージソート後の nums =', nums);

export {};
