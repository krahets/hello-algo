/**
 * File: two_sum.js
 * Created Time: 2022-12-15
 * Author: gyt95 (gytkwan@gmail.com)
 */

/* Метод 1: полный перебор */
function twoSumBruteForce(nums, target) {
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
function twoSumHashTable(nums, target) {
    // Вспомогательная хеш-таблица, пространственная сложность O(n)
    let m = {};
    // Один цикл, временная сложность O(n)
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
// Метод 1
const nums = [2, 7, 11, 15],
    target = 13;

let res = twoSumBruteForce(nums, target);
console.log('Результат метода 1 res = ', res);

// Метод 2
res = twoSumHashTable(nums, target);
console.log('Результат метода 2 res = ', res);
