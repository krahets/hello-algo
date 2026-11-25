/**
 * File: binary_search.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_searching

/* Двоичный поиск на замкнутом интервале */
fun binarySearch(nums: IntArray, target: Int): Int {
    // Задаём замкнутый интервал [0, n-1]: i указывает на первый элемент, j — на последний
    var i = 0
    var j = nums.size - 1
    // Повторяем, пока интервал поиска не опустеет (i > j)
    while (i <= j) {
        val m = i + (j - i) / 2 // Вычисляем индекс середины m
        if (nums[m] < target) // Искать target следует в интервале [m+1, j]
            i = m + 1
        else if (nums[m] > target) // Искать target следует в интервале [i, m-1]
            j = m - 1
        else  // Элемент найден, возвращаем его индекс
            return m
    }
    // Элемент не найден, возвращаем -1
    return -1
}

/* Двоичный поиск на полуинтервале с открытой правой границей */
fun binarySearchLCRO(nums: IntArray, target: Int): Int {
    // Задаём полуинтервал [0, n): i указывает на первый элемент, j — на позицию за последним
    var i = 0
    var j = nums.size
    // Повторяем, пока интервал поиска не опустеет (i = j)
    while (i < j) {
        val m = i + (j - i) / 2 // Вычисляем индекс середины m
        if (nums[m] < target) // Искать target следует в интервале [m+1, j)
            i = m + 1
        else if (nums[m] > target) // Искать target следует в интервале [i, m)
            j = m
        else  // Элемент найден, возвращаем его индекс
            return m
    }
    // Элемент не найден, возвращаем -1
    return -1
}

/* Пример использования */
fun main() {
    val target = 6
    val nums = intArrayOf(1, 3, 6, 8, 12, 15, 23, 26, 31, 35)

    /* Двоичный поиск на замкнутом интервале */
    var index = binarySearch(nums, target)
    println("Индекс элемента 6 = $index")

    /* Двоичный поиск на полуинтервале с открытой правой границей */
    index = binarySearchLCRO(nums, target)
    println("Индекс элемента 6 = $index")
}