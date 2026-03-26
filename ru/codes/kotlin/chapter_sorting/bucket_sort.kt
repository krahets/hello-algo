/**
 * File: bucket_sort.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_sorting

/* Сортировка по бакетам */
fun bucketSort(nums: FloatArray) {
    // Инициализировать k = n/2 бакетов, предполагая, что в каждый бакет попадут 2 элемента
    val k = nums.size / 2
    val buckets = mutableListOf<MutableList<Float>>()
    for (i in 0..<k) {
        buckets.add(mutableListOf())
    }
    // 1. Распределить элементы массива по бакетам
    for (num in nums) {
        // Диапазон входных данных равен [0, 1), использовать num * k для отображения в диапазон индексов [0, k-1]
        val i = (num * k).toInt()
        // Добавить num в бакет i
        buckets[i].add(num)
    }
    // 2. Выполнить сортировку внутри каждого бакета
    for (bucket in buckets) {
        // Использовать встроенную функцию сортировки; при необходимости ее можно заменить другим алгоритмом сортировки
        bucket.sort()
    }
    // 3. Обойти бакеты и объединить результат
    var i = 0
    for (bucket in buckets) {
        for (num in bucket) {
            nums[i++] = num
        }
    }
}

/* Driver Code */
fun main() {
    // Пусть входные данные являются числами с плавающей точкой, диапазон равен [0, 1)
    val nums = floatArrayOf(0.49f, 0.96f, 0.82f, 0.09f, 0.57f, 0.43f, 0.91f, 0.75f, 0.15f, 0.37f)
    bucketSort(nums)
    println("После сортировки по бакетам nums = ${nums.contentToString()}")
}
