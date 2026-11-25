/**
 * File: bubble_sort.js
 * Created Time: 2022-12-01
 * Author: IsChristina (christinaxia77@foxmail.com)
 */

/* Сортировка пузырьком */
function bubbleSort(nums) {
    // Внешний цикл: неотсортированный участок [0, i]
    for (let i = nums.length - 1; i > 0; i--) {
        // Внутренний цикл: обменами переместить максимум участка [0, i] на его правый конец
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

/* Сортировка пузырьком с флагом обмена*/
function bubbleSortWithFlag(nums) {
    // Внешний цикл: неотсортированный участок [0, i]
    for (let i = nums.length - 1; i > 0; i--) {
        let flag = false; // Инициализировать флаг
        // Внутренний цикл: обменами переместить максимум участка [0, i] на его правый конец
        for (let j = 0; j < i; j++) {
            if (nums[j] > nums[j + 1]) {
                // Поменять местами nums[j] и nums[j + 1]
                let tmp = nums[j];
                nums[j] = nums[j + 1];
                nums[j + 1] = tmp;
                flag = true; // Отметить, что произошёл обмен
            }
        }
        if (!flag) break; // За этот проход обменов не было. Выйти из цикла
    }
}

/* Тестовый пример */
const nums = [4, 1, 3, 1, 5, 2];
bubbleSort(nums);
console.log('После сортировки пузырьком nums =', nums);

const nums1 = [4, 1, 3, 1, 5, 2];
bubbleSortWithFlag(nums1);
console.log('После сортировки пузырьком nums =', nums1);
