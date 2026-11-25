/**
 * File: heap_sort.ts
 * Created Time: 2023-06-04
 * Author: Justin (xiefahit@gmail.com)
 */

/* Размер кучи равен n. Выполнить просеивание вниз от узла i */
function siftDown(nums: number[], n: number, i: number): void {
    while (true) {
        // Найти среди i, l, r узел с наибольшим значением и обозначить его ma
        let l = 2 * i + 1;
        let r = 2 * i + 2;
        let ma = i;
        if (l < n && nums[l] > nums[ma]) {
            ma = l;
        }
        if (r < n && nums[r] > nums[ma]) {
            ma = r;
        }
        // Если максимум уже в i или индексы l и r вне кучи, завершить просеивание
        if (ma === i) {
            break;
        }
        // Поменять два узла местами
        [nums[i], nums[ma]] = [nums[ma], nums[i]];
        // Продолжить просеивание вниз
        i = ma;
    }
}

/* Пирамидальная сортировка */
function heapSort(nums: number[]): void {
    // Построить кучу: выполнить просеивание для всех узлов, кроме листьев
    for (let i = Math.floor(nums.length / 2) - 1; i >= 0; i--) {
        siftDown(nums, nums.length, i);
    }
    // Извлечь максимум из кучи n-1 раз
    for (let i = nums.length - 1; i > 0; i--) {
        // Обменять корень с крайним правым листом (первый элемент с последним)
        [nums[0], nums[i]] = [nums[i], nums[0]];
        // Выполнить просеивание вниз от корня
        siftDown(nums, i, 0);
    }
}

/* Тестовый пример */
const nums: number[] = [4, 1, 3, 1, 5, 2];
heapSort(nums);
console.log('После пирамидальной сортировки nums =', nums);

export {};
