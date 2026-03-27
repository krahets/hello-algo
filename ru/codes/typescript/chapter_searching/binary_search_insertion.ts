/**
 * File: binary_search_insertion.ts
 * Created Time: 2023-08-22
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* Бинарный поиск точки вставки (без повторяющихся элементов) */
function binarySearchInsertionSimple(
    nums: Array<number>,
    target: number
): number {
    let i = 0,
        j = nums.length - 1; // Инициализировать двусторонне замкнутый интервал [0, n-1]
    while (i <= j) {
        const m = Math.floor(i + (j - i) / 2); // Вычислить индекс середины m, используя Math.floor() для округления вниз
        if (nums[m] < target) {
            i = m + 1; // target находится в интервале [m+1, j]
        } else if (nums[m] > target) {
            j = m - 1; // target находится в интервале [i, m-1]
        } else {
            return m; // Найти target и вернуть точку вставки m
        }
    }
    // target не найден, вернуть точку вставки i
    return i;
}

/* Бинарный поиск точки вставки (с повторяющимися элементами) */
function binarySearchInsertion(nums: Array<number>, target: number): number {
    let i = 0,
        j = nums.length - 1; // Инициализировать двусторонне замкнутый интервал [0, n-1]
    while (i <= j) {
        const m = Math.floor(i + (j - i) / 2); // Вычислить индекс середины m, используя Math.floor() для округления вниз
        if (nums[m] < target) {
            i = m + 1; // target находится в интервале [m+1, j]
        } else if (nums[m] > target) {
            j = m - 1; // target находится в интервале [i, m-1]
        } else {
            j = m - 1; // Первый элемент меньше target находится в интервале [i, m-1]
        }
    }
    // Вернуть точку вставки i
    return i;
}

/* Driver Code */
// Массив без повторяющихся элементов
let nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];
console.log('\nМассив nums = ' + nums);
// Бинарный поиск точки вставки
for (const target of [6, 9]) {
    const index = binarySearchInsertionSimple(nums, target);
    console.log('Индекс точки вставки элемента ' + target + ' = ' + index);
}

// Массив с повторяющимися элементами
nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15];
console.log('\nМассив nums = ' + nums);
// Бинарный поиск точки вставки
for (const target of [2, 6, 20]) {
    const index = binarySearchInsertion(nums, target);
    console.log('Индекс точки вставки элемента ' + target + ' = ' + index);
}

export { binarySearchInsertion };
