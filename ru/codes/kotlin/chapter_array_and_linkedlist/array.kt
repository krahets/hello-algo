/**
 * File: array.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_array_and_linkedlist

import java.util.concurrent.ThreadLocalRandom

/* Случайный доступ к элементу */
fun randomAccess(nums: IntArray): Int {
    // Случайно выбрать число в интервале [0, nums.size)
    val randomIndex = ThreadLocalRandom.current().nextInt(0, nums.size)
    // Получить и вернуть случайный элемент
    val randomNum = nums[randomIndex]
    return randomNum
}

/* Увеличить длину массива */
fun extend(nums: IntArray, enlarge: Int): IntArray {
    // Инициализировать массив увеличенной длины
    val res = IntArray(nums.size + enlarge)
    // Скопировать все элементы исходного массива в новый массив
    for (i in nums.indices) {
        res[i] = nums[i]
    }
    // Вернуть новый расширенный массив
    return res
}

/* Вставить элемент num в массив по индексу index */
fun insert(nums: IntArray, num: Int, index: Int) {
    // Сдвинуть индекс index и все последующие элементы на одну позицию назад
    for (i in nums.size - 1 downTo index + 1) {
        nums[i] = nums[i - 1]
    }
    // Присвоить num элементу по индексу index
    nums[index] = num
}

/* Удалить элемент по индексу index */
fun remove(nums: IntArray, index: Int) {
    // Сдвинуть все элементы после индекса index на одну позицию вперед
    for (i in index..<nums.size - 1) {
        nums[i] = nums[i + 1]
    }
}

/* Перебрать массив */
fun traverse(nums: IntArray) {
    var count = 0
    // Обходить массив по индексам
    for (i in nums.indices) {
        count += nums[i]
    }
    // Непосредственно обходить элементы массива
    for (j in nums) {
        count += j
    }
}

/* Найти заданный элемент в массиве */
fun find(nums: IntArray, target: Int): Int {
    for (i in nums.indices) {
        if (nums[i] == target)
            return i
    }
    return -1
}

/* Driver Code */
fun main() {
    /* Инициализировать массив */
    val arr = IntArray(5)
    println("массив arr = ${arr.contentToString()}")
    var nums = intArrayOf(1, 3, 2, 5, 4)
    println("массив nums = ${nums.contentToString()}")

    /* Случайный доступ */
    val randomNum: Int = randomAccess(nums)
    println("Полученный случайный элемент из nums $randomNum")

    /* Расширение длины */
    nums = extend(nums, 3)
    println("После расширения длины массива до 8 получаем nums = ${nums.contentToString()}")

    /* Вставить элемент */
    insert(nums, 6, 3)
    println("После вставки числа 6 по индексу 3 получаем nums = ${nums.contentToString()}")

    /* Удалить элемент */
    remove(nums, 2)
    println("После удаления элемента по индексу 2 получаем nums = ${nums.contentToString()}")

    /* Перебрать массив */
    traverse(nums)

    /* Найти элемент */
    val index: Int = find(nums, 3)
    println("Поиск элемента 3 в nums дает индекс = $index")
}
