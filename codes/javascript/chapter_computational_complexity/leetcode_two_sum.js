/*
 * @Author: gyt95 (gytkwan@gmail.com)
 * @Date: 2022-12-15 10:51:54 
 * @Last Modified by: gyt95 (gytkwan@gmail.com)
 * @Last Modified time: 2022-12-15 10:56:26
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
        return [i, j]
      }
    }
  }
}

function twoSumHashTable(nums, target) {
  // 辅助哈希表，空间复杂度 O(n)
  let m = {}
  // 单层循环，时间复杂度 O(n)
  for (let i = 0; i < nums.length; i++) {
    if (m[nums[i]] !== undefined) {
      return [m[nums[i]], i]
    } else {
      m[target - nums[i]] = i;
    }
  }
}