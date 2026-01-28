/**
 * File: linear_search.js
 * Created Time: 2022-12-22
 * Author: JoseHung (szhong@link.cuhk.edu.hk)
 */

const { ListNode, arrToLinkedList } = require('../modules/ListNode');

/* Linear search (array) */
function linearSearchArray(nums, target) {
    // Traverse array
    for (let i = 0; i < nums.length; i++) {
        // Found the target element, return its index
        if (nums[i] === target) {
            return i;
        }
    }
    // Target element not found, return -1
    return -1;
}

/* Linear search (linked list) */
function linearSearchLinkedList(head, target) {
    // Traverse the linked list
    while (head) {
        // Found the target node, return it
        if (head.val === target) {
            return head;
        }
        head = head.next;
    }
    // Target node not found, return null
    return null;
}

/* Driver Code */
const target = 3;

/* Perform linear search in array */
const nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8];
const index = linearSearchArray(nums, target);
console.log('Index of target element 3 = ' + index);

/* Perform linear search in linked list */
const head = arrToLinkedList(nums);
const node = linearSearchLinkedList(head, target);
console.log('Node object corresponding to target node value 3 is ', node);
