/**
 * File: bubble_sort.swift
 * Created Time: 2023-01-29
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Пузырьковая сортировка */
func bubbleSort(nums: inout [Int]) {
    // Внешний цикл: неотсортированный диапазон [0, i]
    for i in nums.indices.dropFirst().reversed() {
        // Внутренний цикл: переместить максимальный элемент неотсортированного диапазона [0, i] в его правый конец
        for j in 0 ..< i {
            if nums[j] > nums[j + 1] {
                // Поменять местами nums[j] и nums[j + 1]
                nums.swapAt(j, j + 1)
            }
        }
    }
}

/* Пузырьковая сортировка (оптимизация флагом) */
func bubbleSortWithFlag(nums: inout [Int]) {
    // Внешний цикл: неотсортированный диапазон [0, i]
    for i in nums.indices.dropFirst().reversed() {
        var flag = false // Инициализировать флаг
        for j in 0 ..< i {
            if nums[j] > nums[j + 1] {
                // Поменять местами nums[j] и nums[j + 1]
                nums.swapAt(j, j + 1)
                flag = true // Записать обмен элементов
            }
        }
        if !flag { // На этой итерации «всплытия» не было ни одного обмена, сразу выйти
            break
        }
    }
}

@main
enum BubbleSort {
    /* Driver Code */
    static func main() {
        var nums = [4, 1, 3, 1, 5, 2]
        bubbleSort(nums: &nums)
        print("После пузырьковой сортировки nums = \(nums)")

        var nums1 = [4, 1, 3, 1, 5, 2]
        bubbleSortWithFlag(nums: &nums1)
        print("После пузырьковой сортировки nums1 = \(nums1)")
    }
}
