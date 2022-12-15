/*
 * File: leetcode_two_sum.ts
 * Created Time: 2022-12-15
 * Author: gyt95 (gytkwan@gmail.com) 
 */

function twoSumBruteForce(nums: number[], target: number): number[] {
    let n = nums.length;
    // 两层循环，时间复杂度 O(n^2)
    for (let i = 0; i < n; i++) {
        for (let j = i + 1; j < n; j++) {
            if (nums[i] + nums[j] === target) {
                return [i, j];
            }
        }
    }
    return [];
};

function twoSumHashTable(nums: number[], target: number): number[] {
    // 辅助哈希表，空间复杂度 O(n)
    let m: Map<number, number> = new Map();
    // 单层循环，时间复杂度 O(n)
    for (let i = 0; i < nums.length; i++) {
        let index = m.get(nums[i]);
        if (index !== undefined) {
            return [index, i];
        } else {
            m.set(target - nums[i], i);
        }
    }
    return [];
};

/* Driver Code */
let nums = [2, 7, 11, 15]
twoSumBruteForce(nums, 9)
console.log("使用暴力枚举后得到结果：", nums)

let nums1 = [2, 7, 11, 15]
twoSumHashTable(nums1, 9)
console.log("使用辅助哈希表后得到结果", nums1)