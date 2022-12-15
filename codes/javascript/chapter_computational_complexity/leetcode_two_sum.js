/**
 * File: leetcode_two_sum.js
 * Created Time: 2022-12-15
 * Author: gyt95 (gytkwan@gmail.com)
 */

/**
 * @param {number[]} nums
 * @param {number} target
 * @return {number[]}
 */
function twoSumBruteForce(nums, target) {
    let n = nums.length;
    // 两层循环，时间复杂度 O(n^2)
    for (let i = 0; i < n; i++) {
        for (let j = i + 1; j < n; j++) {
            if (nums[i] + nums[j] === target) {
                return [i, j];
            }
        }
    }
}

function twoSumHashTable(nums, target) {
    // 辅助哈希表，空间复杂度 O(n)
    let m = {};
    // 单层循环，时间复杂度 O(n)
    for (let i = 0; i < nums.length; i++) {
        if (m[nums[i]] !== undefined) {
            return [m[nums[i]], i];
        } else {
            m[target - nums[i]] = i;
        }
    }
}

/* Driver Code */
let nums = [2, 7, 11, 15], target = 9;
twoSumBruteForce(nums, target)
console.log("使用暴力枚举后得到结果：", nums)

let nums1 = [2, 7, 11, 15], target1 = 9;
twoSumHashTable(nums1, target1)
console.log("使用辅助哈希表后得到结果", nums1)
