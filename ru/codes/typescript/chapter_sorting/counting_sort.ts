/**
 * File: counting_sort.ts
 * Created Time: 2023-04-08
 * Author: Justin (xiefahit@gmail.com)
 */

/* Сортировка подсчетом */
// Простая реализация, не подходит для сортировки объектов
function countingSortNaive(nums: number[]): void {
    // 1. Найти максимальный элемент массива m
    let m: number = Math.max(...nums);
    // 2. Подсчитать число появлений каждой цифры
    // counter[num] обозначает число появлений num
    const counter: number[] = new Array<number>(m + 1).fill(0);
    for (const num of nums) {
        counter[num]++;
    }
    // 3. Обойти counter и заполнить исходный массив nums элементами
    let i = 0;
    for (let num = 0; num < m + 1; num++) {
        for (let j = 0; j < counter[num]; j++, i++) {
            nums[i] = num;
        }
    }
}

/* Сортировка подсчетом */
// Полная реализация, позволяет сортировать объекты и является стабильной сортировкой
function countingSort(nums: number[]): void {
    // 1. Найти максимальный элемент массива m
    let m: number = Math.max(...nums);
    // 2. Подсчитать число появлений каждой цифры
    // counter[num] обозначает число появлений num
    const counter: number[] = new Array<number>(m + 1).fill(0);
    for (const num of nums) {
        counter[num]++;
    }
    // 3. Вычислить префиксные суммы counter и преобразовать «число появлений» в «конечный индекс»
    // То есть counter[num]-1 — это индекс последнего появления num в res
    for (let i = 0; i < m; i++) {
        counter[i + 1] += counter[i];
    }
    // 4. Обойти nums в обратном порядке и поместить элементы в результирующий массив res
    // Инициализировать массив res для хранения результата
    const n = nums.length;
    const res: number[] = new Array<number>(n);
    for (let i = n - 1; i >= 0; i--) {
        const num = nums[i];
        res[counter[num] - 1] = num; // Поместить num по соответствующему индексу
        counter[num]--; // Уменьшить префиксную сумму на 1, чтобы получить индекс следующего размещения num
    }
    // Перезаписать исходный массив nums массивом результата res
    for (let i = 0; i < n; i++) {
        nums[i] = res[i];
    }
}

/* Driver Code */
const nums = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4];
countingSortNaive(nums);
console.log('После завершения сортировки подсчетом (объекты не сортируются) nums =', nums);

const nums1 = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4];
countingSort(nums1);
console.log('После завершения сортировки подсчетом nums1 =', nums1);

export {};
