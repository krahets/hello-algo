/**
 * File: heap_sort.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_sorting

/* Если длина кучи равна n, начиная с узла i выполнить просеивание сверху вниз */
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
        // Если узел i уже максимален или индексы l и r выходят за границы, дальнейшая heapify не требуется
        if (ma == i) 
            break
        // Поменять местами два узла
        val temp = nums[i]
        nums[i] = nums[ma]
        nums[ma] = temp
        // Циклически выполнять просеивание вниз
        i = ma
    }
}

/* Сортировка кучей */
fun heapSort(nums: IntArray) {
    // Построение кучи: выполнить просеивание для всех узлов, кроме листьев
    for (i in nums.size / 2 - 1 downTo 0) {
        siftDown(nums, nums.size, i)
    }
    // Извлекать максимальный элемент из кучи в течение n-1 итераций
    for (i in nums.size - 1 downTo 1) {
        // Поменять местами корневой узел и крайний правый лист (первый и последний элементы)
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
