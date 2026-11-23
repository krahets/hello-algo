/**
 * File: heap_sort.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_sorting

/* Длина кучи равна n; начиная с узла i, выполнить просеивание сверху вниз */
fun siftDown(nums: IntArray, n: Int, li: Int) {
    var i = li
    while (true) {
        // Определить узел с максимальным значением среди i, l и r и обозначить его как ma
        val l = 2 * i + 1
        val r = 2 * i + 2
        var ma = i
        if (l < n && nums[l] > nums[ma]) 
            ma = l
        if (r < n && nums[r] > nums[ma]) 
            ma = r
        // Если узел i уже максимален или индексы l и r вне границ, дальнейшее просеивание не требуется, выйти
        if (ma == i) 
            break
        // Поменять два узла местами
        val temp = nums[i]
        nums[i] = nums[ma]
        nums[ma] = temp
        // Циклическое просеивание вниз
        i = ma
    }
}

/* Сортировка кучей */
fun heapSort(nums: IntArray) {
    // Построение кучи: выполнить heapify для всех узлов, кроме листовых
    for (i in nums.size / 2 - 1 downTo 0) {
        siftDown(nums, nums.size, i)
    }
    // Извлекать максимальный элемент из кучи в течение n-1 итераций
    for (i in nums.size - 1 downTo 1) {
        // Поменять корневой узел с самым правым листом местами (поменять первый и последний элементы)
        val temp = nums[0]
        nums[0] = nums[i]
        nums[i] = temp
        // Начиная с корневого узла, выполнить просеивание сверху вниз
        siftDown(nums, i, 0)
    }
}

/* Driver Code */
fun main() {
    val nums = intArrayOf(4, 1, 3, 1, 5, 2)
    heapSort(nums)
    println("После сортировки кучей nums = ${nums.contentToString()}")
}