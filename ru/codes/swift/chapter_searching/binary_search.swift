/**
 * File: binary_search.swift
 * Created Time: 2023-01-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Бинарный поиск (двусторонний закрытый интервал) */
func binarySearch(nums: [Int], target: Int) -> Int {
    // Инициализировать закрытый интервал [0, n-1], где i и j указывают на первый и последний элементы массива
    var i = nums.startIndex
    var j = nums.endIndex - 1
    // Выполнять цикл и выйти, когда диапазон поиска станет пустым (при i > j он пуст)
    while i <= j {
        let m = i + (j - i) / 2 // Вычислить средний индекс m
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

/* Бинарный поиск (левый закрытый, правый открытый интервал) */
func binarySearchLCRO(nums: [Int], target: Int) -> Int {
    // Инициализировать интервал [0, n), где i и j указывают на первый элемент массива и позицию за последним элементом
    var i = nums.startIndex
    var j = nums.endIndex
    // Выполнять цикл и выйти, когда диапазон поиска станет пустым (при i = j он пуст)
    while i < j {
        let m = i + (j - i) / 2 // Вычислить средний индекс m
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

        /* Бинарный поиск (двусторонний закрытый интервал) */
        var index = binarySearch(nums: nums, target: target)
        print("Индекс целевого элемента 6 = \(index)")

        /* Бинарный поиск (левый закрытый, правый открытый интервал) */
        index = binarySearchLCRO(nums: nums, target: target)
        print("Индекс целевого элемента 6 = \(index)")
    }
}
