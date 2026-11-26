/**
 * File: binary_search_edge.js
 * Created Time: 2023-08-22
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

const { binarySearchInsertion } = require('./binary_search_insertion.js');

/* Двоичный поиск первого вхождения target */
function binarySearchLeftEdge(nums, target) {
    // Задача равносильна поиску позиции вставки target
    const i = binarySearchInsertion(nums, target);
    // Значение target не найдено, возвращаем -1
    if (i === nums.length || nums[i] !== target) {
        return -1;
    }
    // Значение target найдено, возвращаем индекс i
    return i;
}

/* Двоичный поиск последнего вхождения target */
function binarySearchRightEdge(nums, target) {
    // Сводим задачу к поиску первого вхождения target + 1
    const i = binarySearchInsertion(nums, target + 1);
    // j указывает на последнее вхождение target, а i — на первый элемент, больший target
    const j = i - 1;
    // Значение target не найдено, возвращаем -1
    if (j === -1 || nums[j] !== target) {
        return -1;
    }
    // Значение target найдено, возвращаем индекс j
    return j;
}

/* Пример использования */
// Массив с повторяющимися элементами
const nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15];
console.log('\nМассив nums = ' + nums);
// Двоичный поиск левой и правой границ
for (const target of [6, 7]) {
    let index = binarySearchLeftEdge(nums, target);
    console.log('Индекс первого вхождения ' + target + ' равен ' + index);
    index = binarySearchRightEdge(nums, target);
    console.log('Индекс последнего вхождения ' + target + ' равен ' + index);
}
