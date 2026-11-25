/**
 * File: bubble_sort.swift
 * Created Time: 2023-01-29
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Сортировка пузырьком */
func bubbleSort(nums: inout [Int]) {
    // Внешний цикл: неотсортированный участок [0, i]
    for i in nums.indices.dropFirst().reversed() {
        // Внутренний цикл: обменами переместить максимум участка [0, i] на его правый конец
        for j in 0 ..< i {
            if nums[j] > nums[j + 1] {
                // Поменять местами nums[j] и nums[j + 1]
                nums.swapAt(j, j + 1)
            }
        }
    }
}

/* Сортировка пузырьком с флагом обмена*/
func bubbleSortWithFlag(nums: inout [Int]) {
    // Внешний цикл: неотсортированный участок [0, i]
    for i in nums.indices.dropFirst().reversed() {
        var flag = false // Инициализировать флаг
        for j in 0 ..< i {
            if nums[j] > nums[j + 1] {
                // Поменять местами nums[j] и nums[j + 1]
                nums.swapAt(j, j + 1)
                flag = true // Отметить, что произошёл обмен
            }
        }
        if !flag { // За этот проход обменов не было. Выйти из цикла
            break
        }
    }
}

@main
enum BubbleSort {
    /* Тестовый пример */
    static func main() {
        var nums = [4, 1, 3, 1, 5, 2]
        bubbleSort(nums: &nums)
        print("После сортировки пузырьком nums = \(nums)")

        var nums1 = [4, 1, 3, 1, 5, 2]
        bubbleSortWithFlag(nums: &nums1)
        print("После сортировки пузырьком nums1 = \(nums1)")
    }
}
