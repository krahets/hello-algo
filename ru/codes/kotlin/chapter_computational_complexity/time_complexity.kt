/**
 * File: time_complexity.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_computational_complexity.time_complexity

/* Константная сложность */
fun constant(n: Int): Int {
    var count = 0
    val size = 100000
    for (i in 0..<size)
        count++
    return count
}

/* Линейная сложность */
fun linear(n: Int): Int {
    var count = 0
    for (i in 0..<n)
        count++
    return count
}

/* Линейная сложность (обход массива) */
fun arrayTraversal(nums: IntArray): Int {
    var count = 0
    // Число итераций пропорционально длине массива
    for (num in nums) {
        count++
    }
    return count
}

/* Квадратичная сложность */
fun quadratic(n: Int): Int {
    var count = 0
    // Число итераций пропорционально квадрату размера данных n
    for (i in 0..<n) {
        for (j in 0..<n) {
            count++
        }
    }
    return count
}

/* Квадратичная сложность (пузырьковая сортировка) */
fun bubbleSort(nums: IntArray): Int {
    var count = 0 // Счётчик
    // Внешний цикл: неотсортированный участок — [0, i]
    for (i in nums.size - 1 downTo 1) {
        // Внутренний цикл обменами перемещает максимум участка [0, i] на его правый край
        for (j in 0..<i) {
            if (nums[j] > nums[j + 1]) {
                // Поменять местами nums[j] и nums[j + 1]
                val temp = nums[j]
                nums[j] = nums[j + 1]
                nums[j + 1] = temp
                count += 3 // Обмен элементов состоит из трёх элементарных операций
            }
        }
    }
    return count
}

/* Экспоненциальная сложность (цикл) */
fun exponential(n: Int): Int {
    var count = 0
    var base = 1
    // На каждом шаге клетка делится надвое. Получаем 1, 2, 4, 8, ..., 2^(n-1)
    for (i in 0..<n) {
        for (j in 0..<base) {
            count++
        }
        base *= 2
    }
    // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
    return count
}

/* Экспоненциальная сложность (рекурсия) */
fun expRecur(n: Int): Int {
    if (n == 1) {
        return 1
    }
    return expRecur(n - 1) + expRecur(n - 1) + 1
}

/* Логарифмическая сложность (цикл) */
fun logarithmic(n: Int): Int {
    var n1 = n
    var count = 0
    while (n1 > 1) {
        n1 /= 2
        count++
    }
    return count
}

/* Логарифмическая сложность (рекурсия) */
fun logRecur(n: Int): Int {
    if (n <= 1)
        return 0
    return logRecur(n / 2) + 1
}

/* Линейно-логарифмическая сложность */
fun linearLogRecur(n: Int): Int {
    if (n <= 1)
        return 1
    var count = linearLogRecur(n / 2) + linearLogRecur(n / 2)
    for (i in 0..<n) {
        count++
    }
    return count
}

/* Факториальная сложность (рекурсия) */
fun factorialRecur(n: Int): Int {
    if (n == 0)
        return 1
    var count = 0
    // Разветвить одну задачу на n подзадач
    for (i in 0..<n) {
        count += factorialRecur(n - 1)
    }
    return count
}

/* Основная программа */
fun main() {
    // Попробуйте менять n и следить за ростом числа операций при разной сложности
    val n = 8
    println("Размер входных данных n = $n")

    var count = constant(n)
    println("Число операций при константной сложности = $count")

    count = linear(n)
    println("Число операций при линейной сложности = $count")
    count = arrayTraversal(IntArray(n))
    println("Число операций при линейной сложности (обход массива) = $count")

    count = quadratic(n)
    println("Число операций при квадратичной сложности = $count")
    val nums = IntArray(n)
    for (i in 0..<n)
        nums[i] = n - i // [n,n-1,...,2,1]
    count = bubbleSort(nums)
    println("Число операций при квадратичной сложности (пузырьковая сортировка) = $count")

    count = exponential(n)
    println("Число операций при экспоненциальной сложности (цикл) = $count")
    count = expRecur(n)
    println("Число операций при экспоненциальной сложности (рекурсия) = $count")

    count = logarithmic(n)
    println("Число операций при логарифмической сложности (цикл) = $count")
    count = logRecur(n)
    println("Число операций при логарифмической сложности (рекурсия) = $count")

    count = linearLogRecur(n)
    println("Число операций при линейно-логарифмической сложности (рекурсия) = $count")

    count = factorialRecur(n)
    println("Число операций при факториальной сложности (рекурсия) = $count")
}