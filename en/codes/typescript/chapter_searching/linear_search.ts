/**
 * File: linear_search.ts
 * Created Time: 2023-01-07
 * Author: Daniel (better.sunjian@gmail.com)
 */

import { ListNode, arrToLinkedList } from '../modules/ListNode';

/* Linear search (array)*/
function linearSearchArray(nums: number[], target: number): number {
    // Traverse array
    for (let i = 0; i < nums.length; i++) {
        // Found the target element, thus return its index
        if (nums[i] === target) {
            return i;
        }
    }
    // Did not find the target element, thus return -1
    return -1;
}

/* Linear search (linked list)*/
function linearSearchLinkedList(
    head: ListNode | null,
    target: number
): ListNode | null {
    // Traverse the list
    while (head) {
        // Found the target node, return it
        if (head.val === target) {
            return head;
        }
        head = head.next;
    }
    // If the target node is not found, return null
    return null;
}

/* Driver Code */
const target = 3;

/* Perform linear search in array */
const nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8];
const index = linearSearchArray(nums, target);
console.log('Index of target element 3 =', index);

/* Perform linear search in linked list */
const head = arrToLinkedList(nums);
const node = linearSearchLinkedList(head, target);
console.log('Target node value 3's corresponding node object is', node);

export {};
