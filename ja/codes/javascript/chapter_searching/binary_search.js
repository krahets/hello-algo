/**
 * File: binary_search.js
 * Created Time: 2022-12-22
 * Author: JoseHung (szhong@link.cuhk.edu.hk)
 */

/* 二分探索（閉区間） */
function binarySearch(nums, target) {
    // 閉区間 [0, n-1] で初期化し、i は配列の先頭、j は末尾の要素を指す
    let i = 0,
        j = nums.length - 1;
    // 探索区間が空になるまで繰り返す（i > j のとき空）
    while (i <= j) {
        // parseInt() で小数点以下を切り捨て、中央のインデックス m を求める
        const m = parseInt(i + (j - i) / 2);
        if (nums[m] < target)
            // この場合、target の探索範囲は [m+1, j]
            i = m + 1;
        else if (nums[m] > target)
            // この場合、target の探索範囲は [i, m-1]
            j = m - 1;
        else return m; // 目標の要素が見つかったので、そのインデックスを返す
    }
    // 目標の要素が見つからなかったので -1 を返す
    return -1;
}

/* 二分探索（左閉右開区間） */
function binarySearchLCRO(nums, target) {
    // 左閉右開区間 [0, n) で初期化し、i は配列の先頭、j は末尾の一つ先を指す
    let i = 0,
        j = nums.length;
    // 探索区間が空になるまで繰り返す（i = j のとき空）
    while (i < j) {
        // parseInt() で小数点以下を切り捨て、中央のインデックス m を求める
        const m = parseInt(i + (j - i) / 2);
        if (nums[m] < target)
            // この場合、target の探索範囲は [m+1, j)
            i = m + 1;
        else if (nums[m] > target)
            // この場合、target の探索範囲は [i, m)
            j = m;
        // 目標の要素が見つかったので、そのインデックスを返す
        else return m;
    }
    // 目標の要素が見つからなかったので -1 を返す
    return -1;
}

/* 実行例 */
const target = 6;
const nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];

/* 二分探索（閉区間） */
let index = binarySearch(nums, target);
console.log('目標値 6 のインデックス = ' + index);

/* 二分探索（左閉右開区間） */
index = binarySearchLCRO(nums, target);
console.log('目標値 6 のインデックス = ' + index);
