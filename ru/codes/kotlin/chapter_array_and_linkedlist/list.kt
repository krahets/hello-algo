/**
 * File: list.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_array_and_linkedlist

/* Демонстрационный код */
fun main() {
    /* Инициализация списка */
    // Изменяемая коллекция
    val nums = mutableListOf(1, 3, 2, 5, 4)
    println("Список nums = $nums")

    /* Доступ к элементу */
    val num = nums[1]
    println("Элемент по индексу 1: num = $num")

    /* Изменение элемента */
    nums[1] = 0
    println("После записи 0 по индексу 1 nums = $nums")

    /* Очистка списка */
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

    /* Обойти список по индексам */
    var count = 0
    for (i in nums.indices) {
        count += nums[i]
    }

    /* Перебрать элементы списка напрямую */
    for (j in nums) {
        count += j
    }

    /* Объединение двух списков*/
    val nums1 = mutableListOf(6, 8, 7, 10, 9)
    nums.addAll(nums1)
    println("После добавления nums1 в конец nums получаем nums = $nums")

    /* Сортировка списка */
    nums.sort()
    println("После сортировки nums = $nums")
}