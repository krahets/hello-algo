/**
 * File: quick_sort.swift
 * Created Time: 2023-01-29
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Класс быстрой сортировки */
/* Разбиение двумя указателями */
func partition(nums: inout [Int], left: Int, right: Int) -> Int {
    // Выбрать nums[left] опорным элементом
    var i = left
    var j = right
    while i < j {
        while i < j, nums[j] >= nums[left] {
            j -= 1 // Справа налево найти первый элемент меньше опорного
        }
        while i < j, nums[i] <= nums[left] {
            i += 1 // Слева направо найти первый элемент больше опорного
        }
        nums.swapAt(i, j) // Поменять эти элементы местами
    }
    nums.swapAt(i, left) // Обменом поместить опорный элемент на границу подмассивов
    return i // Вернуть индекс опорного элемента
}

/* Быстрая сортировка */
func quickSort(nums: inout [Int], left: Int, right: Int) {
    // Завершить рекурсию при длине подмассива 1
    if left >= right {
        return
    }
    // Разбиение двумя указателями
    let pivot = partition(nums: &nums, left: left, right: right)
    // Рекурсивно отсортировать левый и правый подмассивы
    quickSort(nums: &nums, left: left, right: pivot - 1)
    quickSort(nums: &nums, left: pivot + 1, right: right)
}

/* Класс быстрой сортировки с выбором медианы */
/* Выбрать медиану трёх кандидатов */
func medianThree(nums: [Int], left: Int, mid: Int, right: Int) -> Int {
    let l = nums[left]
    let m = nums[mid]
    let r = nums[right]
    if (l <= m && m <= r) || (r <= m && m <= l) {
        return mid // m лежит между l и r
    }
    if (m <= l && l <= r) || (r <= l && l <= m) {
        return left // l лежит между m и r
    }
    return right
}

/* Разбиение двумя указателями с выбором медианы трёх */
func partitionMedian(nums: inout [Int], left: Int, right: Int) -> Int {
    // Выбрать медиану трёх кандидатов
    let med = medianThree(nums: nums, left: left, mid: left + (right - left) / 2, right: right)
    // Обменом поместить медиану в начало массива
    nums.swapAt(left, med)
    return partition(nums: &nums, left: left, right: right)
}

/* Быстрая сортировка с выбором медианы в качестве опорного элемента */
func quickSortMedian(nums: inout [Int], left: Int, right: Int) {
    // Завершить рекурсию при длине подмассива 1
    if left >= right {
        return
    }
    // Разбиение двумя указателями
    let pivot = partitionMedian(nums: &nums, left: left, right: right)
    // Рекурсивно отсортировать левый и правый подмассивы
    quickSortMedian(nums: &nums, left: left, right: pivot - 1)
    quickSortMedian(nums: &nums, left: pivot + 1, right: right)
}

/* Быстрая сортировка с уменьшенной глубиной рекурсии */
func quickSortTailCall(nums: inout [Int], left: Int, right: Int) {
    var left = left
    var right = right
    // Завершить обработку при длине подмассива 1
    while left < right {
        // Выполнить разбиение двумя указателями
        let pivot = partition(nums: &nums, left: left, right: right)
        // Применить быструю сортировку к более короткому подмассиву
        if (pivot - left) < (right - pivot) {
            quickSortTailCall(nums: &nums, left: left, right: pivot - 1) // Рекурсивно отсортировать левый подмассив
            left = pivot + 1 // Оставшийся неотсортированный участок: [pivot + 1, right]
        } else {
            quickSortTailCall(nums: &nums, left: pivot + 1, right: right) // Рекурсивно отсортировать правый подмассив
            right = pivot - 1 // Оставшийся неотсортированный участок: [left, pivot - 1]
        }
    }
}

@main
enum QuickSort {
    /* Тестовый пример */
    static func main() {
        /* Быстрая сортировка */
        var nums = [2, 4, 1, 0, 3, 5]
        quickSort(nums: &nums, left: nums.startIndex, right: nums.endIndex - 1)
        print("После быстрой сортировки nums = \(nums)")

        /* Быстрая сортировка с выбором медианы в качестве опорного элемента */
        var nums1 = [2, 4, 1, 0, 3, 5]
        quickSortMedian(nums: &nums1, left: nums1.startIndex, right: nums1.endIndex - 1)
        print("После быстрой сортировки с выбором медианы nums1 = \(nums1)")

        /* Быстрая сортировка с уменьшенной глубиной рекурсии */
        var nums2 = [2, 4, 1, 0, 3, 5]
        quickSortTailCall(nums: &nums2, left: nums2.startIndex, right: nums2.endIndex - 1)
        print("После быстрой сортировки с уменьшенной глубиной рекурсии nums2 = \(nums2)")
    }
}
