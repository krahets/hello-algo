/**
 * File: binary_search_recur.ts
 * Created Time: 2023-07-30
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* Бинарный поиск: задача f(i, j) */
function dfs(nums: number[], target: number, i: number, j: number): number {
    // Если интервал пуст, целевой элемент отсутствует, вернуть -1
    if (i > j) {
        return -1;
    }
    // Вычислить индекс середины m
    const m = i + ((j - i) >> 1);
    if (nums[m] < target) {
        // Рекурсивная подзадача f(m+1, j)
        return dfs(nums, target, m + 1, j);
    } else if (nums[m] > target) {
        // Рекурсивная подзадача f(i, m-1)
        return dfs(nums, target, i, m - 1);
    } else {
        // Целевой элемент найден, вернуть его индекс
        return m;
    }
}

/* Бинарный поиск */
function binarySearch(nums: number[], target: number): number {
    const n = nums.length;
    // Решить задачу f(0, n-1)
    return dfs(nums, target, 0, n - 1);
}

/* Driver Code */
const target = 6;
const nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];
// Бинарный поиск (двусторонне замкнутый интервал)
const index = binarySearch(nums, target);
console.log(`Индекс целевого элемента 6 = ${index}`);

export {};
