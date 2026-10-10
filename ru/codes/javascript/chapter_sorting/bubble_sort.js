/**
 * File: bubble_sort.js
 * Created Time: 2022-12-01
 * Author: IsChristina (christinaxia77@foxmail.com)
 */

/* Пузырьковая сортировка */
function bubbleSort(nums) {
    // Внешний цикл: неотсортированный диапазон [0, i]
    for (let i = nums.length - 1; i > 0; i--) {
        // Внутренний цикл: переместить максимальный элемент неотсортированного диапазона [0, i] в его правый конец
        for (let j = 0; j < i; j++) {
            if (nums[j] > nums[j + 1]) {
                // Поменять местами nums[j] и nums[j + 1]
                let tmp = nums[j];
                nums[j] = nums[j + 1];
                nums[j + 1] = tmp;
            }
        }
    }
}

/* Пузырьковая сортировка (оптимизация флагом) */
function bubbleSortWithFlag(nums) {
    // Внешний цикл: неотсортированный диапазон [0, i]
    for (let i = nums.length - 1; i > 0; i--) {
        let flag = false; // Инициализировать флаг
        // Внутренний цикл: переместить максимальный элемент неотсортированного диапазона [0, i] в его правый конец
        for (let j = 0; j < i; j++) {
            if (nums[j] > nums[j + 1]) {
                // Поменять местами nums[j] и nums[j + 1]
                let tmp = nums[j];
                nums[j] = nums[j + 1];
                nums[j + 1] = tmp;
                flag = true; // Записать обмен элементов
            }
        }
        if (!flag) break; // На этой итерации «всплытия» не было ни одного обмена, сразу выйти
    }
}

/* Driver Code */
const nums = [4, 1, 3, 1, 5, 2];
bubbleSort(nums);
console.log('После пузырьковой сортировки nums =', nums);

const nums1 = [4, 1, 3, 1, 5, 2];
bubbleSortWithFlag(nums1);
console.log('После пузырьковой сортировки nums =', nums1);
