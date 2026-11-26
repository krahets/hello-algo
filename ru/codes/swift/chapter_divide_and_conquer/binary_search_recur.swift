/**
 * File: binary_search_recur.swift
 * Created Time: 2023-09-02
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Двоичный поиск: задача f(i, j) */
func dfs(nums: [Int], target: Int, i: Int, j: Int) -> Int {
    // Если интервал пуст, искомого элемента нет. Возвращаем -1
    if i > j {
        return -1
    }
    // Вычисляем индекс середины m
    let m = (i + j) / 2
    if nums[m] < target {
        // Рекурсивно решаем подзадачу f(m+1, j)
        return dfs(nums: nums, target: target, i: m + 1, j: j)
    } else if nums[m] > target {
        // Рекурсивно решаем подзадачу f(i, m-1)
        return dfs(nums: nums, target: target, i: i, j: m - 1)
    } else {
        // Искомый элемент найден. Возвращаем его индекс
        return m
    }
}

/* Двоичный поиск */
func binarySearch(nums: [Int], target: Int) -> Int {
    // Решаем задачу f(0, n-1)
    dfs(nums: nums, target: target, i: nums.startIndex, j: nums.endIndex - 1)
}

@main
enum BinarySearchRecur {
    /* Основная программа */
    static func main() {
        let target = 6
        let nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35]

        // Двоичный поиск (замкнутый интервал)
        let index = binarySearch(nums: nums, target: target)
        print("Индекс элемента 6 = \(index)")
    }
}
