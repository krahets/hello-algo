/**
 * File: ListNode.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package utils

// [region]{list_node}
/* 链表节点 */
class ListNode(var _val: Int) {
    var next: ListNode? = null // 指向下一节点的引用
// [endregion]{list_node}

    companion object {
        /* 将列表反序列化为链表 */
        fun arrToLinkedList(arr: IntArray): ListNode? {
            val dum = ListNode(0)
            var head = dum
            for (_val in arr) {
                head.next = ListNode(_val)
                head = head.next!!
            }
            return dum.next
        }
    }
// [region]{list_node_end}
}
// [endregion]{list_node_end}
