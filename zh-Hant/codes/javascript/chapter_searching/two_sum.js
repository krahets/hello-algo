/**
 * File: two_sum.js
 * Created Time: 2022-12-15
 * Author: gyt95 (gytkwan@gmail.com)
 */

/* 方法一：暴力列舉 */
function twoSumBruteForce(nums, target) {
    const n = nums.length;
    // 兩層迴圈，時間複雜度為 O(n^2)
    for (let i = 0; i < n; i++) {
        for (let j = i + 1; j < n; j++) {
            if (nums[i] + nums[j] === target) {
                return [i, j];
            }
        }
    }
    return [];
}

/* 方法二：輔助雜湊表 */
function twoSumHashTable(nums, target) {
    // 輔助雜湊表，空間複雜度為 O(n)
    let m = {};
    // 單層迴圈，時間複雜度為 O(n)
    for (let i = 0; i < nums.length; i++) {
        if (m[target - nums[i]] !== undefined) {
            return [m[target - nums[i]], i];
        } else {
            m[nums[i]] = i;
        }
    }
    return [];
}

/* Driver Code */
// 方法一
const nums = [2, 7, 11, 15],
    target = 13;

let res = twoSumBruteForce(nums, target);
console.log('方法一 res = ', res);

// 方法二
res = twoSumHashTable(nums, target);
console.log('方法二 res = ', res);
