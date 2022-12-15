/*
 * @Author: gyt95 (gytkwan@gmail.com) 
 * @Date: 2022-12-15 11:26:38 
 * @Last Modified by: gyt95 (gytkwan@gmail.com)
 * @Last Modified time: 2022-12-15 11:38:22
 */

function twoSumBruteForce(nums: number[], target: number): number[] {
  let n = nums.length;
  // 两层循环，时间复杂度 O(n^2)
  for (let i = 0; i < n; i++) {
    for (let j = i + 1; j < n; j++) {
      if (nums[i] + nums[j] === target) {
        return [i, j]
      }
    }
  }
  return [];
};

function twoSumHashTable(nums: number[], target: number): number[] {
  // 辅助哈希表，空间复杂度 O(n)
  let m: Map<number, number> = new Map()
  // 单层循环，时间复杂度 O(n)
  for (let i = 0; i < nums.length; i++) {
    let index = m.get(nums[i])
    if (index !== undefined) {
      return [index, i]
    } else {
      m.set(target - nums[i], i)
    }
  }
  return [];
};