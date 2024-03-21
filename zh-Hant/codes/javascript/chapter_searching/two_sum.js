/**
 * File: two_sum.js
 * Created Time: 2022-12-15
 * Author: gyt95 (gytkwan@gmail.com)
 */

/* 方法一：暴力枚举 */
function twoSumBruteForce(nums, target) {
    const n = nums.length;
    // 两层循环，时间复杂度为 O(n^2)
    for (let i = 0; i < n; i++) {
        for (let j = i + 1; j < n; j++) {
            if (nums[i] + nums[j] === target) {
                return [i, j];
            }
        }
    }
    return [];
}

/* 方法二：辅助哈希表 */
function twoSumHashTable(nums, target) {
    // 辅助哈希表，空间复杂度为 O(n)
    let m = {};
    // 单层循环，时间复杂度为 O(n)
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
