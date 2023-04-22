/**
 * File: ListNode.js
 * Created Time: 2022-12-12
 * Author: IsChristina (christinaxia77@foxmail.com)
 */

/**
 * Definition for a singly-linked list node
 */
class ListNode {
    val;
    next;
    constructor(val, next) {
        this.val = val === undefined ? 0 : val;
        this.next = next === undefined ? null : next;
    }
}

/**
 * Generate a linked list with an array
 * @param arr
 * @return
 */
function arrToLinkedList(arr) {
    const dum = new ListNode(0);
    let head = dum;
    for (const val of arr) {
        head.next = new ListNode(val);
        head = head.next;
    }
    return dum.next;
}

/**
 * Get a list node with specific value from a linked list
 * @param head
 * @param val
 * @return
 */
function getListNode(head, val) {
    while (head !== null && head.val !== val) {
        head = head.next;
    }
    return head;
}

module.exports = {
    ListNode,
    arrToLinkedList,
    getListNode,
};
