/**
 * File: merge_sort.js
 * Created Time: 2022-12-01
 * Author: IsChristina (christinaxia77@foxmail.com)
 */

/* 左部分配列と右部分配列をマージする */
function merge(nums, left, mid, right) {
    // 左部分配列の区間は [left, mid]、右部分配列の区間は [mid+1, right]
    // マージ後の結果を格納する一時配列 tmp を作成する
    const tmp = new Array(right - left + 1);
    // 左部分配列と右部分配列の開始インデックスを初期化する
    let i = left,
        j = mid + 1,
        k = 0;
    // 左右両方の部分配列に要素が残っている間、比較して小さいほうの要素を一時配列にコピーする
    while (i <= mid && j <= right) {
        if (nums[i] <= nums[j]) {
            tmp[k++] = nums[i++];
        } else {
            tmp[k++] = nums[j++];
        }
    }
    // 左部分配列と右部分配列の残りの要素を一時配列にコピーする
    while (i <= mid) {
        tmp[k++] = nums[i++];
    }
    while (j <= right) {
        tmp[k++] = nums[j++];
    }
    // 一時配列 tmp の要素を元の配列 nums の対応する区間にコピーし戻す
    for (k = 0; k < tmp.length; k++) {
        nums[left + k] = tmp[k];
    }
}

/* マージソート */
function mergeSort(nums, left, right) {
    // 終了条件
    if (left >= right) return; // 部分配列の長さが 1 になったら再帰を終了する
    // 分割段階
    let mid = Math.floor(left + (right - left) / 2); // 中央を計算する
    mergeSort(nums, left, mid); // 左部分配列を再帰的に処理する
    mergeSort(nums, mid + 1, right); // 右部分配列を再帰的に処理する
    // マージ段階
    merge(nums, left, mid, right);
}

/* 実行用コード */
const nums = [7, 3, 2, 6, 0, 1, 5, 4];
mergeSort(nums, 0, nums.length - 1);
console.log('マージソート完了後 nums =', nums);
