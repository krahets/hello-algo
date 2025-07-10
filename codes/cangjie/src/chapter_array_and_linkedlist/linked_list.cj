/**
 * File: linked_list.cj
 * Created Time: 2025-06-23
 * Author: jan_huber (jan_huber@163.com)
 */
package cangjie.chapter_array_and_linkedlist

import cangjie.utils.ListNode

/* 在链表的节点 n0 之后插入节点 p */
func insert(n0: ListNode, p: ListNode): Unit {
    let n1 = n0.next
    p.next = n1
    n0.next = p
}

/* 删除链表的节点 n0 之后的首个节点 */
func remove(n0: ListNode): Unit {
    if (n0.next.isNone()) {
        return
    }
    // n0 -> P -> n1
    let p = n0.next
    let n1 = p?.next ?? None
    n0.next = n1
}

/* 访问链表中索引为 index 的节点 */
func access(head: ?ListNode, index: Int64): ?ListNode {
    var var_head = head
    for (i in 0..index) {
        if (let Some(h) <- var_head) {
            var_head = h.next
        } else {
            return None
        }
    }
    return var_head
}

/* 在链表中查找值为 target 的首个节点 */
func find(head: ?ListNode, target: Int64): Int64 {
    var index = 0
    var var_head = head
    while (let Some(head) <- var_head) {
        if (head.val == target) {
            return index
        }
        var_head = head.next
        index++
    }
    return -1
}
