/**
 * File: merge_sort.swift
 * Created Time: 2023-01-29
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Слить левый и правый подмассивы */
func merge(nums: inout [Int], left: Int, mid: Int, right: Int) {
    // Левый подмассив занимает [left, mid], правый — [mid+1, right]
    // Создать временный массив tmp для результата слияния
    var tmp = Array(repeating: 0, count: right - left + 1)
    // Установить индексы на начало левого и правого подмассивов
    var i = left, j = mid + 1, k = 0
    // Пока в обоих подмассивах есть элементы, сравнивать их и копировать меньший во временный массив
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
    // Скопировать оставшиеся элементы подмассивов во временный массив
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
    // Скопировать элементы tmp обратно на соответствующий участок nums
    for k in tmp.indices {
        nums[left + k] = tmp[k]
    }
}

/* Сортировка слиянием */
func mergeSort(nums: inout [Int], left: Int, right: Int) {
    // Условие остановки
    if left >= right { // Завершить рекурсию, когда длина подмассива равна 1
        return
    }
    // Разбиение
    let mid = left + (right - left) / 2 // Вычислить середину
    mergeSort(nums: &nums, left: left, right: mid) // Рекурсивно отсортировать левый подмассив
    mergeSort(nums: &nums, left: mid + 1, right: right) // Рекурсивно отсортировать правый подмассив
    // Слияние
    merge(nums: &nums, left: left, mid: mid, right: right)
}

@main
enum MergeSort {
    /* Тестовый пример */
    static func main() {
        /* Сортировка слиянием */
        var nums = [7, 3, 2, 6, 0, 1, 5, 4]
        mergeSort(nums: &nums, left: nums.startIndex, right: nums.endIndex - 1)
        print("После сортировки слиянием nums = \(nums)")
    }
}
