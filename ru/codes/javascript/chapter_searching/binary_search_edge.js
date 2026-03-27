/**
 * File: binary_search_edge.js
 * Created Time: 2023-08-22
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

const { binarySearchInsertion } = require('./binary_search_insertion.js');

/* Бинарный поиск самого левого target */
function binarySearchLeftEdge(nums, target) {
    // Эквивалентно поиску точки вставки target
    const i = binarySearchInsertion(nums, target);
    // target не найден, вернуть -1
    if (i === nums.length || nums[i] !== target) {
        return -1;
    }
    // Найти target и вернуть индекс i
    return i;
}

/* Бинарный поиск самого правого target */
function binarySearchRightEdge(nums, target) {
    // Преобразовать задачу в поиск самого левого target + 1
    const i = binarySearchInsertion(nums, target + 1);
    // j указывает на самый правый target, а i — на первый элемент больше target
    const j = i - 1;
    // target не найден, вернуть -1
    if (j === -1 || nums[j] !== target) {
        return -1;
    }
    // Найти target и вернуть индекс j
    return j;
}

/* Driver Code */
// Массив с повторяющимися элементами
const nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15];
console.log('\nМассив nums = ' + nums);
// Бинарный поиск левой и правой границы
for (const target of [6, 7]) {
    let index = binarySearchLeftEdge(nums, target);
    console.log('Индекс самого левого элемента ' + target + ' равен ' + index);
    index = binarySearchRightEdge(nums, target);
    console.log('Индекс самого правого элемента ' + target + ' равен ' + index);
}
