/**
 * File: two_sum.js
 * Created Time: 2022-12-15
 * Author: gyt95 (gytkwan@gmail.com)
 */

/* 方法 1：総当たり列挙 */
function twoSumBruteForce(nums, target) {
    const n = nums.length;
    // 二重ループのため、時間計算量は O(n^2)
    for (let i = 0; i < n; i++) {
        for (let j = i + 1; j < n; j++) {
            if (nums[i] + nums[j] === target) {
                return [i, j];
            }
        }
    }
    return [];
}

/* 方法 2：補助ハッシュテーブル */
function twoSumHashTable(nums, target) {
    // 補助ハッシュテーブルの空間計算量は O(n)
    let m = {};
    // 一重ループのため、時間計算量は O(n)
    for (let i = 0; i < nums.length; i++) {
        if (m[target - nums[i]] !== undefined) {
            return [m[target - nums[i]], i];
        } else {
            m[nums[i]] = i;
        }
    }
    return [];
}

/* 実行用コード */
// 方法 1
const nums = [2, 7, 11, 15],
    target = 13;

let res = twoSumBruteForce(nums, target);
console.log('方法 1 res = ', res);

// 方法 2
res = twoSumHashTable(nums, target);
console.log('方法 2 res = ', res);
