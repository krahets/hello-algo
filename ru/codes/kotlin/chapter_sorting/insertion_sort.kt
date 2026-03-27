/**
 * File: insertion_sort.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_sorting

/* Сортировка вставками */
fun insertionSort(nums: IntArray) {
    // Внешний цикл: отсортированные элементы равны 1, 2, ..., n
    for (i in nums.indices) {
        val base = nums[i]
        var j = i - 1
        // Внутренний цикл: вставить base в правильную позицию отсортированного диапазона [0, i-1]
        while (j >= 0 && nums[j] > base) {
            nums[j + 1] = nums[j] // Сдвинуть nums[j] на одну позицию вправо
            j--
        }
        nums[j + 1] = base        // Поместить base в правильную позицию
    }
}

/* Driver Code */
fun main() {
    val nums = intArrayOf(4, 1, 3, 1, 5, 2)
    insertionSort(nums)
    println("После сортировки вставками nums = ${nums.contentToString()}")
}