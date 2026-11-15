/**
 * File: ListNode.ts
 * Created Time: 2022-12-10
 * Author: Justin (xiefahit@gmail.com)
 */

// [region]{list_node}
/* Linked list node */
class ListNode {
    val: number; // Node value
    next: ListNode | null; // Reference to the next node
    constructor(val?: number, next?: ListNode | null) {
        this.val = val === undefined ? 0 : val;
        this.next = next === undefined ? null : next;
    }
}
// [endregion]{list_node}

/* Deserialize an array into a linked list */
function arrToLinkedList(arr: number[]): ListNode | null {
    const dum: ListNode = new ListNode(0);
    let head = dum;
    for (const val of arr) {
        head.next = new ListNode(val);
        head = head.next;
    }
    return dum.next;
}

export { ListNode, arrToLinkedList };
