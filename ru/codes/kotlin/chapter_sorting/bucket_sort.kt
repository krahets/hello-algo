/**
 * File: bucket_sort.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_sorting

/* Блочная сортировка */
fun bucketSort(nums: FloatArray) {
    // Создать k = n/2 блоков в расчёте на два элемента в каждом
    val k = nums.size / 2
    val buckets = mutableListOf<MutableList<Float>>()
    for (i in 0..<k) {
        buckets.add(mutableListOf())
    }
    // 1. Распределить элементы массива по блокам
    for (num in nums) {
        // Значения лежат в [0, 1). Умножение num * k даёт индекс в [0, k-1]
        val i = (num * k).toInt()
        // Добавить num в блок i
        buckets[i].add(num)
    }
    // 2. Отсортировать каждый блок
    for (bucket in buckets) {
        // Используем встроенную сортировку. Её можно заменить другим алгоритмом
        bucket.sort()
    }
    // 3. Обойти блоки и объединить результаты
    var i = 0
    for (bucket in buckets) {
        for (num in bucket) {
            nums[i++] = num
        }
    }
}

/* Тестовый пример */
fun main() {
    // Входные данные — числа с плавающей точкой из интервала [0, 1)
    val nums = floatArrayOf(0.49f, 0.96f, 0.82f, 0.09f, 0.57f, 0.43f, 0.91f, 0.75f, 0.15f, 0.37f)
    bucketSort(nums)
    println("После блочной сортировки nums = ${nums.contentToString()}")
}