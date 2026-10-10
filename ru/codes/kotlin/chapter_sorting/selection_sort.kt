/**
 * File: selection_sort.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_sorting

/* Сортировка выбором */
fun selectionSort(nums: IntArray) {
    val n = nums.size
    // Внешний цикл: неотсортированный диапазон [i, n-1]
    for (i in 0..<n - 1) {
        var k = i
        // Внутренний цикл: найти минимальный элемент в неотсортированном диапазоне
        for (j in i + 1..<n) {
            if (nums[j] < nums[k])
                k = j // Записать индекс минимального элемента
        }
        // Поменять этот минимальный элемент местами с первым элементом неотсортированного диапазона
        val temp = nums[i]
        nums[i] = nums[k]
        nums[k] = temp
    }
}

/* Driver Code */
fun main() {
    val nums = intArrayOf(4, 1, 3, 1, 5, 2)
    selectionSort(nums)
    println("После сортировки выбором nums = ${nums.contentToString()}")
}