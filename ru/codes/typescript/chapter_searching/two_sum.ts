/**
 * File: two_sum.ts
 * Created Time: 2022-12-15
 * Author: gyt95 (gytkwan@gmail.com)
 */

/* Метод 1: полный перебор */
function twoSumBruteForce(nums: number[], target: number): number[] {
    const n = nums.length;
    // Два вложенных цикла, временная сложность O(n^2)
    for (let i = 0; i < n; i++) {
        for (let j = i + 1; j < n; j++) {
            if (nums[i] + nums[j] === target) {
                return [i, j];
            }
        }
    }
    return [];
}

/* Метод 2: вспомогательная хеш-таблица */
function twoSumHashTable(nums: number[], target: number): number[] {
    // Вспомогательная хеш-таблица, пространственная сложность O(n)
    let m: Map<number, number> = new Map();
    // Один цикл, временная сложность O(n)
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

/* Driver Code */
// Метод 1
const nums = [2, 7, 11, 15],
    target = 13;

let res = twoSumBruteForce(nums, target);
console.log('Метод 1: res = ', res);

// Метод 2
res = twoSumHashTable(nums, target);
console.log('Метод 2: res = ', res);

export {};
