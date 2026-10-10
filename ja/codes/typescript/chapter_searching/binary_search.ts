/**
 * File: binary_search.ts
 * Created Time: 2022-12-27
 * Author: Daniel (better.sunjian@gmail.com)
 */

/* 二分探索（両閉区間） */
function binarySearch(nums: number[], target: number): number {
    // 両閉区間 [0, n-1] を初期化する。つまり i, j はそれぞれ配列の先頭要素と末尾要素を指す
    let i = 0,
        j = nums.length - 1;
    // ループし、探索区間が空になったら終了する（i > j で空）
    while (i <= j) {
        // 中点インデックス m を計算
        const m = Math.floor(i + (j - i) / 2);
        if (nums[m] < target) {
            // この場合、target は区間 [m+1, j] にある
            i = m + 1;
        } else if (nums[m] > target) {
            // この場合、target は区間 [i, m-1] にある
            j = m - 1;
        } else {
            // 目標要素が見つかったらそのインデックスを返す
            return m;
        }
    }
    return -1; // 目標要素が見つからなければ -1 を返す
}

/* 二分探索（左閉右開区間） */
function binarySearchLCRO(nums: number[], target: number): number {
    // 左閉右開区間 [0, n) を初期化する。つまり i, j はそれぞれ配列の先頭要素と末尾要素+1を指す
    let i = 0,
        j = nums.length;
    // ループし、探索区間が空になったら終了する（i = j で空）
    while (i < j) {
        // 中点インデックス m を計算
        const m = Math.floor(i + (j - i) / 2);
        if (nums[m] < target) {
            // この場合、target は区間 [m+1, j) にある
            i = m + 1;
        } else if (nums[m] > target) {
            // この場合、target は区間 [i, m) にある
            j = m;
        } else {
            // 目標要素が見つかったらそのインデックスを返す
            return m;
        }
    }
    return -1; // 目標要素が見つからなければ -1 を返す
}

/* Driver Code */
const target = 6;
const nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];

/* 二分探索（両閉区間） */
let index = binarySearch(nums, target);
console.info('対象要素 6 のインデックス = %d', index);

/* 二分探索（左閉右開区間） */
index = binarySearchLCRO(nums, target);
console.info('対象要素 6 のインデックス = %d', index);

export {};
