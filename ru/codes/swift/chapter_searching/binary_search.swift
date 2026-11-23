/**
 * File: binary_search.swift
 * Created Time: 2023-01-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Двоичный поиск (замкнутый интервал) */
func binarySearch(nums: [Int], target: Int) -> Int {
    // Инициализировать замкнутый интервал [0, n-1], то есть i и j указывают на первый и последний элементы массива соответственно
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

/* Двоичный поиск (интервал, замкнутый слева и открытый справа) */
func binarySearchLCRO(nums: [Int], target: Int) -> Int {
    // Инициализация интервала [0, n), замкнутого слева и открытого справа: i указывает на первый элемент массива, а j — на позицию сразу за последним
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

        /* Двоичный поиск (замкнутый интервал) */
        var index = binarySearch(nums: nums, target: target)
        print("Индекс целевого элемента 6 = \(index)")

        /* Двоичный поиск (интервал, замкнутый слева и открытый справа) */
        index = binarySearchLCRO(nums: nums, target: target)
        print("Индекс целевого элемента 6 = \(index)")
    }
}
