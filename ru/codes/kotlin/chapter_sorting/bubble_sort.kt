/**
 * File: bubble_sort.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_sorting

/* Сортировка пузырьком */
fun bubbleSort(nums: IntArray) {
    // Внешний цикл: неотсортированный участок [0, i]
    for (i in nums.size - 1 downTo 1) {
        // Внутренний цикл: обменами переместить максимум участка [0, i] на его правый конец
        for (j in 0..<i) {
            if (nums[j] > nums[j + 1]) {
                // Поменять местами nums[j] и nums[j + 1]
                val temp = nums[j]
                nums[j] = nums[j + 1]
                nums[j + 1] = temp
            }
        }
    }
}

/* Сортировка пузырьком с флагом обмена */
fun bubbleSortWithFlag(nums: IntArray) {
    // Внешний цикл: неотсортированный участок [0, i]
    for (i in nums.size - 1 downTo 1) {
        var flag = false // Инициализировать флаг
        // Внутренний цикл: обменами переместить максимум участка [0, i] на его правый конец
        for (j in 0..<i) {
            if (nums[j] > nums[j + 1]) {
                // Поменять местами nums[j] и nums[j + 1]
                val temp = nums[j]
                nums[j] = nums[j + 1]
                nums[j + 1] = temp
                flag = true // Отметить, что произошёл обмен
            }
        }
        if (!flag) break // За этот проход обменов не было. Выйти из цикла
    }
}

/* Тестовый пример */
fun main() {
    val nums = intArrayOf(4, 1, 3, 1, 5, 2)
    bubbleSort(nums)
    println("После сортировки пузырьком nums = ${nums.contentToString()}")

    val nums1 = intArrayOf(4, 1, 3, 1, 5, 2)
    bubbleSortWithFlag(nums1)
    println("После сортировки пузырьком nums1 = ${nums1.contentToString()}")
}