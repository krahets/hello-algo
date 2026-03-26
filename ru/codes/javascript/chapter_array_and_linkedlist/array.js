/**
 * File: array.js
 * Created Time: 2022-11-27
 * Author: IsChristina (christinaxia77@foxmail.com)
 */

/* Случайный доступ к элементу */
function randomAccess(nums) {
    // Случайно выбрать число в интервале [0, nums.length)
    const random_index = Math.floor(Math.random() * nums.length);
    // Получить и вернуть случайный элемент
    const random_num = nums[random_index];
    return random_num;
}

/* Увеличить длину массива */
// Обратите внимание: Array в JavaScript является динамическим массивом и может расширяться напрямую
// Для удобства обучения в этой функции Array рассматривается как массив неизменяемой длины
function extend(nums, enlarge) {
    // Инициализировать массив увеличенной длины
    const res = new Array(nums.length + enlarge).fill(0);
    // Скопировать все элементы исходного массива в новый массив
    for (let i = 0; i < nums.length; i++) {
        res[i] = nums[i];
    }
    // Вернуть новый расширенный массив
    return res;
}

/* Вставить элемент num в массив по индексу index */
function insert(nums, num, index) {
    // Сдвинуть индекс index и все последующие элементы на одну позицию назад
    for (let i = nums.length - 1; i > index; i--) {
        nums[i] = nums[i - 1];
    }
    // Присвоить num элементу по индексу index
    nums[index] = num;
}

/* Удалить элемент по индексу index */
function remove(nums, index) {
    // Сдвинуть все элементы после индекса index на одну позицию вперед
    for (let i = index; i < nums.length - 1; i++) {
        nums[i] = nums[i + 1];
    }
}

/* Перебрать массив */
function traverse(nums) {
    let count = 0;
    // Обходить массив по индексам
    for (let i = 0; i < nums.length; i++) {
        count += nums[i];
    }
    // Непосредственно обходить элементы массива
    for (const num of nums) {
        count += num;
    }
}

/* Найти заданный элемент в массиве */
function find(nums, target) {
    for (let i = 0; i < nums.length; i++) {
        if (nums[i] === target) return i;
    }
    return -1;
}

/* Driver Code */
/* Инициализировать массив */
const arr = new Array(5).fill(0);
console.log('массив arr =', arr);
let nums = [1, 3, 2, 5, 4];
console.log('массив nums =', nums);

/* Случайный доступ */
let random_num = randomAccess(nums);
console.log('Полученный случайный элемент из nums', random_num);

/* Расширение длины */
nums = extend(nums, 3);
console.log('После расширения длины массива до 8 получаем nums =', nums);

/* Вставить элемент */
insert(nums, 6, 3);
console.log('После вставки числа 6 по индексу 3 получаем nums =', nums);

/* Удалить элемент */
remove(nums, 2);
console.log('После удаления элемента по индексу 2 получаем nums =', nums);

/* Перебрать массив */
traverse(nums);

/* Найти элемент */
let index = find(nums, 3);
console.log('Поиск элемента 3 в nums дает индекс =', index);
