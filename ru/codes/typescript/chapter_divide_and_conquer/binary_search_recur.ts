/**
 * File: binary_search_recur.ts
 * Created Time: 2023-07-30
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* Двоичный поиск: задача f(i, j) */
function dfs(nums: number[], target: number, i: number, j: number): number {
    // Если интервал пуст, искомого элемента нет. Возвращаем -1
    if (i > j) {
        return -1;
    }
    // Вычисляем индекс середины m
    const m = i + ((j - i) >> 1);
    if (nums[m] < target) {
        // Рекурсивно решаем подзадачу f(m+1, j)
        return dfs(nums, target, m + 1, j);
    } else if (nums[m] > target) {
        // Рекурсивно решаем подзадачу f(i, m-1)
        return dfs(nums, target, i, m - 1);
    } else {
        // Искомый элемент найден. Возвращаем его индекс
        return m;
    }
}

/* Двоичный поиск */
function binarySearch(nums: number[], target: number): number {
    const n = nums.length;
    // Решаем задачу f(0, n-1)
    return dfs(nums, target, 0, n - 1);
}

/* Основная программа */
const target = 6;
const nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];
// Двоичный поиск (замкнутый интервал)
const index = binarySearch(nums, target);
console.log(`Индекс элемента 6 = ${index}`);

export {};
