/**
 * File: binary_search.swift
 * Created Time: 2023-01-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Двоичный поиск на замкнутом интервале */
func binarySearch(nums: [Int], target: Int) -> Int {
    // Задаём замкнутый интервал [0, n-1]: i указывает на первый элемент, j — на последний
    var i = nums.startIndex
    var j = nums.endIndex - 1
    // Повторяем, пока интервал поиска не опустеет (i > j)
    while i <= j {
        let m = i + (j - i) / 2 // Вычисляем индекс середины m
        if nums[m] < target { // Искать target следует в интервале [m+1, j]
            i = m + 1
        } else if nums[m] > target { // Искать target следует в интервале [i, m-1]
            j = m - 1
        } else { // Элемент найден, возвращаем его индекс
            return m
        }
    }
    // Элемент не найден, возвращаем -1
    return -1
}

/* Двоичный поиск на полуинтервале с открытой правой границей */
func binarySearchLCRO(nums: [Int], target: Int) -> Int {
    // Задаём полуинтервал [0, n): i указывает на первый элемент, j — на позицию за последним
    var i = nums.startIndex
    var j = nums.endIndex
    // Повторяем, пока интервал поиска не опустеет (i = j)
    while i < j {
        let m = i + (j - i) / 2 // Вычисляем индекс середины m
        if nums[m] < target { // Искать target следует в интервале [m+1, j)
            i = m + 1
        } else if nums[m] > target { // Искать target следует в интервале [i, m)
            j = m
        } else { // Элемент найден, возвращаем его индекс
            return m
        }
    }
    // Элемент не найден, возвращаем -1
    return -1
}

@main
enum BinarySearch {
    /* Пример использования */
    static func main() {
        let target = 6
        let nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35]

        /* Двоичный поиск на замкнутом интервале */
        var index = binarySearch(nums: nums, target: target)
        print("Индекс элемента 6 = \(index)")

        /* Двоичный поиск на полуинтервале с открытой правой границей */
        index = binarySearchLCRO(nums: nums, target: target)
        print("Индекс элемента 6 = \(index)")
    }
}
