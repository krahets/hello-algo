/**
 * File: radix_sort.js
 * Created Time: 2023-04-08
 * Author: Justin (xiefahit@gmail.com)
 */

/* Получить k-й разряд элемента num, где exp = 10^(k-1) */
function digit(num, exp) {
    // Передача exp вместо k позволяет избежать повторного дорогостоящего вычисления степени
    return Math.floor(num / exp) % 10;
}

/* Сортировка подсчетом (сортировка по k-му разряду nums) */
function countingSortDigit(nums, exp) {
    // Разряды десятичной системы лежат в диапазоне 0~9, поэтому нужен массив корзин длины 10
    const counter = new Array(10).fill(0);
    const n = nums.length;
    // Подсчитать число появлений каждой цифры от 0 до 9
    for (let i = 0; i < n; i++) {
        const d = digit(nums[i], exp); // Получить k-й разряд nums[i], обозначив его как d
        counter[d]++; // Подсчитать число появлений цифры d
    }
    // Вычислить префиксные суммы и преобразовать «число появлений» в «индекс массива»
    for (let i = 1; i < 10; i++) {
        counter[i] += counter[i - 1];
    }
    // Выполняя обратный проход, заполнить res элементами по статистике в корзинах
    const res = new Array(n).fill(0);
    for (let i = n - 1; i >= 0; i--) {
        const d = digit(nums[i], exp);
        const j = counter[d] - 1; // Получить индекс j цифры d в массиве
        res[j] = nums[i]; // Поместить текущий элемент по индексу j
        counter[d]--; // Уменьшить количество d на 1
    }
    // Перезаписать исходный массив nums результатом
    for (let i = 0; i < n; i++) {
        nums[i] = res[i];
    }
}

/* Поразрядная сортировка */
function radixSort(nums) {
    // Получить максимальный элемент массива, чтобы определить максимальное число разрядов
    let m = Math.max(... nums);
    // Проходить разряды от младшего к старшему
    for (let exp = 1; exp <= m; exp *= 10) {
        // Выполнить сортировку подсчетом по k-му разряду элементов массива
        // k = 1 -> exp = 1
        // k = 2 -> exp = 10
        // то есть exp = 10^(k-1)
        countingSortDigit(nums, exp);
    }
}

/* Driver Code */
const nums = [
    10546151, 35663510, 42865989, 34862445, 81883077, 88906420, 72429244,
    30524779, 82060337, 63832996,
];
radixSort(nums);
console.log('После поразрядной сортировки nums =', nums);
