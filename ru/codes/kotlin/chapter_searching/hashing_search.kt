/**
 * File: hashing_search.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_searching

import utils.ListNode

/* Поиск по хеш-таблице в массиве */
fun hashingSearchArray(map: Map<Int?, Int>, target: Int): Int {
    // Ключ хеш-таблицы — искомый элемент, _val — его индекс
    // Если ключа в хеш-таблице нет, возвращаем -1
    return map.getOrDefault(target, -1)
}

/* Поиск по хеш-таблице в связном списке */
fun hashingSearchLinkedList(map: Map<Int?, ListNode?>, target: Int): ListNode? {
    // Ключ хеш-таблицы — искомое значение узла, _val — сам узел
    // Если ключа в хеш-таблице нет, возвращаем null
    return map.getOrDefault(target, null)
}

/* Пример использования */
fun main() {
    val target = 3

    /* Поиск по хеш-таблице в массиве */
    val nums = intArrayOf(1, 5, 3, 2, 4, 7, 5, 9, 10, 8)
    // Создаём хеш-таблицу
    val map = HashMap<Int?, Int>()
    for (i in nums.indices) {
        map[nums[i]] = i // Ключ — элемент, _val — индекс
    }
    val index = hashingSearchArray(map, target)
    println("Индекс элемента 3 = $index")

    /* Поиск по хеш-таблице в связном списке */
    var head = ListNode.arrToLinkedList(nums)
    // Создаём хеш-таблицу
    val map1 = HashMap<Int?, ListNode?>()
    while (head != null) {
        map1[head._val] = head // Ключ — значение узла, _val — сам узел
        head = head.next
    }
    val node = hashingSearchLinkedList(map1, target)
    println("Узел со значением 3: $node")
}