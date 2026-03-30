/**
 * File: merge_sort.swift
 * Created Time: 2023-01-29
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Объединить левый и правый подмассивы */
func merge(nums: inout [Int], left: Int, mid: Int, right: Int) {
    // Диапазон левого подмассива: [left, mid], диапазон правого подмассива: [mid+1, right]
    // Создать временный массив tmp для хранения результата слияния
    var tmp = Array(repeating: 0, count: right - left + 1)
    // Инициализировать начальные индексы левого и правого подмассивов
    var i = left, j = mid + 1, k = 0
    // Пока в левом и правом подмассивах еще есть элементы, сравнивать их и копировать меньший во временный массив
    while i <= mid, j <= right {
        if nums[i] <= nums[j] {
            tmp[k] = nums[i]
            i += 1
        } else {
            tmp[k] = nums[j]
            j += 1
        }
        k += 1
    }
    // Скопировать оставшиеся элементы левого и правого подмассивов во временный массив
    while i <= mid {
        tmp[k] = nums[i]
        i += 1
        k += 1
    }
    while j <= right {
        tmp[k] = nums[j]
        j += 1
        k += 1
    }
    // Скопировать элементы временного массива tmp обратно в соответствующий диапазон исходного массива nums
    for k in tmp.indices {
        nums[left + k] = tmp[k]
    }
}

/* Сортировка слиянием */
func mergeSort(nums: inout [Int], left: Int, right: Int) {
    // Условие завершения
    if left >= right { // Завершить рекурсию, когда длина подмассива равна 1
        return
    }
    // Этап разбиения
    let mid = left + (right - left) / 2 // Вычислить середину
    mergeSort(nums: &nums, left: left, right: mid) // Рекурсивно обработать левый подмассив
    mergeSort(nums: &nums, left: mid + 1, right: right) // Рекурсивно обработать правый подмассив
    // Этап слияния
    merge(nums: &nums, left: left, mid: mid, right: right)
}

@main
enum MergeSort {
    /* Driver Code */
    static func main() {
        /* Сортировка слиянием */
        var nums = [7, 3, 2, 6, 0, 1, 5, 4]
        mergeSort(nums: &nums, left: nums.startIndex, right: nums.endIndex - 1)
        print("После сортировки слиянием nums = \(nums)")
    }
}
