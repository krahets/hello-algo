/**
 * File: hashing_search.js
 * Created Time: 2022-12-29
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

const { arrToLinkedList } = require('../modules/ListNode');

/* 哈希查找（数组） */
function hashingSearchArray(map, target) {
    // 哈希表的 key: 目标元素，value: 索引
    // 若哈希表中无此 key ，返回 -1
    return map.has(target) ? map.get(target) : -1;
}

/* 哈希查找（链表） */
function hashingSearchLinkedList(map, target) {
    // 哈希表的 key: 目标节点值，value: 节点对象
    // 若哈希表中无此 key ，返回 null
    return map.has(target) ? map.get(target) : null;
}

/* Driver Code */
const target = 3;

/* 哈希查找（数组） */
const nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8];
// 初始化哈希表
const map = new Map();
for (let i = 0; i < nums.length; i++) {
    map.set(nums[i], i); // key: 元素，value: 索引
}
const index = hashingSearchArray(map, target);
console.log('目标元素 3 的索引 = ' + index);

/* 哈希查找（链表） */
let head = arrToLinkedList(nums);
// 初始化哈希表
const map1 = new Map();
while (head != null) {
    map1.set(head.val, head); // key: 节点值，value: 节点
    head = head.next;
}
const node = hashingSearchLinkedList(map1, target);
console.log('目标节点值 3 的对应节点对象为', node);
