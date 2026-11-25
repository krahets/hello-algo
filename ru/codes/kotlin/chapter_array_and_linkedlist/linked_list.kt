/**
 * File: linked_list.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_array_and_linkedlist

import utils.ListNode
import utils.printLinkedList

/* Вставить узел P после узла n0 */
fun insert(n0: ListNode?, p: ListNode?) {
    val n1 = n0?.next
    p?.next = n1
    n0?.next = p
}

/* Удалить первый узел, следующий за n0 */
fun remove(n0: ListNode?) {
    if (n0?.next == null)
        return
    // n0 -> P -> n1
    val p = n0.next
    val n1 = p?.next
    n0.next = n1
}

/* Получить узел списка по индексу index */
fun access(head: ListNode?, index: Int): ListNode? {
    var h = head
    for (i in 0..<index) {
        if (h == null)
            return null
        h = h.next
    }
    return h
}

/* Найти первый узел списка со значением target */
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

/* Демонстрационный код */
fun main() {
    /* Инициализация связного списка */
    // Инициализировать узлы
    val n0 = ListNode(1)
    val n1 = ListNode(3)
    val n2 = ListNode(2)
    val n3 = ListNode(5)
    val n4 = ListNode(4)

    // Связать узлы ссылками
    n0.next = n1
    n1.next = n2
    n2.next = n3
    n3.next = n4
    println("Исходный связный список:")
    printLinkedList(n0)

    /* Вставка узла */
    insert(n0, ListNode(0))
    println("Связный список после вставки:")
    printLinkedList(n0)

    /* Удаление узла */
    remove(n0)
    println("Связный список после удаления:")
    printLinkedList(n0)

    /* Доступ к узлу */
    val node = access(n0, 3)!!
    println("Значение узла по индексу 3 = ${node._val}")

    /* Поиск узла */
    val index = find(n0, 2)
    println("Индекс узла со значением 2 = $index")
}