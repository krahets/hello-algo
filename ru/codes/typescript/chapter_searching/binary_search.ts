/**
 * File: binary_search.ts
 * Created Time: 2022-12-27
 * Author: Daniel (better.sunjian@gmail.com)
 */

/* Двоичный поиск (замкнутый интервал) */
function binarySearch(nums: number[], target: number): number {
    // Инициализировать замкнутый интервал [0, n-1], то есть i и j указывают на первый и последний элементы массива соответственно
    let i = 0,
        j = nums.length - 1;
    // Цикл завершается, когда диапазон поиска пуст (при i > j диапазон пуст)
    while (i <= j) {
        // Вычислить индекс середины m
        const m = Math.floor(i + (j - i) / 2);
        if (nums[m] < target) {
            // Это означает, что target находится в интервале [m+1, j]
            i = m + 1;
        } else if (nums[m] > target) {
            // Это означает, что target находится в интервале [i, m-1]
            j = m - 1;
        } else {
            // Целевой элемент найден, вернуть его индекс
            return m;
        }
    }
    return -1; // Целевой элемент не найден, вернуть -1
}

/* Двоичный поиск (интервал, замкнутый слева и открытый справа) */
function binarySearchLCRO(nums: number[], target: number): number {
    // Инициализация интервала [0, n), замкнутого слева и открытого справа: i указывает на первый элемент массива, а j — на позицию сразу за последним
    let i = 0,
        j = nums.length;
    // Цикл завершается, когда диапазон поиска пуст (при i = j диапазон пуст)
    while (i < j) {
        // Вычислить индекс середины m
        const m = Math.floor(i + (j - i) / 2);
        if (nums[m] < target) {
            // Это означает, что target находится в интервале [m+1, j)
            i = m + 1;
        } else if (nums[m] > target) {
            // Это означает, что target находится в интервале [i, m)
            j = m;
        } else {
            // Целевой элемент найден, вернуть его индекс
            return m;
        }
    }
    return -1; // Целевой элемент не найден, вернуть -1
}

/* Driver Code */
const target = 6;
const nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];

/* Двоичный поиск (замкнутый интервал) */
let index = binarySearch(nums, target);
console.info('Индекс целевого элемента 6 = %d', index);

/* Двоичный поиск (интервал, замкнутый слева и открытый справа) */
index = binarySearchLCRO(nums, target);
console.info('Индекс целевого элемента 6 = %d', index);

export {};
