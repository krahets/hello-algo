/**
 * File: binary_search_edge.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_searching

/* Бинарный поиск самого левого target */
fun binarySearchLeftEdge(nums: IntArray, target: Int): Int {
    // Эквивалентно поиску точки вставки target
    val i = binarySearchInsertion(nums, target)
    // target не найден, вернуть -1
    if (i == nums.size || nums[i] != target) {
        return -1
    }
    // Найти target и вернуть индекс i
    return i
}

/* Бинарный поиск самого правого target */
fun binarySearchRightEdge(nums: IntArray, target: Int): Int {
    // Преобразовать задачу в поиск самого левого target + 1
    val i = binarySearchInsertion(nums, target + 1)
    // j указывает на самый правый target, а i — на первый элемент больше target
    val j = i - 1
    // target не найден, вернуть -1
    if (j == -1 || nums[j] != target) {
        return -1
    }
    // Найти target и вернуть индекс j
    return j
}

/* Driver Code */
fun main() {
    // Массив с повторяющимися элементами
    val nums = intArrayOf(1, 3, 6, 6, 6, 6, 6, 10, 12, 15)
    println("\nМассив nums = ${nums.contentToString()}")

    // Бинарный поиск левой и правой границы
    for (target in intArrayOf(6, 7)) {
        var index = binarySearchLeftEdge(nums, target)
        println("Индекс самого левого элемента $target равен $index")
        index = binarySearchRightEdge(nums, target)
        println("Индекс самого правого элемента $target равен $index")
    }
}