/**
 * File: array.js
 * Created Time: 2022-11-27
 * Author: IsChristina (christinaxia77@foxmail.com)
 */

/* Случайный доступ к элементу */
function randomAccess(nums) {
    // Случайным образом выбрать число из интервала [0, nums.length)
    const random_index = Math.floor(Math.random() * nums.length);
    // Получить и вернуть случайный элемент
    const random_num = nums[random_index];
    return random_num;
}

/* Увеличить длину массива */
// Обратите внимание: Array в JavaScript — это динамический массив, его можно расширять напрямую
// Для удобства обучения в этой функции Array рассматривается как массив неизменяемой длины
function extend(nums, enlarge) {
    // Инициализировать массив увеличенной длины
    const res = new Array(nums.length + enlarge).fill(0);
    // Скопировать все элементы исходного массива в новый массив
    for (let i = 0; i < nums.length; i++) {
        res[i] = nums[i];
    }
    // Вернуть новый массив после расширения
    return res;
}

/* Вставить элемент num по индексу index в массив */
function insert(nums, num, index) {
    // Сдвинуть элемент с индексом index и все последующие элементы на одну позицию назад
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

/* Обход массива */
function traverse(nums) {
    let count = 0;
    // Обход массива по индексам
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
/* Инициализация массива */
const arr = new Array(5).fill(0);
console.log('Массив arr =', arr);
let nums = [1, 3, 2, 5, 4];
console.log('Массив nums =', nums);

/* Случайный доступ */
let random_num = randomAccess(nums);
console.log('Случайный элемент из nums =', random_num);

/* Расширение длины */
nums = extend(nums, 3);
console.log('После увеличения длины массива до 8 nums =', nums);

/* Вставка элемента */
insert(nums, 6, 3);
console.log('После вставки числа 6 по индексу 3 nums =', nums);

/* Удаление элемента */
remove(nums, 2);
console.log('После удаления элемента по индексу 2 nums =', nums);

/* Обход массива */
traverse(nums);

/* Поиск элемента */
let index = find(nums, 3);
console.log('Поиск элемента 3 в nums: индекс =', index);
