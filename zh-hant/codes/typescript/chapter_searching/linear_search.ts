/**
 * File: linear_search.ts
 * Created Time: 2023-01-07
 * Author: Daniel (better.sunjian@gmail.com)
 */

import { ListNode, arrToLinkedList } from '../modules/ListNode';

/* 循序搜尋（陣列）*/
function linearSearchArray(nums: number[], target: number): number {
    // 走訪陣列
    for (let i = 0; i < nums.length; i++) {
        // 找到目標元素，回傳其索引
        if (nums[i] === target) {
            return i;
        }
    }
    // 找不到目標元素，回傳 -1
    return -1;
}

/* 循序搜尋（鏈結串列）*/
function linearSearchLinkedList(
    head: ListNode | null,
    target: number
): ListNode | null {
    // 走訪鏈結串列
    while (head) {
        // 找到目標節點，回傳該節點
        if (head.val === target) {
            return head;
        }
        head = head.next;
    }
    // 找不到目標節點，回傳 null
    return null;
}

/* 主程式 */
const target = 3;

/* 在陣列中執行循序搜尋 */
const nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8];
const index = linearSearchArray(nums, target);
console.log('目標元素 3 的索引 =', index);

/* 在鏈結串列中執行循序搜尋 */
const head = arrToLinkedList(nums);
const node = linearSearchLinkedList(head, target);
console.log('目標值 3 對應的節點物件為', node);

export {};
