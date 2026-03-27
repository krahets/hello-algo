/**
 * File: worst_best_time_complexity.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_computational_complexity.worst_best_time_complexity

/* Создать массив с элементами { 1, 2, ..., n } в случайном порядке */
fun randomNumbers(n: Int): Array<Int?> {
    val nums = IntArray(n)
    // Создать массив nums = { 1, 2, 3, ..., n }
    for (i in 0..<n) {
        nums[i] = i + 1
    }
    // Случайно перемешать элементы массива
    nums.shuffle()
    val res = arrayOfNulls<Int>(n)
    for (i in 0..<n) {
        res[i] = nums[i]
    }
    return res
}

/* Найти индекс числа 1 в массиве nums */
fun findOne(nums: Array<Int?>): Int {
    for (i in nums.indices) {
        // Когда элемент 1 находится в начале массива, достигается лучшая временная сложность O(1)
        // Когда элемент 1 находится в конце массива, достигается худшая временная сложность O(n)
        if (nums[i] == 1)
            return i
    }
    return -1
}

/* Driver Code */
fun main() {
    for (i in 0..9) {
        val n = 100
        val nums = randomNumbers(n)
        val index = findOne(nums)
        println("\nМассив [1, 2, ..., n] после перемешивания = ${nums.contentToString()}")
        println("Индекс числа 1 = $index")
    }
}