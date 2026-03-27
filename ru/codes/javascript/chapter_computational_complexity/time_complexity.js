/**
 * File: time_complexity.js
 * Created Time: 2023-01-02
 * Author: RiverTwilight (contact@rene.wang)
 */

/* Постоянная сложность */
function constant(n) {
    let count = 0;
    const size = 100000;
    for (let i = 0; i < size; i++) count++;
    return count;
}

/* Линейная сложность */
function linear(n) {
    let count = 0;
    for (let i = 0; i < n; i++) count++;
    return count;
}

/* Линейная сложность (обход массива) */
function arrayTraversal(nums) {
    let count = 0;
    // Число итераций пропорционально длине массива
    for (let i = 0; i < nums.length; i++) {
        count++;
    }
    return count;
}

/* Квадратичная сложность */
function quadratic(n) {
    let count = 0;
    // Число итераций квадратично зависит от размера данных n
    for (let i = 0; i < n; i++) {
        for (let j = 0; j < n; j++) {
            count++;
        }
    }
    return count;
}

/* Квадратичная сложность (пузырьковая сортировка) */
function bubbleSort(nums) {
    let count = 0; // Счетчик
    // Внешний цикл: неотсортированный диапазон [0, i]
    for (let i = nums.length - 1; i > 0; i--) {
        // Внутренний цикл: переместить максимальный элемент неотсортированного диапазона [0, i] в его правый конец
        for (let j = 0; j < i; j++) {
            if (nums[j] > nums[j + 1]) {
                // Поменять местами nums[j] и nums[j + 1]
                let tmp = nums[j];
                nums[j] = nums[j + 1];
                nums[j + 1] = tmp;
                count += 3; // Обмен элементов включает 3 элементарные операции
            }
        }
    }
    return count;
}

/* Экспоненциальная сложность (итеративная реализация) */
function exponential(n) {
    let count = 0,
        base = 1;
    // На каждом шаге клетка делится надвое, образуя последовательность 1, 2, 4, 8, ..., 2^(n-1)
    for (let i = 0; i < n; i++) {
        for (let j = 0; j < base; j++) {
            count++;
        }
        base *= 2;
    }
    // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
    return count;
}

/* Экспоненциальная сложность (рекурсивная реализация) */
function expRecur(n) {
    if (n === 1) return 1;
    return expRecur(n - 1) + expRecur(n - 1) + 1;
}

/* Логарифмическая сложность (итеративная реализация) */
function logarithmic(n) {
    let count = 0;
    while (n > 1) {
        n = n / 2;
        count++;
    }
    return count;
}

/* Логарифмическая сложность (рекурсивная реализация) */
function logRecur(n) {
    if (n <= 1) return 0;
    return logRecur(n / 2) + 1;
}

/* Линейно-логарифмическая сложность */
function linearLogRecur(n) {
    if (n <= 1) return 1;
    let count = linearLogRecur(n / 2) + linearLogRecur(n / 2);
    for (let i = 0; i < n; i++) {
        count++;
    }
    return count;
}

/* Факториальная сложность (рекурсивная реализация) */
function factorialRecur(n) {
    if (n === 0) return 1;
    let count = 0;
    // Из одного получается n
    for (let i = 0; i < n; i++) {
        count += factorialRecur(n - 1);
    }
    return count;
}

/* Driver Code */
// Можно изменить n и запустить программу, чтобы увидеть, как меняется число операций при разных сложностях
const n = 8;
console.log('Размер входных данных n = ' + n);

let count = constant(n);
console.log('Число операций константной сложности = ' + count);

count = linear(n);
console.log('Число операций линейной сложности = ' + count);
count = arrayTraversal(new Array(n));
console.log('Число операций линейной сложности (обход массива) = ' + count);

count = quadratic(n);
console.log('Число операций квадратичной сложности = ' + count);
let nums = new Array(n);
for (let i = 0; i < n; i++) nums[i] = n - i; // [n,n-1,...,2,1]
count = bubbleSort(nums);
console.log('Число операций квадратичной сложности (пузырьковая сортировка) = ' + count);

count = exponential(n);
console.log('Число операций экспоненциальной сложности (итеративная реализация) = ' + count);
count = expRecur(n);
console.log('Число операций экспоненциальной сложности (рекурсивная реализация) = ' + count);

count = logarithmic(n);
console.log('Число операций логарифмической сложности (итеративная реализация) = ' + count);
count = logRecur(n);
console.log('Число операций логарифмической сложности (рекурсивная реализация) = ' + count);

count = linearLogRecur(n);
console.log('Число операций линейно-логарифмической сложности (рекурсивная реализация) = ' + count);

count = factorialRecur(n);
console.log('Число операций факториальной сложности (рекурсивная реализация) = ' + count);
