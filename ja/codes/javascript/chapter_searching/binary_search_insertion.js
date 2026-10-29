/**
 * File: binary_search_insertion.js
 * Created Time: 2023-08-22
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* 二分探索による挿入位置の探索（重複要素がない場合） */
function binarySearchInsertionSimple(nums, target) {
    let i = 0,
        j = nums.length - 1; // 閉区間 [0, n-1] を初期化する
    while (i <= j) {
        const m = Math.floor(i + (j - i) / 2); // 中央のインデックス m を計算し、Math.floor() で小数点以下を切り捨てる
        if (nums[m] < target) {
            i = m + 1; // target は区間 [m+1, j] に存在する
        } else if (nums[m] > target) {
            j = m - 1; // target は区間 [i, m-1] に存在する
        } else {
            return m; // target が見つかったので、挿入位置 m を返す
        }
    }
    // target が見つからなかったので、挿入位置 i を返す
    return i;
}

/* 二分探索による挿入位置の探索（重複要素がある場合） */
function binarySearchInsertion(nums, target) {
    let i = 0,
        j = nums.length - 1; // 閉区間 [0, n-1] を初期化する
    while (i <= j) {
        const m = Math.floor(i + (j - i) / 2); // 中央のインデックス m を計算し、Math.floor() で小数点以下を切り捨てる
        if (nums[m] < target) {
            i = m + 1; // target は区間 [m+1, j] に存在する
        } else if (nums[m] > target) {
            j = m - 1; // target は区間 [i, m-1] に存在する
        } else {
            j = m - 1; // target より小さい要素のうち最も右にあるものは、区間 [i, m-1] に存在する
        }
    }
    // 挿入位置 i を返す
    return i;
}

/* 実行用コード */
// 重複要素のない配列
let nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];
console.log('\n配列 nums = ' + nums);
// 二分探索による挿入位置の探索
for (const target of [6, 9]) {
    const index = binarySearchInsertionSimple(nums, target);
    console.log('要素 ' + target + ' の挿入位置のインデックスは ' + index);
}

// 重複要素を含む配列
nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15];
console.log('\n配列 nums = ' + nums);
// 二分探索による挿入位置の探索
for (const target of [2, 6, 20]) {
    const index = binarySearchInsertion(nums, target);
    console.log('要素 ' + target + ' の挿入位置のインデックスは ' + index);
}

module.exports = {
    binarySearchInsertion,
};
