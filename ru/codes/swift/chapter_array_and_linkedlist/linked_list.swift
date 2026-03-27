/**
 * File: linked_list.swift
 * Created Time: 2023-01-08
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* Вставить узел P после узла n0 в связном списке */
func insert(n0: ListNode, P: ListNode) {
    let n1 = n0.next
    P.next = n1
    n0.next = P
}

/* Удалить первый узел после узла n0 в связном списке */
func remove(n0: ListNode) {
    if n0.next == nil {
        return
    }
    // n0 -> P -> n1
    let P = n0.next
    let n1 = P?.next
    n0.next = n1
}

/* Доступ к узлу связного списка по индексу index */
func access(head: ListNode, index: Int) -> ListNode? {
    var head: ListNode? = head
    for _ in 0 ..< index {
        if head == nil {
            return nil
        }
        head = head?.next
    }
    return head
}

/* Найти в связном списке первый узел со значением target */
func find(head: ListNode, target: Int) -> Int {
    var head: ListNode? = head
    var index = 0
    while head != nil {
        if head?.val == target {
            return index
        }
        head = head?.next
        index += 1
    }
    return -1
}

@main
enum LinkedList {
    /* Driver Code */
    static func main() {
        /* Инициализация связного списка */
        // Инициализация всех узлов
        let n0 = ListNode(x: 1)
        let n1 = ListNode(x: 3)
        let n2 = ListNode(x: 2)
        let n3 = ListNode(x: 5)
        let n4 = ListNode(x: 4)
        // Построить ссылки между узлами
        n0.next = n1
        n1.next = n2
        n2.next = n3
        n3.next = n4
        print("Исходный связный список")
        PrintUtil.printLinkedList(head: n0)

        /* Вставка узла */
        insert(n0: n0, P: ListNode(x: 0))
        print("Связный список после вставки узла")
        PrintUtil.printLinkedList(head: n0)

        /* Удаление узла */
        remove(n0: n0)
        print("Связный список после удаления узла")
        PrintUtil.printLinkedList(head: n0)

        /* Доступ к узлу */
        let node = access(head: n0, index: 3)
        print("Значение узла по индексу 3 в связном списке = \(node!.val)")

        /* Поиск узла */
        let index = find(head: n0, target: 2)
        print("Индекс узла со значением 2 в связном списке = \(index)")
    }
}
