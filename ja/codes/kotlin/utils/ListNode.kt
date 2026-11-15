/**
 * File: ListNode.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package utils

// [region]{list_node}
/* 連結リストのノード */
class ListNode(var _val: Int) {
    var next: ListNode? = null // 次のノードへの参照
// [endregion]{list_node}

    companion object {
        /* リストをデシリアライズして連結リストにする */
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
