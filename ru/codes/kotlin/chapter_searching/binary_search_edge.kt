/**
 * File: binary_search_edge.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_searching

/* Двоичный поиск первого вхождения target */
fun binarySearchLeftEdge(nums: IntArray, target: Int): Int {
    // Задача равносильна поиску позиции вставки target
    val i = binarySearchInsertion(nums, target)
    // Значение target не найдено, возвращаем -1
    if (i == nums.size || nums[i] != target) {
        return -1
    }
    // Значение target найдено, возвращаем индекс i
    return i
}

/* Двоичный поиск последнего вхождения target */
fun binarySearchRightEdge(nums: IntArray, target: Int): Int {
    // Сводим задачу к поиску первого вхождения target + 1
    val i = binarySearchInsertion(nums, target + 1)
    // j указывает на последнее вхождение target, а i — на первый элемент, больший target
    val j = i - 1
    // Значение target не найдено, возвращаем -1
    if (j == -1 || nums[j] != target) {
        return -1
    }
    // Значение target найдено, возвращаем индекс j
    return j
}

/* Пример использования */
fun main() {
    // Массив с повторяющимися элементами
    val nums = intArrayOf(1, 3, 6, 6, 6, 6, 6, 10, 12, 15)
    println("\nМассив nums = ${nums.contentToString()}")

    // Двоичный поиск левой и правой границ
    for (target in intArrayOf(6, 7)) {
        var index = binarySearchLeftEdge(nums, target)
        println("Индекс первого вхождения $target = $index")
        index = binarySearchRightEdge(nums, target)
        println("Индекс последнего вхождения $target = $index")
    }
}