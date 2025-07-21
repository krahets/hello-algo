/**
 * File: list_node.cj
 * Created Time: 2025-06-23
 * Author: jan_huber (jan_huber@163.com)
 */

package cangjie.utils

/* 链表节点 */
public class ListNode {
    public var val: Int64
    public var next: ?ListNode

    /* 初始化 */
    public ListNode(x: Int64) {
        this.val = x
        this.next = None
    }

    /* 将列表反序列化为链表 */
    public static func arrToLinkedList(arr: Array<Int64>): ?ListNode {
        let dum = ListNode(0)
        var head: ?ListNode = dum
        for (val in arr) {
            head?.next = ListNode(val)
            head = head?.next ?? None
        }
        return dum.next
    }
}
