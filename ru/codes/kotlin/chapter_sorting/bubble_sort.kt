/**
 * File: bubble_sort.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_sorting

/* Пузырьковая сортировка */
fun bubbleSort(nums: IntArray) {
    // Внешний цикл: неотсортированный диапазон [0, i]
    for (i in nums.size - 1 downTo 1) {
        // Внутренний цикл: переместить максимальный элемент неотсортированного диапазона [0, i] в его правый конец
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

/* Пузырьковая сортировка (оптимизация флагом) */
fun bubbleSortWithFlag(nums: IntArray) {
    // Внешний цикл: неотсортированный диапазон [0, i]
    for (i in nums.size - 1 downTo 1) {
        var flag = false // Инициализировать флаг
        // Внутренний цикл: переместить максимальный элемент неотсортированного диапазона [0, i] в его правый конец
        for (j in 0..<i) {
            if (nums[j] > nums[j + 1]) {
                // Поменять местами nums[j] и nums[j + 1]
                val temp = nums[j]
                nums[j] = nums[j + 1]
                nums[j + 1] = temp
                flag = true // Записать обмен элементов
            }
        }
        if (!flag) break // На этой итерации «всплытия» не было ни одного обмена, сразу выйти
    }
}

/* Driver Code */
fun main() {
    val nums = intArrayOf(4, 1, 3, 1, 5, 2)
    bubbleSort(nums)
    println("После пузырьковой сортировки nums = ${nums.contentToString()}")

    val nums1 = intArrayOf(4, 1, 3, 1, 5, 2)
    bubbleSortWithFlag(nums1)
    println("После пузырьковой сортировки nums1 = ${nums1.contentToString()}")
}