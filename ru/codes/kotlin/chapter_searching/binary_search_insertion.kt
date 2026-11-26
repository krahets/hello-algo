/**
 * File: binary_search_insertion.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_searching

/* Двоичный поиск позиции вставки без повторов */
fun binarySearchInsertionSimple(nums: IntArray, target: Int): Int {
    var i = 0
    var j = nums.size - 1 // Задаём замкнутый интервал [0, n-1]
    while (i <= j) {
        val m = i + (j - i) / 2 // Вычисляем индекс середины m
        if (nums[m] < target) {
            i = m + 1 // Ищем target в интервале [m+1, j]
        } else if (nums[m] > target) {
            j = m - 1 // Ищем target в интервале [i, m-1]
        } else {
            return m // Значение target найдено, возвращаем позицию вставки m
        }
    }
    // Значение target не найдено, возвращаем позицию вставки i
    return i
}

/* Двоичный поиск позиции вставки при наличии повторов */
fun binarySearchInsertion(nums: IntArray, target: Int): Int {
    var i = 0
    var j = nums.size - 1 // Задаём замкнутый интервал [0, n-1]
    while (i <= j) {
        val m = i + (j - i) / 2 // Вычисляем индекс середины m
        if (nums[m] < target) {
            i = m + 1 // Ищем target в интервале [m+1, j]
        } else if (nums[m] > target) {
            j = m - 1 // Ищем target в интервале [i, m-1]
        } else {
            j = m - 1 // В интервале [i, m-1] ищем последний элемент, меньший target
        }
    }
    // Возвращаем позицию вставки i
    return i
}

/* Пример использования */
fun main() {
    // Массив без повторяющихся элементов
    var nums = intArrayOf(1, 3, 6, 8, 12, 15, 23, 26, 31, 35)
    println("\nМассив nums = ${nums.contentToString()}")
    // Двоичный поиск позиции вставки
    for (target in intArrayOf(6, 9)) {
        val index = binarySearchInsertionSimple(nums, target)
        println("Позиция вставки элемента $target = $index")
    }

    // Массив с повторяющимися элементами
    nums = intArrayOf(1, 3, 6, 6, 6, 6, 6, 10, 12, 15)
    println("\nМассив nums = ${nums.contentToString()}")

    // Двоичный поиск позиции вставки
    for (target in intArrayOf(2, 6, 20)) {
        val index = binarySearchInsertion(nums, target)
        println("Позиция вставки элемента $target = $index")
    }
}
