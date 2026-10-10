/**
 * File: list.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_array_and_linkedlist

/* Driver Code */
fun main() {
    /* Инициализация списка */
    // Изменяемое множество
    val nums = mutableListOf(1, 3, 2, 5, 4)
    println("Список nums = $nums")

    /* Доступ к элементу */
    val num = nums[1]
    println("Элемент по индексу 1: num = $num")

    /* Обновление элемента */
    nums[1] = 0
    println("После обновления элемента по индексу 1 до 0 nums = $nums")

    /* Очистить список */
    nums.clear()
    println("После очистки списка nums = $nums")

    /* Добавление элемента в конец */
    nums.add(1)
    nums.add(3)
    nums.add(2)
    nums.add(5)
    nums.add(4)
    println("После добавления элементов nums = $nums")

    /* Вставка элемента в середину */
    nums.add(3, 6)
    println("После вставки числа 6 по индексу 3 nums = $nums")

    /* Удаление элемента */
    nums.removeAt(3)
    println("После удаления элемента по индексу 3 nums = $nums")

    /* Обходить список по индексам */
    var count = 0
    for (i in nums.indices) {
        count += nums[i]
    }

    /* Непосредственно обходить элементы списка */
    for (j in nums) {
        count += j
    }

    /* Объединить два списка */
    val nums1 = mutableListOf(6, 8, 7, 10, 9)
    nums.addAll(nums1)
    println("После конкатенации списка nums1 к nums nums = $nums")

    /* Отсортировать список */
    nums.sort()
    println("После сортировки списка nums = $nums")
}