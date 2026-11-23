/**
 * File: selection_sort.ts
 * Created Time: 2023-06-04
 * Author: Justin (xiefahit@gmail.com)
 */

/* Сортировка выбором */
function selectionSort(nums: number[]): void {
    let n = nums.length;
    // Внешний цикл: неотсортированный диапазон [i, n-1]
    for (let i = 0; i < n - 1; i++) {
        // Внутренний цикл: найти минимальный элемент в неотсортированном диапазоне
        let k = i;
        for (let j = i + 1; j < n; j++) {
            if (nums[j] < nums[k]) {
                k = j; // Записать индекс минимального элемента
            }
        }
        // Поменять этот минимальный элемент местами с первым элементом неотсортированного диапазона
        [nums[i], nums[k]] = [nums[k], nums[i]];
    }
}

/* Driver Code */
const nums: number[] = [4, 1, 3, 1, 5, 2];
selectionSort(nums);
console.log('После завершения сортировки выбором nums =', nums);

export {};
