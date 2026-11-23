/**
 * File: linked_list.swift
 * Created Time: 2023-01-08
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* 연결 리스트의 노드 n0 뒤에 노드 P 삽입 */
func insert(n0: ListNode, P: ListNode) {
    let n1 = n0.next
    P.next = n1
    n0.next = P
}

/* 연결 리스트의 노드 n0 바로 뒤에 있는 노드 삭제 */
func remove(n0: ListNode) {
    if n0.next == nil {
        return
    }
    // n0 -> P -> n1
    let P = n0.next
    let n1 = P?.next
    n0.next = n1
}

/* 연결 리스트에서 인덱스가 index인 노드에 접근 */
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

/* 연결 리스트에서 값이 target인 첫 번째 노드 탐색 */
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
    /* 실행 코드 */
    static func main() {
        /* 연결 리스트 초기화 */
        // 각 노드를 초기화한다
        let n0 = ListNode(x: 1)
        let n1 = ListNode(x: 3)
        let n2 = ListNode(x: 2)
        let n3 = ListNode(x: 5)
        let n4 = ListNode(x: 4)
        // 노드 사이의 참조를 설정한다
        n0.next = n1
        n1.next = n2
        n2.next = n3
        n3.next = n4
        print("초기화한 연결 리스트")
        PrintUtil.printLinkedList(head: n0)

        /* 노드 삽입 */
        insert(n0: n0, P: ListNode(x: 0))
        print("노드를 삽입한 후의 연결 리스트")
        PrintUtil.printLinkedList(head: n0)

        /* 노드 삭제 */
        remove(n0: n0)
        print("노드를 삭제한 후의 연결 리스트")
        PrintUtil.printLinkedList(head: n0)

        /* 노드 접근 */
        let node = access(head: n0, index: 3)
        print("연결 리스트에서 인덱스 3에 있는 노드의 값 = \(node!.val)")

        /* 노드 탐색 */
        let index = find(head: n0, target: 2)
        print("연결 리스트에서 값이 2인 노드의 인덱스 = \(index)")
    }
}
