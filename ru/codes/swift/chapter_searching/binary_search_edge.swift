/**
 * File: binary_search_edge.swift
 * Created Time: 2023-08-06
 * Author: nuomi1 (nuomi1@qq.com)
 */

import binary_search_insertion_target

/* Двоичный поиск первого вхождения target */
func binarySearchLeftEdge(nums: [Int], target: Int) -> Int {
    // Задача равносильна поиску позиции вставки target
    let i = binarySearchInsertion(nums: nums, target: target)
    // Значение target не найдено, возвращаем -1
    if i == nums.endIndex || nums[i] != target {
        return -1
    }
    // Значение target найдено, возвращаем индекс i
    return i
}

/* Двоичный поиск последнего вхождения target */
func binarySearchRightEdge(nums: [Int], target: Int) -> Int {
    // Сводим задачу к поиску первого вхождения target + 1
    let i = binarySearchInsertion(nums: nums, target: target + 1)
    // j указывает на последнее вхождение target, а i — на первый элемент, больший target
    let j = i - 1
    // Значение target не найдено, возвращаем -1
    if j == -1 || nums[j] != target {
        return -1
    }
    // Значение target найдено, возвращаем индекс j
    return j
}

@main
enum BinarySearchEdge {
    /* Пример использования */
    static func main() {
        // Массив с повторяющимися элементами
        let nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15]
        print("\nМассив nums = \(nums)")

        // Двоичный поиск левой и правой границ
        for target in [6, 7] {
            var index = binarySearchLeftEdge(nums: nums, target: target)
            print("Индекс первого вхождения \(target) = \(index)")
            index = binarySearchRightEdge(nums: nums, target: target)
            print("Индекс последнего вхождения \(target) = \(index)")
        }
    }
}
