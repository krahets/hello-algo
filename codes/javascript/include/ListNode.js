/*
 * File: ListNode.js
 * Created Time: 2022-12-12
 * Author: Justin (xiefahit@gmail.com)
 */

/**
 * Definition for a singly-linked list node
 */
class ListNode {
    constructor(val, next) {
        this.val = val === undefined ? 0 : val;
        this.next = next === undefined ? null : next;
    }
}

module.exports = ListNode;
