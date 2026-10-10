/**
 * File: binary_search.swift
 * Created Time: 2023-01-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Бинарный поиск (двусторонне замкнутый интервал) */
func binarySearch(nums: [Int], target: Int) -> Int {
    // Инициализировать двусторонне замкнутый интервал [0, n-1], то есть i и j указывают на первый и последний элементы массива соответственно
    var i = nums.startIndex
    var j = nums.endIndex - 1
    // Цикл завершается, когда диапазон поиска пуст (при i > j диапазон пуст)
    while i <= j {
        let m = i + (j - i) / 2 // Вычислить индекс середины m
        if nums[m] < target { // Это означает, что target находится в интервале [m+1, j]
            i = m + 1
        } else if nums[m] > target { // Это означает, что target находится в интервале [i, m-1]
            j = m - 1
        } else { // Целевой элемент найден, вернуть его индекс
            return m
        }
    }
    // Целевой элемент не найден, вернуть -1
    return -1
}

/* Бинарный поиск (лево замкнутый, право открытый интервал) */
func binarySearchLCRO(nums: [Int], target: Int) -> Int {
    // Инициализировать лево замкнутый, право открытый интервал [0, n), то есть i и j указывают на первый элемент массива и позицию сразу за последним элементом соответственно
    var i = nums.startIndex
    var j = nums.endIndex
    // Цикл завершается, когда диапазон поиска пуст (при i = j диапазон пуст)
    while i < j {
        let m = i + (j - i) / 2 // Вычислить индекс середины m
        if nums[m] < target { // Это означает, что target находится в интервале [m+1, j)
            i = m + 1
        } else if nums[m] > target { // Это означает, что target находится в интервале [i, m)
            j = m
        } else { // Целевой элемент найден, вернуть его индекс
            return m
        }
    }
    // Целевой элемент не найден, вернуть -1
    return -1
}

@main
enum BinarySearch {
    /* Driver Code */
    static func main() {
        let target = 6
        let nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35]

        /* Бинарный поиск (двусторонне замкнутый интервал) */
        var index = binarySearch(nums: nums, target: target)
        print("Индекс целевого элемента 6 = \(index)")

        /* Бинарный поиск (лево замкнутый, право открытый интервал) */
        index = binarySearchLCRO(nums: nums, target: target)
        print("Индекс целевого элемента 6 = \(index)")
    }
}
