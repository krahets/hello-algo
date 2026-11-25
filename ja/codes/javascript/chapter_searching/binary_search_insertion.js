/**
 * File: binary_search_insertion.js
 * Created Time: 2023-08-22
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* 挿入位置の二分探索（重複する要素がない場合） */
function binarySearchInsertionSimple(nums, target) {
    let i = 0,
        j = nums.length - 1; // 閉区間 [0, n-1] で初期化する
    while (i <= j) {
        const m = Math.floor(i + (j - i) / 2); // Math.floor() で小数点以下を切り捨て、中央のインデックス m を求める
        if (nums[m] < target) {
            i = m + 1; // target の探索範囲は [m+1, j]
        } else if (nums[m] > target) {
            j = m - 1; // target の探索範囲は [i, m-1]
        } else {
            return m; // target が見つかったので挿入位置 m を返す
        }
    }
    // target が見つからなかったので挿入位置 i を返す
    return i;
}

/* 挿入位置の二分探索（重複する要素がある場合） */
function binarySearchInsertion(nums, target) {
    let i = 0,
        j = nums.length - 1; // 閉区間 [0, n-1] で初期化する
    while (i <= j) {
        const m = Math.floor(i + (j - i) / 2); // Math.floor() で小数点以下を切り捨て、中央のインデックス m を求める
        if (nums[m] < target) {
            i = m + 1; // target の探索範囲は [m+1, j]
        } else if (nums[m] > target) {
            j = m - 1; // target の探索範囲は [i, m-1]
        } else {
            j = m - 1; // target 未満の最も右の要素を [i, m-1] で探す
        }
    }
    // 挿入位置 i を返す
    return i;
}

/* 実行例 */
if (require.main === module) {
    // 重複する要素がない配列
    let nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];
    console.log('\n配列 nums = ' + nums);
    // 挿入位置の二分探索
    for (const target of [6, 9]) {
        const index = binarySearchInsertionSimple(nums, target);
        console.log('要素 ' + target + ' の挿入位置のインデックスは ' + index);
    }

    // 重複する要素がある配列
    nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15];
    console.log('\n配列 nums = ' + nums);
    // 挿入位置の二分探索
    for (const target of [2, 6, 20]) {
        const index = binarySearchInsertion(nums, target);
        console.log('要素 ' + target + ' の挿入位置のインデックスは ' + index);
    }
}

module.exports = {
    binarySearchInsertion,
};
