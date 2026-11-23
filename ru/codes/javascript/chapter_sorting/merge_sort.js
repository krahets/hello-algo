/**
 * File: merge_sort.js
 * Created Time: 2022-12-01
 * Author: IsChristina (christinaxia77@foxmail.com)
 */

/* Объединить левый и правый подмассивы */
function merge(nums, left, mid, right) {
    // Диапазон левого подмассива: [left, mid], диапазон правого подмассива: [mid+1, right]
    // Создать временный массив tmp для хранения результата слияния
    const tmp = new Array(right - left + 1);
    // Инициализировать начальные индексы левого и правого подмассивов
    let i = left,
        j = mid + 1,
        k = 0;
    // Пока в левом и правом подмассивах еще есть элементы, сравнивать их и копировать меньший во временный массив
    while (i <= mid && j <= right) {
        if (nums[i] <= nums[j]) {
            tmp[k++] = nums[i++];
        } else {
            tmp[k++] = nums[j++];
        }
    }
    // Скопировать оставшиеся элементы левого и правого подмассивов во временный массив
    while (i <= mid) {
        tmp[k++] = nums[i++];
    }
    while (j <= right) {
        tmp[k++] = nums[j++];
    }
    // Скопировать элементы временного массива tmp обратно в соответствующий диапазон исходного массива nums
    for (k = 0; k < tmp.length; k++) {
        nums[left + k] = tmp[k];
    }
}

/* Сортировка слиянием */
function mergeSort(nums, left, right) {
    // Условие завершения
    if (left >= right) return; // Завершить рекурсию, когда длина подмассива равна 1
    // Этап разбиения
    let mid = Math.floor(left + (right - left) / 2); // Вычислить середину
    mergeSort(nums, left, mid); // Рекурсивно обработать левый подмассив
    mergeSort(nums, mid + 1, right); // Рекурсивно обработать правый подмассив
    // Этап слияния
    merge(nums, left, mid, right);
}

/* Driver Code */
const nums = [7, 3, 2, 6, 0, 1, 5, 4];
mergeSort(nums, 0, nums.length - 1);
console.log('После сортировки слиянием nums =', nums);
