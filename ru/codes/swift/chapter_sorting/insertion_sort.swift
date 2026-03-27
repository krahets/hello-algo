/**
 * File: insertion_sort.swift
 * Created Time: 2023-01-29
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Сортировка вставками */
func insertionSort(nums: inout [Int]) {
    // Внешний цикл: отсортированный диапазон [0, i-1]
    for i in nums.indices.dropFirst() {
        let base = nums[i]
        var j = i - 1
        // Внутренний цикл: вставить base в правильную позицию отсортированного диапазона [0, i-1]
        while j >= 0, nums[j] > base {
            nums[j + 1] = nums[j] // Сдвинуть nums[j] на одну позицию вправо
            j -= 1
        }
        nums[j + 1] = base // Поместить base в правильную позицию
    }
}

@main
enum InsertionSort {
    /* Driver Code */
    static func main() {
        var nums = [4, 1, 3, 1, 5, 2]
        insertionSort(nums: &nums)
        print("После сортировки вставками nums = \(nums)")
    }
}
