/**
 * File: quick_sort.swift
 * Created Time: 2023-01-29
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Класс быстрой сортировки */
/* Разбиение методом двух указателей */
func partition(nums: inout [Int], left: Int, right: Int) -> Int {
    // Взять nums[left] в качестве опорного элемента
    var i = left
    var j = right
    while i < j {
        while i < j, nums[j] >= nums[left] {
            j -= 1 // Искать справа налево первый элемент, меньший опорного
        }
        while i < j, nums[i] <= nums[left] {
            i += 1 // Искать слева направо первый элемент, больший опорного
        }
        nums.swapAt(i, j) // Поменять эти два элемента местами
    }
    nums.swapAt(i, left) // Переместить опорный элемент на границу двух подмассивов
    return i // Вернуть индекс опорного элемента
}

/* Быстрая сортировка */
func quickSort(nums: inout [Int], left: Int, right: Int) {
    // Завершить рекурсию, когда длина подмассива равна 1
    if left >= right {
        return
    }
    // Разбиение методом двух указателей
    let pivot = partition(nums: &nums, left: left, right: right)
    // Рекурсивно обработать левый и правый подмассивы
    quickSort(nums: &nums, left: left, right: pivot - 1)
    quickSort(nums: &nums, left: pivot + 1, right: right)
}

/* Класс быстрой сортировки (оптимизация медианным опорным элементом) */
/* Выбрать медиану из трех кандидатов */
func medianThree(nums: [Int], left: Int, mid: Int, right: Int) -> Int {
    let l = nums[left]
    let m = nums[mid]
    let r = nums[right]
    if (l <= m && m <= r) || (r <= m && m <= l) {
        return mid // m находится между l и r
    }
    if (m <= l && l <= r) || (r <= l && l <= m) {
        return left // l находится между m и r
    }
    return right
}

/* Разбиение методом двух указателей (медиана трех) */
func partitionMedian(nums: inout [Int], left: Int, right: Int) -> Int {
    // Выбрать медиану из трех кандидатов
    let med = medianThree(nums: nums, left: left, mid: left + (right - left) / 2, right: right)
    // Переместить медиану в самый левый конец массива
    nums.swapAt(left, med)
    return partition(nums: &nums, left: left, right: right)
}

/* Быстрая сортировка (оптимизация с медианным опорным элементом) */
func quickSortMedian(nums: inout [Int], left: Int, right: Int) {
    // Завершить рекурсию, когда длина подмассива равна 1
    if left >= right {
        return
    }
    // Разбиение методом двух указателей
    let pivot = partitionMedian(nums: &nums, left: left, right: right)
    // Рекурсивно обработать левый и правый подмассивы
    quickSortMedian(nums: &nums, left: left, right: pivot - 1)
    quickSortMedian(nums: &nums, left: pivot + 1, right: right)
}

/* Быстрая сортировка (оптимизация глубины рекурсии) */
func quickSortTailCall(nums: inout [Int], left: Int, right: Int) {
    var left = left
    var right = right
    // Завершить, когда длина подмассива равна 1
    while left < right {
        // Операция разбиения методом двух указателей
        let pivot = partition(nums: &nums, left: left, right: right)
        // Выполнить быструю сортировку для более короткого из двух подмассивов
        if (pivot - left) < (right - pivot) {
            quickSortTailCall(nums: &nums, left: left, right: pivot - 1) // Рекурсивно отсортировать левый подмассив
            left = pivot + 1 // Оставшийся неотсортированный диапазон равен [pivot + 1, right]
        } else {
            quickSortTailCall(nums: &nums, left: pivot + 1, right: right) // Рекурсивно отсортировать правый подмассив
            right = pivot - 1 // Оставшийся неотсортированный диапазон равен [left, pivot - 1]
        }
    }
}

@main
enum QuickSort {
    /* Driver Code */
    static func main() {
        /* Быстрая сортировка */
        var nums = [2, 4, 1, 0, 3, 5]
        quickSort(nums: &nums, left: nums.startIndex, right: nums.endIndex - 1)
        print("После быстрой сортировки nums = \(nums)")

        /* Быстрая сортировка (оптимизация с медианным опорным элементом) */
        var nums1 = [2, 4, 1, 0, 3, 5]
        quickSortMedian(nums: &nums1, left: nums1.startIndex, right: nums1.endIndex - 1)
        print("Быстрая сортировка (оптимизация с медианным опорным элементом)после завершения nums1 = \(nums1)")

        /* Быстрая сортировка (оптимизация глубины рекурсии) */
        var nums2 = [2, 4, 1, 0, 3, 5]
        quickSortTailCall(nums: &nums2, left: nums2.startIndex, right: nums2.endIndex - 1)
        print("Быстрая сортировка (оптимизация глубины рекурсии)после завершения nums2 = \(nums2)")
    }
}
