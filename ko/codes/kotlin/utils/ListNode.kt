/**
 * File: ListNode.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package utils

/* 연결 리스트 노드 */
class ListNode(var _val: Int) {
    var next: ListNode? = null

    companion object {
        /* 리스트를 연결 리스트로 역직렬화 */
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
}