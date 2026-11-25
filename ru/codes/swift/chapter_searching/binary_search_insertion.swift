/**
 * File: binary_search_insertion.swift
 * Created Time: 2023-08-06
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Двоичный поиск позиции вставки без повторов */
func binarySearchInsertionSimple(nums: [Int], target: Int) -> Int {
    // Задаём замкнутый интервал [0, n-1]
    var i = nums.startIndex
    var j = nums.endIndex - 1
    while i <= j {
        let m = i + (j - i) / 2 // Вычисляем индекс середины m
        if nums[m] < target {
            i = m + 1 // Ищем target в интервале [m+1, j]
        } else if nums[m] > target {
            j = m - 1 // Ищем target в интервале [i, m-1]
        } else {
            return m // Значение target найдено, возвращаем позицию вставки m
        }
    }
    // Значение target не найдено, возвращаем позицию вставки i
    return i
}

/* Двоичный поиск позиции вставки при наличии повторов */
public func binarySearchInsertion(nums: [Int], target: Int) -> Int {
    // Задаём замкнутый интервал [0, n-1]
    var i = nums.startIndex
    var j = nums.endIndex - 1
    while i <= j {
        let m = i + (j - i) / 2 // Вычисляем индекс середины m
        if nums[m] < target {
            i = m + 1 // Ищем target в интервале [m+1, j]
        } else if nums[m] > target {
            j = m - 1 // Ищем target в интервале [i, m-1]
        } else {
            j = m - 1 // В интервале [i, m-1] ищем последний элемент, меньший target
        }
    }
    // Возвращаем позицию вставки i
    return i
}

#if !TARGET

@main
enum BinarySearchInsertion {
    /* Пример использования */
    static func main() {
        // Массив без повторяющихся элементов
        var nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35]
        print("\nМассив nums = \(nums)")
        // Двоичный поиск позиции вставки
        for target in [6, 9] {
            let index = binarySearchInsertionSimple(nums: nums, target: target)
            print("Позиция вставки элемента \(target) = \(index)")
        }

        // Массив с повторяющимися элементами
        nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15]
        print("\nМассив nums = \(nums)")
        // Двоичный поиск позиции вставки
        for target in [2, 6, 20] {
            let index = binarySearchInsertion(nums: nums, target: target)
            print("Позиция вставки элемента \(target) = \(index)")
        }
    }
}

#endif
