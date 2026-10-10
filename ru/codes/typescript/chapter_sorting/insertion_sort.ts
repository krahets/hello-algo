/**
 * File: insertion_sort.ts
 * Created Time: 2022-12-12
 * Author: Justin (xiefahit@gmail.com)
 */

/* Сортировка вставками */
function insertionSort(nums: number[]): void {
    // Внешний цикл: отсортированный диапазон [0, i-1]
    for (let i = 1; i < nums.length; i++) {
        const base = nums[i];
        let j = i - 1;
        // Внутренний цикл: вставить base в правильную позицию отсортированного диапазона [0, i-1]
        while (j >= 0 && nums[j] > base) {
            nums[j + 1] = nums[j]; // Сдвинуть nums[j] на одну позицию вправо
            j--;
        }
        nums[j + 1] = base; // Поместить base в правильную позицию
    }
}

/* Driver Code */
const nums = [4, 1, 3, 1, 5, 2];
insertionSort(nums);
console.log('После завершения сортировки вставками nums =', nums);

export {};
