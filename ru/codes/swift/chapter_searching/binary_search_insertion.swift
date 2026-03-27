/**
 * File: binary_search_insertion.swift
 * Created Time: 2023-08-06
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Бинарный поиск точки вставки (без повторяющихся элементов) */
func binarySearchInsertionSimple(nums: [Int], target: Int) -> Int {
    // Инициализировать двусторонне замкнутый интервал [0, n-1]
    var i = nums.startIndex
    var j = nums.endIndex - 1
    while i <= j {
        let m = i + (j - i) / 2 // Вычислить индекс середины m
        if nums[m] < target {
            i = m + 1 // target находится в интервале [m+1, j]
        } else if nums[m] > target {
            j = m - 1 // target находится в интервале [i, m-1]
        } else {
            return m // Найти target и вернуть точку вставки m
        }
    }
    // target не найден, вернуть точку вставки i
    return i
}

/* Бинарный поиск точки вставки (с повторяющимися элементами) */
public func binarySearchInsertion(nums: [Int], target: Int) -> Int {
    // Инициализировать двусторонне замкнутый интервал [0, n-1]
    var i = nums.startIndex
    var j = nums.endIndex - 1
    while i <= j {
        let m = i + (j - i) / 2 // Вычислить индекс середины m
        if nums[m] < target {
            i = m + 1 // target находится в интервале [m+1, j]
        } else if nums[m] > target {
            j = m - 1 // target находится в интервале [i, m-1]
        } else {
            j = m - 1 // Первый элемент меньше target находится в интервале [i, m-1]
        }
    }
    // Вернуть точку вставки i
    return i
}

#if !TARGET

@main
enum BinarySearchInsertion {
    /* Driver Code */
    static func main() {
        // Массив без повторяющихся элементов
        var nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35]
        print("\nМассив nums = \(nums)")
        // Бинарный поиск точки вставки
        for target in [6, 9] {
            let index = binarySearchInsertionSimple(nums: nums, target: target)
            print("Индекс позиции вставки элемента \(target) равен \(index)")
        }

        // Массив с повторяющимися элементами
        nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15]
        print("\nМассив nums = \(nums)")
        // Бинарный поиск точки вставки
        for target in [2, 6, 20] {
            let index = binarySearchInsertion(nums: nums, target: target)
            print("Индекс позиции вставки элемента \(target) равен \(index)")
        }
    }
}

#endif
