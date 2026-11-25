/**
 * File: array.ts
 * Created Time: 2022-12-04
 * Author: Justin (xiefahit@gmail.com)
 */

/* Чтение случайного элемента */
function randomAccess(nums: number[]): number {
    // Выбрать случайное число из интервала [0, nums.length)
    const random_index = Math.floor(Math.random() * nums.length);
    // Получить и вернуть случайный элемент
    const random_num = nums[random_index];
    return random_num;
}

/* Увеличение длины массива */
// В TypeScript Array — динамический массив, который можно расширять напрямую
// В этом учебном примере функция рассматривает Array как массив фиксированной длины
function extend(nums: number[], enlarge: number): number[] {
    // Создать массив увеличенной длины
    const res = new Array(nums.length + enlarge).fill(0);
    // Скопировать все элементы исходного массива в новый
    for (let i = 0; i < nums.length; i++) {
        res[i] = nums[i];
    }
    // Вернуть новый массив увеличенной длины
    return res;
}

/* Вставить num в массив по индексу index */
function insert(nums: number[], num: number, index: number): void {
    // Сдвинуть на одну позицию вправо все элементы начиная с index
    for (let i = nums.length - 1; i > index; i--) {
        nums[i] = nums[i - 1];
    }
    // Записать num по индексу index
    nums[index] = num;
}

/* Удалить элемент по индексу index */
function remove(nums: number[], index: number): void {
    // Сдвинуть все элементы после index на одну позицию влево
    for (let i = index; i < nums.length - 1; i++) {
        nums[i] = nums[i + 1];
    }
}

/* Обход массива */
function traverse(nums: number[]): void {
    let count = 0;
    // Обойти массив по индексам
    for (let i = 0; i < nums.length; i++) {
        count += nums[i];
    }
    // Перебрать элементы массива напрямую
    for (const num of nums) {
        count += num;
    }
}

/* Поиск заданного элемента в массиве */
function find(nums: number[], target: number): number {
    for (let i = 0; i < nums.length; i++) {
        if (nums[i] === target) {
            return i;
        }
    }
    return -1;
}

/* Демонстрационный код */
/* Инициализация массива */
const arr: number[] = new Array(5).fill(0);
console.log('Массив arr =', arr);
let nums: number[] = [1, 3, 2, 5, 4];
console.log('Массив nums =', nums);

/* Чтение случайного элемента */
let random_num = randomAccess(nums);
console.log('Случайный элемент nums:', random_num);

/* Увеличение длины */
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
console.log('Индекс элемента 3 в nums =', index);

export {};
