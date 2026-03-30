/**
 * File: radix_sort.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_sorting

/* Получить k-й разряд элемента num, где exp = 10^(k-1) */
fun digit(num: Int, exp: Int): Int {
    // Передача exp вместо k позволяет избежать повторного дорогостоящего вычисления степени
    return (num / exp) % 10
}

/* Сортировка подсчетом (сортировка по k-му разряду nums) */
fun countingSortDigit(nums: IntArray, exp: Int) {
    // Разряды десятичной системы лежат в диапазоне 0~9, поэтому нужен массив корзин длины 10
    val counter = IntArray(10)
    val n = nums.size
    // Подсчитать число появлений каждой цифры от 0 до 9
    for (i in 0..<n) {
        val d = digit(nums[i], exp) // Получить k-й разряд nums[i], обозначив его как d
        counter[d]++                // Подсчитать число появлений цифры d
    }
    // Вычислить префиксные суммы и преобразовать «число появлений» в «индекс массива»
    for (i in 1..9) {
        counter[i] += counter[i - 1]
    }
    // Выполняя обратный проход, заполнить res элементами по статистике в корзинах
    val res = IntArray(n)
    for (i in n - 1 downTo 0) {
        val d = digit(nums[i], exp)
        val j = counter[d] - 1 // Получить индекс j цифры d в массиве
        res[j] = nums[i]       // Поместить текущий элемент по индексу j
        counter[d]--           // Уменьшить количество d на 1
    }
    // Перезаписать исходный массив nums результатом
    for (i in 0..<n)
        nums[i] = res[i]
}

/* Поразрядная сортировка */
fun radixSort(nums: IntArray) {
    // Получить максимальный элемент массива, чтобы определить максимальное число разрядов
    var m = Int.MIN_VALUE
    for (num in nums) if (num > m) m = num
    var exp = 1
    // Проходить разряды от младшего к старшему
    while (exp <= m) {
        // Выполнить сортировку подсчетом по k-му разряду элементов массива
        // k = 1 -> exp = 1
        // k = 2 -> exp = 10
        // то есть exp = 10^(k-1)
        countingSortDigit(nums, exp)
        exp *= 10
    }
}

/* Driver Code */
fun main() {
    // Поразрядная сортировка
    val nums = intArrayOf(
        10546151, 35663510, 42865989, 34862445, 81883077,
        88906420, 72429244, 30524779, 82060337, 63832996
    )
    radixSort(nums)
    println("После поразрядной сортировки nums = ${nums.contentToString()}")
}