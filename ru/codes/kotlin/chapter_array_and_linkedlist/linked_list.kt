/**
 * File: linked_list.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_array_and_linkedlist

import utils.ListNode
import utils.printLinkedList

/* Вставить узел P после узла n0 в связном списке */
fun insert(n0: ListNode?, p: ListNode?) {
    val n1 = n0?.next
    p?.next = n1
    n0?.next = p
}

/* Удалить первый узел после узла n0 в связном списке */
fun remove(n0: ListNode?) {
    if (n0?.next == null)
        return
    // n0 -> P -> n1
    val p = n0.next
    val n1 = p?.next
    n0.next = n1
}

/* Доступ к узлу связного списка по индексу index */
fun access(head: ListNode?, index: Int): ListNode? {
    var h = head
    for (i in 0..<index) {
        if (h == null)
            return null
        h = h.next
    }
    return h
}

/* Найти в связном списке первый узел со значением target */
fun find(head: ListNode?, target: Int): Int {
    var index = 0
    var h = head
    while (h != null) {
        if (h._val == target)
            return index
        h = h.next
        index++
    }
    return -1
}

/* Driver Code */
fun main() {
    /* Инициализация связного списка */
    // Инициализация всех узлов
    val n0 = ListNode(1)
    val n1 = ListNode(3)
    val n2 = ListNode(2)
    val n3 = ListNode(5)
    val n4 = ListNode(4)

    // Построить ссылки между узлами
    n0.next = n1
    n1.next = n2
    n2.next = n3
    n3.next = n4
    println("Исходный связный список")
    printLinkedList(n0)

    /* Вставка узла */
    insert(n0, ListNode(0))
    println("Связный список после вставки узла")
    printLinkedList(n0)

    /* Удаление узла */
    remove(n0)
    println("Связный список после удаления узла")
    printLinkedList(n0)

    /* Доступ к узлу */
    val node = access(n0, 3)!!
    println("Значение узла по индексу 3 в связном списке = ${node._val}")

    /* Поиск узла */
    val index = find(n0, 2)
    println("Индекс узла со значением 2 в связном списке = $index")
}