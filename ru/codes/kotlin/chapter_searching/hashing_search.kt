/**
 * File: hashing_search.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_searching

import utils.ListNode

/* Хеш-поиск (массив) */
fun hashingSearchArray(map: Map<Int?, Int>, target: Int): Int {
    // key хеш-таблицы: целевой элемент, _val: индекс
    // Если такого key нет в хеш-таблице, вернуть -1
    return map.getOrDefault(target, -1)
}

/* Хеш-поиск (связный список) */
fun hashingSearchLinkedList(map: Map<Int?, ListNode?>, target: Int): ListNode? {
    // key хеш-таблицы: значение целевого узла, _val: объект узла
    // Если такого key нет в хеш-таблице, вернуть null
    return map.getOrDefault(target, null)
}

/* Driver Code */
fun main() {
    val target = 3

    /* Хеш-поиск (массив) */
    val nums = intArrayOf(1, 5, 3, 2, 4, 7, 5, 9, 10, 8)
    // Инициализация хеш-таблицы
    val map = HashMap<Int?, Int>()
    for (i in nums.indices) {
        map[nums[i]] = i // key: элемент, _val: индекс
    }
    val index = hashingSearchArray(map, target)
    println("Индекс целевого элемента 3 = $index")

    /* Хеш-поиск (связный список) */
    var head = ListNode.arrToLinkedList(nums)
    // Инициализация хеш-таблицы
    val map1 = HashMap<Int?, ListNode?>()
    while (head != null) {
        map1[head._val] = head // key: значение узла, _val: узел
        head = head.next
    }
    val node = hashingSearchLinkedList(map1, target)
    println("Объект узла со значением 3 = $node")
}