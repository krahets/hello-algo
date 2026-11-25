/**
 * File: counting_sort.ts
 * Created Time: 2023-04-08
 * Author: Justin (xiefahit@gmail.com)
 */

/* Сортировка подсчётом */
// Простая реализация, непригодная для сортировки объектов
function countingSortNaive(nums: number[]): void {
    // 1. Найти максимальный элемент m в массиве
    let m: number = Math.max(...nums);
    // 2. Подсчитать число вхождений каждого значения
    // counter[num] — число вхождений num
    const counter: number[] = new Array<number>(m + 1).fill(0);
    for (const num of nums) {
        counter[num]++;
    }
    // 3. Пройти по counter и записать элементы в исходный массив nums
    let i = 0;
    for (let num = 0; num < m + 1; num++) {
        for (let j = 0; j < counter[num]; j++, i++) {
            nums[i] = num;
        }
    }
}

/* Сортировка подсчётом */
// Полная реализация: устойчивая сортировка с поддержкой объектов
function countingSort(nums: number[]): void {
    // 1. Найти максимальный элемент m в массиве
    let m: number = Math.max(...nums);
    // 2. Подсчитать число вхождений каждого значения
    // counter[num] — число вхождений num
    const counter: number[] = new Array<number>(m + 1).fill(0);
    for (const num of nums) {
        counter[num]++;
    }
    // 3. Вычислить префиксные суммы в counter, чтобы по частотам найти конечные позиции
    // То есть counter[num]-1 — индекс последнего вхождения num в res
    for (let i = 0; i < m; i++) {
        counter[i + 1] += counter[i];
    }
    // 4. Пройти по nums в обратном порядке и записать элементы в массив результата res
    // Создать массив res для результата
    const n = nums.length;
    const res: number[] = new Array<number>(n);
    for (let i = n - 1; i >= 0; i--) {
        const num = nums[i];
        res[counter[num] - 1] = num; // Поместить num по соответствующему индексу
        counter[num]--; // Уменьшить префиксную сумму на 1, чтобы определить позицию следующего вхождения num
    }
    // Скопировать результат из res в исходный массив nums
    for (let i = 0; i < n; i++) {
        nums[i] = res[i];
    }
}

/* Тестовый пример */
const nums = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4];
countingSortNaive(nums);
console.log('После сортировки подсчётом (без поддержки объектов) nums =', nums);

const nums1 = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4];
countingSort(nums1);
console.log('После сортировки подсчётом nums1 =', nums1);

export {};
