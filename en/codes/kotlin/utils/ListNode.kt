/**
 * File: ListNode.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package utils

// [region]{list_node}
/* Linked list node */
class ListNode(var _val: Int) {
    var next: ListNode? = null // Reference to the next node
// [endregion]{list_node}

    companion object {
        /* Deserialize an array into a linked list */
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
