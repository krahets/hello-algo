/**
 * File: binary_search_insertion.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_searching

/* Бинарный поиск точки вставки (без повторяющихся элементов) */
fun binarySearchInsertionSimple(nums: IntArray, target: Int): Int {
    var i = 0
    var j = nums.size - 1 // Инициализировать двусторонне замкнутый интервал [0, n-1]
    while (i <= j) {
        val m = i + (j - i) / 2 // Вычислить индекс середины m
        if (nums[m] < target) {
            i = m + 1 // target находится в интервале [m+1, j]
        } else if (nums[m] > target) {
            j = m - 1 // target находится в интервале [i, m-1]
        } else {
            return m // Найти target и вернуть точку вставки m
        }
    }
    // target не найден, вернуть точку вставки i
    return i
}

/* Бинарный поиск точки вставки (с повторяющимися элементами) */
fun binarySearchInsertion(nums: IntArray, target: Int): Int {
    var i = 0
    var j = nums.size - 1 // Инициализировать двусторонне замкнутый интервал [0, n-1]
    while (i <= j) {
        val m = i + (j - i) / 2 // Вычислить индекс середины m
        if (nums[m] < target) {
            i = m + 1 // target находится в интервале [m+1, j]
        } else if (nums[m] > target) {
            j = m - 1 // target находится в интервале [i, m-1]
        } else {
            j = m - 1 // Первый элемент меньше target находится в интервале [i, m-1]
        }
    }
    // Вернуть точку вставки i
    return i
}

/* Driver Code */
fun main() {
    // Массив без повторяющихся элементов
    var nums = intArrayOf(1, 3, 6, 8, 12, 15, 23, 26, 31, 35)
    println("\nМассив nums = ${nums.contentToString()}")
    // Бинарный поиск точки вставки
    for (target in intArrayOf(6, 9)) {
        val index = binarySearchInsertionSimple(nums, target)
        println("Индекс позиции вставки элемента $target равен $index")
    }

    // Массив с повторяющимися элементами
    nums = intArrayOf(1, 3, 6, 6, 6, 6, 6, 10, 12, 15)
    println("\nМассив nums = ${nums.contentToString()}")

    // Бинарный поиск точки вставки
    for (target in intArrayOf(2, 6, 20)) {
        val index = binarySearchInsertion(nums, target)
        println("Индекс позиции вставки элемента $target равен $index")
    }
}