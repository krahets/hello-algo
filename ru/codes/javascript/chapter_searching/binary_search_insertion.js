/**
 * File: binary_search_insertion.js
 * Created Time: 2023-08-22
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* Двоичный поиск позиции вставки без повторов */
function binarySearchInsertionSimple(nums, target) {
    let i = 0,
        j = nums.length - 1; // Задаём замкнутый интервал [0, n-1]
    while (i <= j) {
        const m = Math.floor(i + (j - i) / 2); // Вычисляем индекс середины m с округлением вниз с помощью Math.floor()
        if (nums[m] < target) {
            i = m + 1; // Ищем target в интервале [m+1, j]
        } else if (nums[m] > target) {
            j = m - 1; // Ищем target в интервале [i, m-1]
        } else {
            return m; // Значение target найдено, возвращаем позицию вставки m
        }
    }
    // Значение target не найдено, возвращаем позицию вставки i
    return i;
}

/* Двоичный поиск позиции вставки при наличии повторов */
function binarySearchInsertion(nums, target) {
    let i = 0,
        j = nums.length - 1; // Задаём замкнутый интервал [0, n-1]
    while (i <= j) {
        const m = Math.floor(i + (j - i) / 2); // Вычисляем индекс середины m с округлением вниз с помощью Math.floor()
        if (nums[m] < target) {
            i = m + 1; // Ищем target в интервале [m+1, j]
        } else if (nums[m] > target) {
            j = m - 1; // Ищем target в интервале [i, m-1]
        } else {
            j = m - 1; // В интервале [i, m-1] ищем последний элемент, меньший target
        }
    }
    // Возвращаем позицию вставки i
    return i;
}

/* Пример использования */
if (require.main === module) {
    // Массив без повторяющихся элементов
    let nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];
    console.log('\nМассив nums = ' + nums);
    // Двоичный поиск позиции вставки
    for (const target of [6, 9]) {
        const index = binarySearchInsertionSimple(nums, target);
        console.log('Позиция вставки элемента ' + target + ' равна ' + index);
    }

    // Массив с повторяющимися элементами
    nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15];
    console.log('\nМассив nums = ' + nums);
    // Двоичный поиск позиции вставки
    for (const target of [2, 6, 20]) {
        const index = binarySearchInsertion(nums, target);
        console.log('Позиция вставки элемента ' + target + ' равна ' + index);
    }
}

module.exports = {
    binarySearchInsertion,
};
