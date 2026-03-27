/**
 * File: counting_sort.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_sorting

import kotlin.math.max

/* Сортировка подсчетом */
// Простая реализация, не подходит для сортировки объектов
fun countingSortNaive(nums: IntArray) {
    // 1. Найти максимальный элемент массива m
    var m = 0
    for (num in nums) {
        m = max(m, num)
    }
    // 2. Подсчитать число появлений каждой цифры
    // counter[num] обозначает число появлений num
    val counter = IntArray(m + 1)
    for (num in nums) {
        counter[num]++
    }
    // 3. Обойти counter и заполнить исходный массив nums элементами
    var i = 0
    for (num in 0..<m + 1) {
        var j = 0
        while (j < counter[num]) {
            nums[i] = num
            j++
            i++
        }
    }
}

/* Сортировка подсчетом */
// Полная реализация, позволяет сортировать объекты и является стабильной сортировкой
fun countingSort(nums: IntArray) {
    // 1. Найти максимальный элемент массива m
    var m = 0
    for (num in nums) {
        m = max(m, num)
    }
    // 2. Подсчитать число появлений каждой цифры
    // counter[num] обозначает число появлений num
    val counter = IntArray(m + 1)
    for (num in nums) {
        counter[num]++
    }
    // 3. Вычислить префиксные суммы counter и преобразовать «число появлений» в «конечный индекс»
    // То есть counter[num]-1 — это индекс последнего появления num в res
    for (i in 0..<m) {
        counter[i + 1] += counter[i]
    }
    // 4. Обойти nums в обратном порядке и поместить элементы в результирующий массив res
    // Инициализировать массив res для хранения результата
    val n = nums.size
    val res = IntArray(n)
    for (i in n - 1 downTo 0) {
        val num = nums[i]
        res[counter[num] - 1] = num // Поместить num по соответствующему индексу
        counter[num]-- // Уменьшить префиксную сумму на 1, чтобы получить индекс следующего размещения num
    }
    // Перезаписать исходный массив nums массивом результата res
    for (i in 0..<n) {
        nums[i] = res[i]
    }
}

/* Driver Code */
fun main() {
    val nums = intArrayOf(1, 0, 1, 2, 0, 4, 0, 2, 2, 4)
    countingSortNaive(nums)
    println("После сортировки подсчетом (объекты не поддерживаются) nums = ${nums.contentToString()}")

    val nums1 = intArrayOf(1, 0, 1, 2, 0, 4, 0, 2, 2, 4)
    countingSort(nums1)
    println("После сортировки подсчетом nums1 = ${nums1.contentToString()}")
}