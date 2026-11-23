/**
 * File: linked_list.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_array_and_linkedlist

import utils.ListNode
import utils.printLinkedList

/* 연결 리스트의 노드 n0 뒤에 노드 P 삽입 */
fun insert(n0: ListNode?, p: ListNode?) {
    val n1 = n0?.next
    p?.next = n1
    n0?.next = p
}

/* 연결 리스트의 노드 n0 바로 뒤에 있는 노드 삭제 */
fun remove(n0: ListNode?) {
    if (n0?.next == null)
        return
    // n0 -> P -> n1
    val p = n0.next
    val n1 = p?.next
    n0.next = n1
}

/* 연결 리스트에서 인덱스가 index인 노드에 접근 */
fun access(head: ListNode?, index: Int): ListNode? {
    var h = head
    for (i in 0..<index) {
        if (h == null)
            return null
        h = h.next
    }
    return h
}

/* 연결 리스트에서 값이 target인 첫 번째 노드 탐색 */
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

/* 실행 코드 */
fun main() {
    /* 연결 리스트 초기화 */
    // 각 노드를 초기화한다
    val n0 = ListNode(1)
    val n1 = ListNode(3)
    val n2 = ListNode(2)
    val n3 = ListNode(5)
    val n4 = ListNode(4)

    // 노드 사이의 참조를 설정한다
    n0.next = n1
    n1.next = n2
    n2.next = n3
    n3.next = n4
    println("초기화한 연결 리스트")
    printLinkedList(n0)

    /* 노드 삽입 */
    insert(n0, ListNode(0))
    println("노드를 삽입한 후의 연결 리스트")
    printLinkedList(n0)

    /* 노드 삭제 */
    remove(n0)
    println("노드를 삭제한 후의 연결 리스트")
    printLinkedList(n0)

    /* 노드 접근 */
    val node = access(n0, 3)!!
    println("연결 리스트에서 인덱스 3에 있는 노드의 값 = ${node._val}")

    /* 노드 탐색 */
    val index = find(n0, 2)
    println("연결 리스트에서 값이 2인 노드의 인덱스 = $index")
}