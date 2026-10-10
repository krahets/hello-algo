/**
 * File: heap_sort.js
 * Created Time: 2023-06-04
 * Author: Justin (xiefahit@gmail.com)
 */

/* Длина кучи равна n; начиная с узла i, выполнить просеивание сверху вниз */
function siftDown(nums, n, i) {
    while (true) {
        // Определить узел с максимальным значением среди i, l и r и обозначить его как ma
        let l = 2 * i + 1;
        let r = 2 * i + 2;
        let ma = i;
        if (l < n && nums[l] > nums[ma]) {
            ma = l;
        }
        if (r < n && nums[r] > nums[ma]) {
            ma = r;
        }
        // Если узел i уже максимален или индексы l и r вне границ, дальнейшее просеивание не требуется, выйти
        if (ma === i) {
            break;
        }
        // Поменять два узла местами
        [nums[i], nums[ma]] = [nums[ma], nums[i]];
        // Циклическое просеивание вниз
        i = ma;
    }
}

/* Сортировка кучей */
function heapSort(nums) {
    // Построение кучи: выполнить heapify для всех узлов, кроме листовых
    for (let i = Math.floor(nums.length / 2) - 1; i >= 0; i--) {
        siftDown(nums, nums.length, i);
    }
    // Извлекать максимальный элемент из кучи в течение n-1 итераций
    for (let i = nums.length - 1; i > 0; i--) {
        // Поменять корневой узел с самым правым листом местами (поменять первый и последний элементы)
        [nums[0], nums[i]] = [nums[i], nums[0]];
        // Начиная с корневого узла, выполнить просеивание сверху вниз
        siftDown(nums, i, 0);
    }
}

/* Driver Code */
const nums = [4, 1, 3, 1, 5, 2];
heapSort(nums);
console.log('После сортировки кучей nums =', nums);
