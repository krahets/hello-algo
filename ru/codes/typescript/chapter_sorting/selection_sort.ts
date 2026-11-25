/**
 * File: selection_sort.ts
 * Created Time: 2023-06-04
 * Author: Justin (xiefahit@gmail.com)
 */

/* Сортировка выбором */
function selectionSort(nums: number[]): void {
    let n = nums.length;
    // Внешний цикл: неотсортированный участок [i, n-1]
    for (let i = 0; i < n - 1; i++) {
        // Внутренний цикл: найти минимум неотсортированного участка
        let k = i;
        for (let j = i + 1; j < n; j++) {
            if (nums[j] < nums[k]) {
                k = j; // Запомнить индекс минимума
            }
        }
        // Поменять минимум местами с первым элементом неотсортированного участка
        [nums[i], nums[k]] = [nums[k], nums[i]];
    }
}

/* Тестовый пример */
const nums: number[] = [4, 1, 3, 1, 5, 2];
selectionSort(nums);
console.log('После сортировки выбором nums =', nums);

export {};
