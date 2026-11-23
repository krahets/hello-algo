/**
 * File: binary_search.js
 * Created Time: 2022-12-22
 * Author: JoseHung (szhong@link.cuhk.edu.hk)
 */

/* 二分探索（閉区間） */
function binarySearch(nums, target) {
    // 閉区間 [0, n-1] を初期化する。i, j は配列の先頭要素と末尾要素をそれぞれ指す
    let i = 0,
        j = nums.length - 1;
    // 探索区間が空になるまで繰り返す（i > j のとき空になる）
    while (i <= j) {
        // 中央のインデックス m を計算し、parseInt() で小数点以下を切り捨てる
        const m = parseInt(i + (j - i) / 2);
        if (nums[m] < target)
            // この場合、target は区間 [m+1, j] に存在する
            i = m + 1;
        else if (nums[m] > target)
            // この場合、target は区間 [i, m-1] に存在する
            j = m - 1;
        else return m; // 目的の要素が見つかったので、そのインデックスを返す
    }
    // 目的の要素が見つからなかったので、-1 を返す
    return -1;
}

/* 二分探索（左閉右開区間） */
function binarySearchLCRO(nums, target) {
    // 左閉右開区間 [0, n) を初期化する。i, j は配列の先頭要素と末尾要素の次をそれぞれ指す
    let i = 0,
        j = nums.length;
    // 探索区間が空になるまで繰り返す（i = j のとき空になる）
    while (i < j) {
        // 中央のインデックス m を計算し、parseInt() で小数点以下を切り捨てる
        const m = parseInt(i + (j - i) / 2);
        if (nums[m] < target)
            // この場合、target は区間 [m+1, j) に存在する
            i = m + 1;
        else if (nums[m] > target)
            // この場合、target は区間 [i, m) に存在する
            j = m;
        // 目的の要素が見つかったので、そのインデックスを返す
        else return m;
    }
    // 目的の要素が見つからなかったので、-1 を返す
    return -1;
}

/* 実行用コード */
const target = 6;
const nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];

/* 二分探索（閉区間） */
let index = binarySearch(nums, target);
console.log('目的の要素 6 のインデックス = ' + index);

/* 二分探索（左閉右開区間） */
index = binarySearchLCRO(nums, target);
console.log('目的の要素 6 のインデックス = ' + index);
