/**
 * File: selection_sort.swift
 * Created Time: 2023-05-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Сортировка выбором */
func selectionSort(nums: inout [Int]) {
    // Внешний цикл: неотсортированный участок [i, n-1]
    for i in nums.indices.dropLast() {
        // Внутренний цикл: найти минимум неотсортированного участка
        var k = i
        for j in nums.indices.dropFirst(i + 1) {
            if nums[j] < nums[k] {
                k = j // Запомнить индекс минимума
            }
        }
        // Поменять минимум местами с первым элементом неотсортированного участка
        nums.swapAt(i, k)
    }
}

@main
enum SelectionSort {
    /* Тестовый пример */
    static func main() {
        var nums = [4, 1, 3, 1, 5, 2]
        selectionSort(nums: &nums)
        print("После сортировки выбором nums = \(nums)")
    }
}
