/**
 * File: hashing_search.js
 * Created Time: 2022-12-29
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

const { arrToLinkedList } = require('../modules/ListNode');

/* 雜湊查詢（陣列） */
function hashingSearchArray(map, target) {
    // 雜湊表的 key: 目標元素，value: 索引
    // 若雜湊表中無此 key ，返回 -1
    return map.has(target) ? map.get(target) : -1;
}

/* 雜湊查詢（鏈結串列） */
function hashingSearchLinkedList(map, target) {
    // 雜湊表的 key: 目標節點值，value: 節點物件
    // 若雜湊表中無此 key ，返回 null
    return map.has(target) ? map.get(target) : null;
}

/* Driver Code */
const target = 3;

/* 雜湊查詢（陣列） */
const nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8];
// 初始化雜湊表
const map = new Map();
for (let i = 0; i < nums.length; i++) {
    map.set(nums[i], i); // key: 元素，value: 索引
}
const index = hashingSearchArray(map, target);
console.log('目標元素 3 的索引 = ' + index);

/* 雜湊查詢（鏈結串列） */
let head = arrToLinkedList(nums);
// 初始化雜湊表
const map1 = new Map();
while (head != null) {
    map1.set(head.val, head); // key: 節點值，value: 節點
    head = head.next;
}
const node = hashingSearchLinkedList(map1, target);
console.log('目標節點值 3 的對應節點物件為', node);
