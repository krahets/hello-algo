/**
 * File: linear_search.js
 * Created Time: 2022-12-22
 * Author: JoseHung (szhong@link.cuhk.edu.hk)
 */

const { ListNode, arrToLinkedList } = require('../modules/ListNode');

/* 線性查詢（陣列） */
function linearSearchArray(nums, target) {
    // 走訪陣列
    for (let i = 0; i < nums.length; i++) {
        // 找到目標元素，返回其索引
        if (nums[i] === target) {
            return i;
        }
    }
    // 未找到目標元素，返回 -1
    return -1;
}

/* 線性查詢（鏈結串列）*/
function linearSearchLinkedList(head, target) {
    // 走訪鏈結串列
    while (head) {
        // 找到目標節點，返回之
        if (head.val === target) {
            return head;
        }
        head = head.next;
    }
    // 未找到目標節點，返回 null
    return null;
}

/* Driver Code */
const target = 3;

/* 在陣列中執行線性查詢 */
const nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8];
const index = linearSearchArray(nums, target);
console.log('目標元素 3 的索引 = ' + index);

/* 在鏈結串列中執行線性查詢 */
const head = arrToLinkedList(nums);
const node = linearSearchLinkedList(head, target);
console.log('目標節點值 3 的對應節點物件為 ', node);
