/**
 * File: binary_search.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_searching

/* Бинарный поиск (двусторонний закрытый интервал) */
fun binarySearch(nums: IntArray, target: Int): Int {
    // Инициализировать закрытый интервал [0, n-1], где i и j указывают на первый и последний элементы массива
    var i = 0
    var j = nums.size - 1
    // Выполнять цикл и выйти, когда диапазон поиска станет пустым (при i > j он пуст)
    while (i <= j) {
        val m = i + (j - i) / 2 // Вычислить средний индекс m
        if (nums[m] < target) // Это означает, что target находится в интервале [m+1, j]
            i = m + 1
        else if (nums[m] > target) // Это означает, что target находится в интервале [i, m-1]
            j = m - 1
        else  // Целевой элемент найден, вернуть его индекс
            return m
    }
    // Целевой элемент не найден, вернуть -1
    return -1
}

/* Бинарный поиск (левый закрытый, правый открытый интервал) */
fun binarySearchLCRO(nums: IntArray, target: Int): Int {
    // Инициализировать интервал [0, n), где i и j указывают на первый элемент массива и позицию за последним элементом
    var i = 0
    var j = nums.size
    // Выполнять цикл и выйти, когда диапазон поиска станет пустым (при i = j он пуст)
    while (i < j) {
        val m = i + (j - i) / 2 // Вычислить средний индекс m
        if (nums[m] < target) // Это означает, что target находится в интервале [m+1, j)
            i = m + 1
        else if (nums[m] > target) // Это означает, что target находится в интервале [i, m)
            j = m
        else  // Целевой элемент найден, вернуть его индекс
            return m
    }
    // Целевой элемент не найден, вернуть -1
    return -1
}

/* Driver Code */
fun main() {
    val target = 6
    val nums = intArrayOf(1, 3, 6, 8, 12, 15, 23, 26, 31, 35)

    /* Бинарный поиск (двусторонний закрытый интервал) */
    var index = binarySearch(nums, target)
    println("Индекс целевого элемента 6 = $index")

    /* Бинарный поиск (левый закрытый, правый открытый интервал) */
    index = binarySearchLCRO(nums, target)
    println("Индекс целевого элемента 6 = $index")
}
