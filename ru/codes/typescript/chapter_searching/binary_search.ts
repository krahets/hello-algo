/**
 * File: binary_search.ts
 * Created Time: 2022-12-27
 * Author: Daniel (better.sunjian@gmail.com)
 */

/* Бинарный поиск (двусторонний закрытый интервал) */
function binarySearch(nums: number[], target: number): number {
    // Инициализировать закрытый интервал [0, n-1], где i и j указывают на первый и последний элементы массива
    let i = 0,
        j = nums.length - 1;
    // Выполнять цикл и выйти, когда диапазон поиска станет пустым (при i > j он пуст)
    while (i <= j) {
        // Вычислить средний индекс m
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

/* Бинарный поиск (левый закрытый, правый открытый интервал) */
function binarySearchLCRO(nums: number[], target: number): number {
    // Инициализировать интервал [0, n), где i и j указывают на первый элемент массива и позицию за последним элементом
    let i = 0,
        j = nums.length;
    // Выполнять цикл и выйти, когда диапазон поиска станет пустым (при i = j он пуст)
    while (i < j) {
        // Вычислить средний индекс m
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

/* Бинарный поиск (двусторонний закрытый интервал) */
let index = binarySearch(nums, target);
console.info('Индекс целевого элемента 6 = %d', index);

/* Бинарный поиск (левый закрытый, правый открытый интервал) */
index = binarySearchLCRO(nums, target);
console.info('Индекс целевого элемента 6 = %d', index);

export {};
