/**
 * File: linear_search.ts
 * Created Time: 2023-01-07
 * Author: Daniel (better.sunjian@gmail.com)
 */

import { ListNode, arrToLinkedList } from '../modules/ListNode';

/* Linear search (array)*/
function linearSearchArray(nums: number[], target: number): number {
    // Traverse the array
    for (let i = 0; i < nums.length; i++) {
        // The target element was found; return its index
        if (nums[i] === target) {
            return i;
        }
    }
    // The target element was not found; return -1
    return -1;
}

/* Linear search (linked list)*/
function linearSearchLinkedList(
    head: ListNode | null,
    target: number
): ListNode | null {
    // Traverse the linked list
    while (head) {
        // The target node was found; return it
        if (head.val === target) {
            return head;
        }
        head = head.next;
    }
    // Target node not found; return null
    return null;
}

/* Driver code */
const target = 3;

/* Perform linear search on the array */
const nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8];
const index = linearSearchArray(nums, target);
console.log('Index of target element 3 =', index);

/* Perform linear search on the linked list */
const head = arrToLinkedList(nums);
const node = linearSearchLinkedList(head, target);
console.log('The node object corresponding to target value 3 is', node);

export {};
