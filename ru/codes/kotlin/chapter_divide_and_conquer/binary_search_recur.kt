/**
 * File: binary_search_recur.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_divide_and_conquer.binary_search_recur

/* Бинарный поиск: задача f(i, j) */
fun dfs(
    nums: IntArray,
    target: Int,
    i: Int,
    j: Int
): Int {
    // Если интервал пуст, целевой элемент отсутствует, вернуть -1
    if (i > j) {
        return -1
    }
    // Вычислить индекс середины m
    val m = (i + j) / 2
    return if (nums[m] < target) {
        // Рекурсивная подзадача f(m+1, j)
        dfs(nums, target, m + 1, j)
    } else if (nums[m] > target) {
        // Рекурсивная подзадача f(i, m-1)
        dfs(nums, target, i, m - 1)
    } else {
        // Целевой элемент найден, вернуть его индекс
        m
    }
}

/* Бинарный поиск */
fun binarySearch(nums: IntArray, target: Int): Int {
    val n = nums.size
    // Решить задачу f(0, n-1)
    return dfs(nums, target, 0, n - 1)
}

/* Driver Code */
fun main() {
    val target = 6
    val nums = intArrayOf(1, 3, 6, 8, 12, 15, 23, 26, 31, 35)

    // Бинарный поиск (двусторонне замкнутый интервал)
    val index = binarySearch(nums, target)
    println("Индекс целевого элемента 6 = $index")
}