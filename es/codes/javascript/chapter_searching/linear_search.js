/**
 * File: linear_search.js
 * Created Time: 2022-12-22
 * Author: JoseHung (szhong@link.cuhk.edu.hk)
 */

const { ListNode, arrToLinkedList } = require('../modules/ListNode');

/* 线性查找（数组） */
function linearSearchArray(nums, target) {
    // 遍历数组
    for (let i = 0; i < nums.length; i++) {
        // 找到目标元素，返回其索引
        if (nums[i] === target) {
            return i;
        }
    }
    // 未找到目标元素，返回 -1
    return -1;
}

/* 线性查找（链表）*/
function linearSearchLinkedList(head, target) {
    // 遍历链表
    while (head) {
        // 找到目标节点，返回之
        if (head.val === target) {
            return head;
        }
        head = head.next;
    }
    // 未找到目标节点，返回 null
    return null;
}

/* Driver Code */
const target = 3;

/* 在数组中执行线性查找 */
const nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8];
const index = linearSearchArray(nums, target);
console.log('目标元素 3 的索引 = ' + index);

/* 在链表中执行线性查找 */
const head = arrToLinkedList(nums);
const node = linearSearchLinkedList(head, target);
console.log('目标节点值 3 的对应节点对象为 ', node);
