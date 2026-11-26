/**
 * File: counting_sort.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_sorting

import kotlin.math.max

/* Сортировка подсчётом */
// Простая реализация, непригодная для сортировки объектов
fun countingSortNaive(nums: IntArray) {
    // 1. Найти максимальный элемент m в массиве
    var m = 0
    for (num in nums) {
        m = max(m, num)
    }
    // 2. Подсчитать число вхождений каждого значения
    // counter[num] — число вхождений num
    val counter = IntArray(m + 1)
    for (num in nums) {
        counter[num]++
    }
    // 3. Пройти по counter и записать элементы в исходный массив nums
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

/* Сортировка подсчётом */
// Полная реализация: устойчивая сортировка с поддержкой объектов
fun countingSort(nums: IntArray) {
    // 1. Найти максимальный элемент m в массиве
    var m = 0
    for (num in nums) {
        m = max(m, num)
    }
    // 2. Подсчитать число вхождений каждого значения
    // counter[num] — число вхождений num
    val counter = IntArray(m + 1)
    for (num in nums) {
        counter[num]++
    }
    // 3. Вычислить префиксные суммы в counter, чтобы по частотам найти конечные позиции
    // То есть counter[num]-1 — индекс последнего вхождения num в res
    for (i in 0..<m) {
        counter[i + 1] += counter[i]
    }
    // 4. Пройти по nums в обратном порядке и записать элементы в массив результата res
    // Создать массив res для результата
    val n = nums.size
    val res = IntArray(n)
    for (i in n - 1 downTo 0) {
        val num = nums[i]
        res[counter[num] - 1] = num // Поместить num по соответствующему индексу
        counter[num]-- // Уменьшить префиксную сумму на 1, чтобы определить позицию следующего вхождения num
    }
    // Скопировать результат из res в исходный массив nums
    for (i in 0..<n) {
        nums[i] = res[i]
    }
}

/* Тестовый пример */
fun main() {
    val nums = intArrayOf(1, 0, 1, 2, 0, 4, 0, 2, 2, 4)
    countingSortNaive(nums)
    println("После сортировки подсчётом (без поддержки объектов) nums = ${nums.contentToString()}")

    val nums1 = intArrayOf(1, 0, 1, 2, 0, 4, 0, 2, 2, 4)
    countingSort(nums1)
    println("После сортировки подсчётом nums1 = ${nums1.contentToString()}")
}