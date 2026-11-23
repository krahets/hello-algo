/**
 * File: two_sum.ts
 * Created Time: 2022-12-15
 * Author: gyt95 (gytkwan@gmail.com)
 */

/* Method 1: brute-force enumeration */
function twoSumBruteForce(nums: number[], target: number): number[] {
    const n = nums.length;
    // Two nested loops give a time complexity of O(n^2)
    for (let i = 0; i < n; i++) {
        for (let j = i + 1; j < n; j++) {
            if (nums[i] + nums[j] === target) {
                return [i, j];
            }
        }
    }
    return [];
}

/* Method 2: auxiliary hash table */
function twoSumHashTable(nums: number[], target: number): number[] {
    // The auxiliary hash table uses O(n) space
    let m: Map<number, number> = new Map();
    // A single loop gives a time complexity of O(n)
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

/* Driver code */
// Method 1
const nums = [2, 7, 11, 15],
    target = 13;

let res = twoSumBruteForce(nums, target);
console.log('Method 1: res = ', res);

// Method 2
res = twoSumHashTable(nums, target);
console.log('Method 2: res = ', res);

export {};
