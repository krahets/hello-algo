/**
 * File: ListNode.ts
 * Created Time: 2022-12-10
 * Author: Justin (xiefahit@gmail.com)
 */

/**
 * Definition for a singly-linked list node
 */
export default class ListNode {
    val: number;
    next: ListNode | null;
    constructor(val?: number, next?: ListNode | null) {
        this.val = val === undefined ? 0 : val;
        this.next = next === undefined ? null : next;
    }

    /**
     * Generate a linked list with an array
     * @param arr
     * @return
     */
    arrToLinkedList(arr: number[]): ListNode | null {
        const dum: ListNode = new ListNode(0);
        let head = dum;
        for (const val of arr) {
            head.next = new ListNode(val);
            head = head.next;
        }
        return dum.next;
    }
}
