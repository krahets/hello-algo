/**
 * File: binary_search_recur.js
 * Created Time: 2023-07-30
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* 二分探索：問題 f(i, j) */
function dfs(nums, target, i, j) {
    // 区間が空なら対象要素は存在しないので -1 を返す
    if (i > j) {
        return -1;
    }
    // 中点インデックス m を計算
    const m = i + ((j - i) >> 1);
    if (nums[m] < target) {
        // 部分問題 f(m+1, j) を再帰的に解く
        return dfs(nums, target, m + 1, j);
    } else if (nums[m] > target) {
        // 部分問題 f(i, m-1) を再帰的に解く
        return dfs(nums, target, i, m - 1);
    } else {
        // 目標要素が見つかったらそのインデックスを返す
        return m;
    }
}

/* 二分探索 */
function binarySearch(nums, target) {
    const n = nums.length;
    // 問題 f(0, n-1) を解く
    return dfs(nums, target, 0, n - 1);
}

/* Driver Code */
const target = 6;
const nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];
// 二分探索（両閉区間）
const index = binarySearch(nums, target);
console.log(`対象要素 6 のインデックス = ${index}`);
