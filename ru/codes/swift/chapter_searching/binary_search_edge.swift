/**
 * File: binary_search_edge.swift
 * Created Time: 2023-08-06
 * Author: nuomi1 (nuomi1@qq.com)
 */

import binary_search_insertion_target

/* Бинарный поиск самого левого target */
func binarySearchLeftEdge(nums: [Int], target: Int) -> Int {
    // Эквивалентно поиску точки вставки target
    let i = binarySearchInsertion(nums: nums, target: target)
    // target не найден, вернуть -1
    if i == nums.endIndex || nums[i] != target {
        return -1
    }
    // Найти target и вернуть индекс i
    return i
}

/* Бинарный поиск самого правого target */
func binarySearchRightEdge(nums: [Int], target: Int) -> Int {
    // Преобразовать задачу в поиск самого левого target + 1
    let i = binarySearchInsertion(nums: nums, target: target + 1)
    // j указывает на самый правый target, а i — на первый элемент больше target
    let j = i - 1
    // target не найден, вернуть -1
    if j == -1 || nums[j] != target {
        return -1
    }
    // Найти target и вернуть индекс j
    return j
}

@main
enum BinarySearchEdge {
    /* Driver Code */
    static func main() {
        // Массив с повторяющимися элементами
        let nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15]
        print("\nМассив nums = \(nums)")

        // Бинарный поиск левой и правой границы
        for target in [6, 7] {
            var index = binarySearchLeftEdge(nums: nums, target: target)
            print("Индекс самого левого элемента \(target) равен \(index)")
            index = binarySearchRightEdge(nums: nums, target: target)
            print("Индекс самого правого элемента \(target) равен \(index)")
        }
    }
}
