/**
 * File: selection_sort.swift
 * Created Time: 2023-05-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Сортировка выбором */
func selectionSort(nums: inout [Int]) {
    // Внешний цикл: неотсортированный диапазон [i, n-1]
    for i in nums.indices.dropLast() {
        // Внутренний цикл: найти минимальный элемент в неотсортированном диапазоне
        var k = i
        for j in nums.indices.dropFirst(i + 1) {
            if nums[j] < nums[k] {
                k = j // Записать индекс минимального элемента
            }
        }
        // Поменять этот минимальный элемент местами с первым элементом неотсортированного диапазона
        nums.swapAt(i, k)
    }
}

@main
enum SelectionSort {
    /* Driver Code */
    static func main() {
        var nums = [4, 1, 3, 1, 5, 2]
        selectionSort(nums: &nums)
        print("После сортировки выбором nums = \(nums)")
    }
}
