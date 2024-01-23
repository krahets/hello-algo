package utils

class ListNode(var value:Int) {
    var next:ListNode? = null

    /* Generate a linked list with an array */
    fun arrToLinkedList(arr:IntArray): ListNode? {
        val dum = ListNode(0)
        var head = dum
        for (value in arr) {
            head.next = ListNode(value)
            head = head.next!!
        }
        return dum.next
    }

    /* Get a list node with specific value from a linked list */
    fun getListNode(h: ListNode, value: Int): ListNode {
        var head =h
        while (head.value != value) {
            head = head.next!!
        }
        return head
    }
}