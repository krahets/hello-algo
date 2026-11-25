/**
 * File: radix_sort.js
 * Created Time: 2023-04-08
 * Author: Justin (xiefahit@gmail.com)
 */

/* Получить k-ю цифру числа num, где exp = 10^(k-1) */
function digit(num, exp) {
    // Передаём exp вместо k, чтобы не повторять дорогое возведение в степень
    return Math.floor(num / exp) % 10;
}

/* Сортировка подсчётом по k-й цифре элементов nums */
function countingSortDigit(nums, exp) {
    // Десятичные цифры лежат в пределах 0–9, поэтому в массиве блоков 10 ячеек
    const counter = new Array(10).fill(0);
    const n = nums.length;
    // Подсчитать вхождения каждой цифры от 0 до 9
    for (let i = 0; i < n; i++) {
        const d = digit(nums[i], exp); // Получить k-ю цифру nums[i] и обозначить её d
        counter[d]++; // Подсчитать вхождения цифры d
    }
    // Вычислить префиксные суммы, чтобы по частотам найти индексы в массиве
    for (let i = 1; i < 10; i++) {
        counter[i] += counter[i - 1];
    }
    // Пройти массив с конца и заполнить res по данным счётчиков
    const res = new Array(n).fill(0);
    for (let i = n - 1; i >= 0; i--) {
        const d = digit(nums[i], exp);
        const j = counter[d] - 1; // Найти индекс j в массиве для цифры d
        res[j] = nums[i]; // Записать текущий элемент по индексу j
        counter[d]--; // Уменьшить счётчик d на 1
    }
    // Скопировать результат в исходный массив nums
    for (let i = 0; i < n; i++) {
        nums[i] = res[i];
    }
}

/* Поразрядная сортировка */
function radixSort(nums) {
    // Найти максимум массива, чтобы определить наибольшее число разрядов
    let m = Math.max(... nums);
    // Перебирать разряды от младшего к старшему
    for (let exp = 1; exp <= m; exp *= 10) {
        // Отсортировать элементы подсчётом по k-й цифре
        // k = 1 -> exp = 1
        // k = 2 -> exp = 10
        // То есть exp = 10^(k-1)
        countingSortDigit(nums, exp);
    }
}

/* Тестовый пример */
const nums = [
    10546151, 35663510, 42865989, 34862445, 81883077, 88906420, 72429244,
    30524779, 82060337, 63832996,
];
radixSort(nums);
console.log('После поразрядной сортировки nums =', nums);
