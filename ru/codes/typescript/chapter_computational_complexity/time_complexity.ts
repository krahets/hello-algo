/**
 * File: time_complexity.ts
 * Created Time: 2023-01-02
 * Author: RiverTwilight (contact@rene.wang)
 */

/* Константная сложность */
function constant(n: number): number {
    let count = 0;
    const size = 100000;
    for (let i = 0; i < size; i++) count++;
    return count;
}

/* Линейная сложность */
function linear(n: number): number {
    let count = 0;
    for (let i = 0; i < n; i++) count++;
    return count;
}

/* Линейная сложность (обход массива) */
function arrayTraversal(nums: number[]): number {
    let count = 0;
    // Число итераций пропорционально длине массива
    for (let i = 0; i < nums.length; i++) {
        count++;
    }
    return count;
}

/* Квадратичная сложность */
function quadratic(n: number): number {
    let count = 0;
    // Число итераций пропорционально квадрату размера данных n
    for (let i = 0; i < n; i++) {
        for (let j = 0; j < n; j++) {
            count++;
        }
    }
    return count;
}

/* Квадратичная сложность (пузырьковая сортировка) */
function bubbleSort(nums: number[]): number {
    let count = 0; // Счётчик
    // Внешний цикл: неотсортированный участок — [0, i]
    for (let i = nums.length - 1; i > 0; i--) {
        // Внутренний цикл обменами перемещает максимум участка [0, i] на его правый край
        for (let j = 0; j < i; j++) {
            if (nums[j] > nums[j + 1]) {
                // Поменять местами nums[j] и nums[j + 1]
                let tmp = nums[j];
                nums[j] = nums[j + 1];
                nums[j + 1] = tmp;
                count += 3; // Обмен элементов состоит из трёх элементарных операций
            }
        }
    }
    return count;
}

/* Экспоненциальная сложность (цикл) */
function exponential(n: number): number {
    let count = 0,
        base = 1;
    // На каждом шаге клетка делится надвое. Получаем 1, 2, 4, 8, ..., 2^(n-1)
    for (let i = 0; i < n; i++) {
        for (let j = 0; j < base; j++) {
            count++;
        }
        base *= 2;
    }
    // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
    return count;
}

/* Экспоненциальная сложность (рекурсия) */
function expRecur(n: number): number {
    if (n === 1) return 1;
    return expRecur(n - 1) + expRecur(n - 1) + 1;
}

/* Логарифмическая сложность (цикл) */
function logarithmic(n: number): number {
    let count = 0;
    while (n > 1) {
        n = n / 2;
        count++;
    }
    return count;
}

/* Логарифмическая сложность (рекурсия) */
function logRecur(n: number): number {
    if (n <= 1) return 0;
    return logRecur(n / 2) + 1;
}

/* Линейно-логарифмическая сложность */
function linearLogRecur(n: number): number {
    if (n <= 1) return 1;
    const half = Math.floor(n / 2);
    let count = linearLogRecur(half) + linearLogRecur(half);
    for (let i = 0; i < n; i++) {
        count++;
    }
    return count;
}

/* Факториальная сложность (рекурсия) */
function factorialRecur(n: number): number {
    if (n === 0) return 1;
    let count = 0;
    // Разветвить одну задачу на n подзадач
    for (let i = 0; i < n; i++) {
        count += factorialRecur(n - 1);
    }
    return count;
}

/* Основная программа */
// Попробуйте менять n и следить за ростом числа операций при разной сложности
const n = 8;
console.log('Размер входных данных n = ' + n);

let count = constant(n);
console.log('Число операций при константной сложности = ' + count);

count = linear(n);
console.log('Число операций при линейной сложности = ' + count);
count = arrayTraversal(new Array(n));
console.log('Число операций при линейной сложности (обход массива) = ' + count);

count = quadratic(n);
console.log('Число операций при квадратичной сложности = ' + count);
var nums = new Array(n);
for (let i = 0; i < n; i++) nums[i] = n - i; // [n,n-1,...,2,1]
count = bubbleSort(nums);
console.log('Число операций при квадратичной сложности (пузырьковая сортировка) = ' + count);

count = exponential(n);
console.log('Число операций при экспоненциальной сложности (цикл) = ' + count);
count = expRecur(n);
console.log('Число операций при экспоненциальной сложности (рекурсия) = ' + count);

count = logarithmic(n);
console.log('Число операций при логарифмической сложности (цикл) = ' + count);
count = logRecur(n);
console.log('Число операций при логарифмической сложности (рекурсия) = ' + count);

count = linearLogRecur(n);
console.log('Число операций при линейно-логарифмической сложности (рекурсия) = ' + count);

count = factorialRecur(n);
console.log('Число операций при факториальной сложности (рекурсия) = ' + count);

export {};
