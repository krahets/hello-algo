/**
 * File: linear_search.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_searching

import utils.ListNode

/* Линейный поиск (массив) */
fun linearSearchArray(nums: IntArray, target: Int): Int {
    // Обход массива
    for (i in nums.indices) {
        // Целевой элемент найден, вернуть его индекс
        if (nums[i] == target)
            return i
    }
    // Целевой элемент не найден, вернуть -1
    return -1
}

/* Линейный поиск (связный список) */
fun linearSearchLinkedList(h: ListNode?, target: Int): ListNode? {
    // Обойти связный список
    var head = h
    while (head != null) {
        // Найти целевой узел и вернуть его
        if (head._val == target)
            return head
        head = head.next
    }
    // Целевой узел не найден, вернуть null
    return null
}

/* Driver Code */
fun main() {
    val target = 3

    /* Выполнить линейный поиск в массиве */
    val nums = intArrayOf(1, 5, 3, 2, 4, 7, 5, 9, 10, 8)
    val index = linearSearchArray(nums, target)
    println("Индекс целевого элемента 3 = $index")

    /* Выполнить линейный поиск в связном списке */
    val head = ListNode.arrToLinkedList(nums)
    val node = linearSearchLinkedList(head, target)
    println("Объект узла со значением 3 = $node")
}