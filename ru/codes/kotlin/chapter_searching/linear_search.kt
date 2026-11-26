/**
 * File: linear_search.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_searching

import utils.ListNode

/* Линейный поиск в массиве */
fun linearSearchArray(nums: IntArray, target: Int): Int {
    // Обходим массив
    for (i in nums.indices) {
        // Элемент найден, возвращаем его индекс
        if (nums[i] == target)
            return i
    }
    // Элемент не найден, возвращаем -1
    return -1
}

/* Линейный поиск в связном списке */
fun linearSearchLinkedList(h: ListNode?, target: Int): ListNode? {
    // Обходим связный список
    var head = h
    while (head != null) {
        // Нужный узел найден, возвращаем его
        if (head._val == target)
            return head
        head = head.next
    }
    // Нужный узел не найден, возвращаем null
    return null
}

/* Пример использования */
fun main() {
    val target = 3

    /* Выполняем линейный поиск в массиве */
    val nums = intArrayOf(1, 5, 3, 2, 4, 7, 5, 9, 10, 8)
    val index = linearSearchArray(nums, target)
    println("Индекс элемента 3 = $index")

    /* Выполняем линейный поиск в связном списке */
    val head = ListNode.arrToLinkedList(nums)
    val node = linearSearchLinkedList(head, target)
    println("Узел со значением 3: $node")
}