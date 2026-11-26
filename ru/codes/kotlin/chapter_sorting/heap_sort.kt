/**
 * File: heap_sort.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_sorting

/* Размер кучи равен n. Выполнить просеивание вниз от узла i */
fun siftDown(nums: IntArray, n: Int, li: Int) {
    var i = li
    while (true) {
        // Найти среди i, l, r узел с наибольшим значением и обозначить его ma
        val l = 2 * i + 1
        val r = 2 * i + 2
        var ma = i
        if (l < n && nums[l] > nums[ma]) 
            ma = l
        if (r < n && nums[r] > nums[ma]) 
            ma = r
        // Если максимум уже в i или индексы l и r вне кучи, завершить просеивание
        if (ma == i) 
            break
        // Поменять два узла местами
        val temp = nums[i]
        nums[i] = nums[ma]
        nums[ma] = temp
        // Продолжить просеивание вниз
        i = ma
    }
}

/* Пирамидальная сортировка */
fun heapSort(nums: IntArray) {
    // Построить кучу: выполнить просеивание для всех узлов, кроме листьев
    for (i in nums.size / 2 - 1 downTo 0) {
        siftDown(nums, nums.size, i)
    }
    // Извлечь максимум из кучи n-1 раз
    for (i in nums.size - 1 downTo 1) {
        // Обменять корень с крайним правым листом (первый элемент с последним)
        val temp = nums[0]
        nums[0] = nums[i]
        nums[i] = temp
        // Выполнить просеивание вниз от корня
        siftDown(nums, i, 0)
    }
}

/* Тестовый пример */
fun main() {
    val nums = intArrayOf(4, 1, 3, 1, 5, 2)
    heapSort(nums)
    println("После пирамидальной сортировки nums = ${nums.contentToString()}")
}