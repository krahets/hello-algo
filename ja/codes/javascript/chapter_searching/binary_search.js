/**
 * File: binary_search.js
 * Created Time: 2022-12-22
 * Author: JoseHung (szhong@link.cuhk.edu.hk)
 */

/* 二分探索（両閉区間） */
function binarySearch(nums, target) {
    // 両閉区間 [0, n-1] を初期化する。つまり i, j はそれぞれ配列の先頭要素と末尾要素を指す
    let i = 0,
        j = nums.length - 1;
    // ループし、探索区間が空になったら終了する（i > j で空）
    while (i <= j) {
        // 中点インデックス `m` を計算し、`parseInt()` で切り捨てる
        const m = parseInt(i + (j - i) / 2);
        if (nums[m] < target)
            // この場合、target は区間 [m+1, j] にある
            i = m + 1;
        else if (nums[m] > target)
            // この場合、target は区間 [i, m-1] にある
            j = m - 1;
        else return m; // 目標要素が見つかったらそのインデックスを返す
    }
    // 目標要素が見つからなければ -1 を返す
    return -1;
}

/* 二分探索（左閉右開区間） */
function binarySearchLCRO(nums, target) {
    // 左閉右開区間 [0, n) を初期化する。つまり i, j はそれぞれ配列の先頭要素と末尾要素+1を指す
    let i = 0,
        j = nums.length;
    // ループし、探索区間が空になったら終了する（i = j で空）
    while (i < j) {
        // 中点インデックス `m` を計算し、`parseInt()` で切り捨てる
        const m = parseInt(i + (j - i) / 2);
        if (nums[m] < target)
            // この場合、target は区間 [m+1, j) にある
            i = m + 1;
        else if (nums[m] > target)
            // この場合、target は区間 [i, m) にある
            j = m;
        // 目標要素が見つかったらそのインデックスを返す
        else return m;
    }
    // 目標要素が見つからなければ -1 を返す
    return -1;
}

/* Driver Code */
const target = 6;
const nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];

/* 二分探索（両閉区間） */
let index = binarySearch(nums, target);
console.log('目標要素 6 のインデックス = ' + index);

/* 二分探索（左閉右開区間） */
index = binarySearchLCRO(nums, target);
console.log('目標要素 6 のインデックス = ' + index);
