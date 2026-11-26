/**
 * File: binary_search.ts
 * Created Time: 2022-12-27
 * Author: Daniel (better.sunjian@gmail.com)
 */

/* Двоичный поиск на замкнутом интервале */
function binarySearch(nums: number[], target: number): number {
    // Задаём замкнутый интервал [0, n-1]: i указывает на первый элемент, j — на последний
    let i = 0,
        j = nums.length - 1;
    // Повторяем, пока интервал поиска не опустеет (i > j)
    while (i <= j) {
        // Вычисляем индекс середины m
        const m = Math.floor(i + (j - i) / 2);
        if (nums[m] < target) {
            // Искать target следует в интервале [m+1, j]
            i = m + 1;
        } else if (nums[m] > target) {
            // Искать target следует в интервале [i, m-1]
            j = m - 1;
        } else {
            // Элемент найден, возвращаем его индекс
            return m;
        }
    }
    return -1; // Элемент не найден, возвращаем -1
}

/* Двоичный поиск на полуинтервале с открытой правой границей */
function binarySearchLCRO(nums: number[], target: number): number {
    // Задаём полуинтервал [0, n): i указывает на первый элемент, j — на позицию за последним
    let i = 0,
        j = nums.length;
    // Повторяем, пока интервал поиска не опустеет (i = j)
    while (i < j) {
        // Вычисляем индекс середины m
        const m = Math.floor(i + (j - i) / 2);
        if (nums[m] < target) {
            // Искать target следует в интервале [m+1, j)
            i = m + 1;
        } else if (nums[m] > target) {
            // Искать target следует в интервале [i, m)
            j = m;
        } else {
            // Элемент найден, возвращаем его индекс
            return m;
        }
    }
    return -1; // Элемент не найден, возвращаем -1
}

/* Пример использования */
const target = 6;
const nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];

/* Двоичный поиск на замкнутом интервале */
let index = binarySearch(nums, target);
console.info('Индекс элемента 6 = %d', index);

/* Двоичный поиск на полуинтервале с открытой правой границей */
index = binarySearchLCRO(nums, target);
console.info('Индекс элемента 6 = %d', index);

export {};
