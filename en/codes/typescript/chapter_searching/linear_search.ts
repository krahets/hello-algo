/**
 * File: linear_search.ts
 * Created Time: 2023-01-07
 * Author: Daniel (better.sunjian@gmail.com)
 */

import { ListNode, arrToLinkedList } from '../modules/ListNode';

/* Linear search in an array*/
function linearSearchArray(nums: number[], target: number): number {
    // Traverse the array
    for (let i = 0; i < nums.length; i++) {
        // Found the target. Return its index
        if (nums[i] === target) {
            return i;
        }
    }
    // Target not found. Return -1
    return -1;
}

/* Linear search in a linked list*/
function linearSearchLinkedList(
    head: ListNode | null,
    target: number
): ListNode | null {
    // Traverse the linked list
    while (head) {
        // Found the target node. Return it
        if (head.val === target) {
            return head;
        }
        head = head.next;
    }
    // Target node not found. Return null
    return null;
}

/* Driver code */
const target = 3;

/* Run linear search on the array */
const nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8];
const index = linearSearchArray(nums, target);
console.log('Index of target 3 =', index);

/* Run linear search on the linked list */
const head = arrToLinkedList(nums);
const node = linearSearchLinkedList(head, target);
console.log('Node object for target value 3 =', node);

export {};
