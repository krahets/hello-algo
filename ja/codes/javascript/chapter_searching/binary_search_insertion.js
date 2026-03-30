/**
 * File: binary_search_insertion.js
 * Created Time: 2023-08-22
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* 二分探索で挿入位置を探す（重複要素なし） */
function binarySearchInsertionSimple(nums, target) {
    let i = 0,
        j = nums.length - 1; // 両閉区間 [0, n-1] を初期化
    while (i <= j) {
        const m = Math.floor(i + (j - i) / 2); // 中点インデックス m を計算し、Math.floor() で切り捨てる
        if (nums[m] < target) {
            i = m + 1; // target は区間 [m+1, j] にある
        } else if (nums[m] > target) {
            j = m - 1; // target は区間 [i, m-1] にある
        } else {
            return m; // target が見つかったら、挿入位置 m を返す
        }
    }
    // target が見つからなければ、挿入位置 i を返す
    return i;
}

/* 二分探索で挿入位置を探す（重複要素あり） */
function binarySearchInsertion(nums, target) {
    let i = 0,
        j = nums.length - 1; // 両閉区間 [0, n-1] を初期化
    while (i <= j) {
        const m = Math.floor(i + (j - i) / 2); // 中点インデックス m を計算し、Math.floor() で切り捨てる
        if (nums[m] < target) {
            i = m + 1; // target は区間 [m+1, j] にある
        } else if (nums[m] > target) {
            j = m - 1; // target は区間 [i, m-1] にある
        } else {
            j = m - 1; // target より小さい最初の要素は区間 [i, m-1] にある
        }
    }
    // 挿入位置 i を返す
    return i;
}

/* Driver Code */
// 重複要素のない配列
let nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];
console.log('\n配列 nums = ' + nums);
// 二分探索で挿入位置を探す
for (const target of [6, 9]) {
    const index = binarySearchInsertionSimple(nums, target);
    console.log('要素 ' + target + ' の挿入位置のインデックスは ' + index);
}

// 重複要素を含む配列
nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15];
console.log('\n配列 nums = ' + nums);
// 二分探索で挿入位置を探す
for (const target of [2, 6, 20]) {
    const index = binarySearchInsertion(nums, target);
    console.log('要素 ' + target + ' の挿入位置のインデックスは ' + index);
}

module.exports = {
    binarySearchInsertion,
};
