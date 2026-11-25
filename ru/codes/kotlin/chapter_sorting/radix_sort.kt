/**
 * File: radix_sort.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_sorting

/* Получить k-ю цифру числа num, где exp = 10^(k-1) */
fun digit(num: Int, exp: Int): Int {
    // Передаём exp вместо k, чтобы не повторять дорогое возведение в степень
    return (num / exp) % 10
}

/* Сортировка подсчётом по k-й цифре элементов nums */
fun countingSortDigit(nums: IntArray, exp: Int) {
    // Десятичные цифры лежат в пределах 0–9, поэтому в массиве блоков 10 ячеек
    val counter = IntArray(10)
    val n = nums.size
    // Подсчитать вхождения каждой цифры от 0 до 9
    for (i in 0..<n) {
        val d = digit(nums[i], exp) // Получить k-ю цифру nums[i] и обозначить её d
        counter[d]++                // Подсчитать вхождения цифры d
    }
    // Вычислить префиксные суммы, чтобы по частотам найти индексы в массиве
    for (i in 1..9) {
        counter[i] += counter[i - 1]
    }
    // Пройти массив с конца и заполнить res по данным счётчиков
    val res = IntArray(n)
    for (i in n - 1 downTo 0) {
        val d = digit(nums[i], exp)
        val j = counter[d] - 1 // Найти индекс j в массиве для цифры d
        res[j] = nums[i]       // Записать текущий элемент по индексу j
        counter[d]--           // Уменьшить счётчик d на 1
    }
    // Скопировать результат в исходный массив nums
    for (i in 0..<n)
        nums[i] = res[i]
}

/* Поразрядная сортировка */
fun radixSort(nums: IntArray) {
    // Найти максимум массива, чтобы определить наибольшее число разрядов
    var m = Int.MIN_VALUE
    for (num in nums) if (num > m) m = num
    var exp = 1
    // Перебирать разряды от младшего к старшему
    while (exp <= m) {
        // Отсортировать элементы подсчётом по k-й цифре
        // k = 1 -> exp = 1
        // k = 2 -> exp = 10
        // То есть exp = 10^(k-1)
        countingSortDigit(nums, exp)
        exp *= 10
    }
}

/* Тестовый пример */
fun main() {
    // Поразрядная сортировка
    val nums = intArrayOf(
        10546151, 35663510, 42865989, 34862445, 81883077,
        88906420, 72429244, 30524779, 82060337, 63832996
    )
    radixSort(nums)
    println("После поразрядной сортировки nums = ${nums.contentToString()}")
}