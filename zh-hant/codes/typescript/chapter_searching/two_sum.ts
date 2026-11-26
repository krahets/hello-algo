/**
 * File: two_sum.ts
 * Created Time: 2022-12-15
 * Author: gyt95 (gytkwan@gmail.com)
 */

/* 方法一：窮舉法 */
function twoSumBruteForce(nums: number[], target: number): number[] {
    const n = nums.length;
    // 使用兩層迴圈，時間複雜度為 O(n^2)
    for (let i = 0; i < n; i++) {
        for (let j = i + 1; j < n; j++) {
            if (nums[i] + nums[j] === target) {
                return [i, j];
            }
        }
    }
    return [];
}

/* 方法二：使用輔助雜湊表 */
function twoSumHashTable(nums: number[], target: number): number[] {
    // 使用輔助雜湊表，空間複雜度為 O(n)
    let m: Map<number, number> = new Map();
    // 使用單層迴圈，時間複雜度為 O(n)
    for (let i = 0; i < nums.length; i++) {
        let index = m.get(target - nums[i]);
        if (index !== undefined) {
            return [index, i];
        } else {
            m.set(nums[i], i);
        }
    }
    return [];
}

/* 主程式 */
// 方法一
const nums = [2, 7, 11, 15],
    target = 13;

let res = twoSumBruteForce(nums, target);
console.log('方法一 res = ', res);

// 方法二
res = twoSumHashTable(nums, target);
console.log('方法二 res = ', res);

export {};
