/**
 * File: merge_sort.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_sorting

/* Объединить левый и правый подмассивы */
fun merge(nums: IntArray, left: Int, mid: Int, right: Int) {
    // Диапазон левого подмассива: [left, mid], диапазон правого подмассива: [mid+1, right]
    // Создать временный массив tmp для хранения результата слияния
    val tmp = IntArray(right - left + 1)
    // Инициализировать начальные индексы левого и правого подмассивов
    var i = left
    var j = mid + 1
    var k = 0
    // Пока в левом и правом подмассивах еще есть элементы, сравнивать их и копировать меньший во временный массив
    while (i <= mid && j <= right) {
        if (nums[i] <= nums[j])
            tmp[k++] = nums[i++]
        else
            tmp[k++] = nums[j++]
    }
    // Скопировать оставшиеся элементы левого и правого подмассивов во временный массив
    while (i <= mid) {
        tmp[k++] = nums[i++]
    }
    while (j <= right) {
        tmp[k++] = nums[j++]
    }
    // Скопировать элементы временного массива tmp обратно в соответствующий диапазон исходного массива nums
    for (l in tmp.indices) {
        nums[left + l] = tmp[l]
    }
}

/* Сортировка слиянием */
fun mergeSort(nums: IntArray, left: Int, right: Int) {
    // Условие завершения
    if (left >= right) return  // Завершить рекурсию, когда длина подмассива равна 1
    // Этап разбиения
    val mid = left + (right - left) / 2 // Вычислить середину
    mergeSort(nums, left, mid) // Рекурсивно обработать левый подмассив
    mergeSort(nums, mid + 1, right) // Рекурсивно обработать правый подмассив
    // Этап слияния
    merge(nums, left, mid, right)
}

/* Driver Code */
fun main() {
    /* Сортировка слиянием */
    val nums = intArrayOf(7, 3, 2, 6, 0, 1, 5, 4)
    mergeSort(nums, 0, nums.size - 1)
    println("После сортировки слиянием nums = ${nums.contentToString()}")
}
