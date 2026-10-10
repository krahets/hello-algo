/**
 * File: binary_search_recur.swift
 * Created Time: 2023-09-02
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Бинарный поиск: задача f(i, j) */
func dfs(nums: [Int], target: Int, i: Int, j: Int) -> Int {
    // Если интервал пуст, целевой элемент отсутствует, вернуть -1
    if i > j {
        return -1
    }
    // Вычислить индекс середины m
    let m = (i + j) / 2
    if nums[m] < target {
        // Рекурсивная подзадача f(m+1, j)
        return dfs(nums: nums, target: target, i: m + 1, j: j)
    } else if nums[m] > target {
        // Рекурсивная подзадача f(i, m-1)
        return dfs(nums: nums, target: target, i: i, j: m - 1)
    } else {
        // Целевой элемент найден, вернуть его индекс
        return m
    }
}

/* Бинарный поиск */
func binarySearch(nums: [Int], target: Int) -> Int {
    // Решить задачу f(0, n-1)
    dfs(nums: nums, target: target, i: nums.startIndex, j: nums.endIndex - 1)
}

@main
enum BinarySearchRecur {
    /* Driver Code */
    static func main() {
        let target = 6
        let nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35]

        // Бинарный поиск (двусторонне замкнутый интервал)
        let index = binarySearch(nums: nums, target: target)
        print("Индекс целевого элемента 6 = \(index)")
    }
}
