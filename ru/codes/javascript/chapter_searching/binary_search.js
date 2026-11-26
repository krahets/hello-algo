/**
 * File: binary_search.js
 * Created Time: 2022-12-22
 * Author: JoseHung (szhong@link.cuhk.edu.hk)
 */

/* Двоичный поиск на замкнутом интервале */
function binarySearch(nums, target) {
    // Задаём замкнутый интервал [0, n-1]: i указывает на первый элемент, j — на последний
    let i = 0,
        j = nums.length - 1;
    // Повторяем, пока интервал поиска не опустеет (i > j)
    while (i <= j) {
        // Вычисляем индекс середины m с округлением вниз с помощью parseInt()
        const m = parseInt(i + (j - i) / 2);
        if (nums[m] < target)
            // Искать target следует в интервале [m+1, j]
            i = m + 1;
        else if (nums[m] > target)
            // Искать target следует в интервале [i, m-1]
            j = m - 1;
        else return m; // Элемент найден, возвращаем его индекс
    }
    // Элемент не найден, возвращаем -1
    return -1;
}

/* Двоичный поиск на полуинтервале с открытой правой границей */
function binarySearchLCRO(nums, target) {
    // Задаём полуинтервал [0, n): i указывает на первый элемент, j — на позицию за последним
    let i = 0,
        j = nums.length;
    // Повторяем, пока интервал поиска не опустеет (i = j)
    while (i < j) {
        // Вычисляем индекс середины m с округлением вниз с помощью parseInt()
        const m = parseInt(i + (j - i) / 2);
        if (nums[m] < target)
            // Искать target следует в интервале [m+1, j)
            i = m + 1;
        else if (nums[m] > target)
            // Искать target следует в интервале [i, m)
            j = m;
        // Элемент найден, возвращаем его индекс
        else return m;
    }
    // Элемент не найден, возвращаем -1
    return -1;
}

/* Пример использования */
const target = 6;
const nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];

/* Двоичный поиск на замкнутом интервале */
let index = binarySearch(nums, target);
console.log('Индекс элемента 6 = ' + index);

/* Двоичный поиск на полуинтервале с открытой правой границей */
index = binarySearchLCRO(nums, target);
console.log('Индекс элемента 6 = ' + index);
