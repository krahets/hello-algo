/**
 * File: array.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_array_and_linkedlist

import java.util.concurrent.ThreadLocalRandom

/* Случайный доступ к элементу */
fun randomAccess(nums: IntArray): Int {
    // Случайным образом выбрать число из интервала [0, nums.size)
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
    // Вернуть новый массив после расширения
    return res
}

/* Вставить элемент num по индексу index в массив */
fun insert(nums: IntArray, num: Int, index: Int) {
    // Сдвинуть элемент с индексом index и все последующие элементы на одну позицию назад
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

/* Обход массива */
fun traverse(nums: IntArray) {
    var count = 0
    // Обход массива по индексам
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
    /* Инициализация массива */
    val arr = IntArray(5)
    println("Массив arr = ${arr.contentToString()}")
    var nums = intArrayOf(1, 3, 2, 5, 4)
    println("Массив nums = ${nums.contentToString()}")

    /* Случайный доступ */
    val randomNum: Int = randomAccess(nums)
    println("Случайный элемент из nums = $randomNum")

    /* Расширение длины */
    nums = extend(nums, 3)
    println("После увеличения длины массива до 8 nums = ${nums.contentToString()}")

    /* Вставка элемента */
    insert(nums, 6, 3)
    println("После вставки числа 6 по индексу 3 nums = ${nums.contentToString()}")

    /* Удаление элемента */
    remove(nums, 2)
    println("После удаления элемента по индексу 2 nums = ${nums.contentToString()}")

    /* Обход массива */
    traverse(nums)

    /* Поиск элемента */
    val index: Int = find(nums, 3)
    println("Поиск элемента 3 в nums: индекс = $index")
}