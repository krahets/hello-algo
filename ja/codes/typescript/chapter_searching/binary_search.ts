/**
 * File: binary_search.ts
 * Created Time: 2022-12-27
 * Author: Daniel (better.sunjian@gmail.com)
 */

/* 二分探索（閉区間） */
function binarySearch(nums: number[], target: number): number {
    // 閉区間 [0, n-1] を初期化する。i, j は配列の先頭要素と末尾要素をそれぞれ指す
    let i = 0,
        j = nums.length - 1;
    // 探索区間が空になるまで繰り返す（i > j のとき空になる）
    while (i <= j) {
        // 中央のインデックス m を計算する
        const m = Math.floor(i + (j - i) / 2);
        if (nums[m] < target) {
            // この場合、target は区間 [m+1, j] に存在する
            i = m + 1;
        } else if (nums[m] > target) {
            // この場合、target は区間 [i, m-1] に存在する
            j = m - 1;
        } else {
            // 目的の要素が見つかったので、そのインデックスを返す
            return m;
        }
    }
    return -1; // 目的の要素が見つからなかったので、-1 を返す
}

/* 二分探索（左閉右開区間） */
function binarySearchLCRO(nums: number[], target: number): number {
    // 左閉右開区間 [0, n) を初期化する。i, j は配列の先頭要素と末尾要素の次をそれぞれ指す
    let i = 0,
        j = nums.length;
    // 探索区間が空になるまで繰り返す（i = j のとき空になる）
    while (i < j) {
        // 中央のインデックス m を計算する
        const m = Math.floor(i + (j - i) / 2);
        if (nums[m] < target) {
            // この場合、target は区間 [m+1, j) に存在する
            i = m + 1;
        } else if (nums[m] > target) {
            // この場合、target は区間 [i, m) に存在する
            j = m;
        } else {
            // 目的の要素が見つかったので、そのインデックスを返す
            return m;
        }
    }
    return -1; // 目的の要素が見つからなかったので、-1 を返す
}

/* 実行用コード */
const target = 6;
const nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];

/* 二分探索（閉区間） */
let index = binarySearch(nums, target);
console.info('目的の要素 6 のインデックス = %d', index);

/* 二分探索（左閉右開区間） */
index = binarySearchLCRO(nums, target);
console.info('目的の要素 6 のインデックス = %d', index);

export {};
