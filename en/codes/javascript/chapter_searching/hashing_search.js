/**
 * File: hashing_search.js
 * Created Time: 2022-12-29
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

const { arrToLinkedList } = require('../modules/ListNode');

/* Hash search (array) */
function hashingSearchArray(map, target) {
    // Hash table's key: target element, value: index
    // If this key does not exist in the hash table, return -1
    return map.has(target) ? map.get(target) : -1;
}

/* Hash search (linked list) */
function hashingSearchLinkedList(map, target) {
    // Hash table key: target node value, value: node object
    // If key is not in hash table, return null
    return map.has(target) ? map.get(target) : null;
}

/* Driver Code */
const target = 3;

/* Hash search (array) */
const nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8];
// Initialize hash table
const map = new Map();
for (let i = 0; i < nums.length; i++) {
    map.set(nums[i], i); // key: element, value: index
}
const index = hashingSearchArray(map, target);
console.log('Index of target element 3 = ' + index);

/* Hash search (linked list) */
let head = arrToLinkedList(nums);
// Initialize hash table
const map1 = new Map();
while (head != null) {
    map1.set(head.val, head); // key: node value, value: node
    head = head.next;
}
const node = hashingSearchLinkedList(map1, target);
console.log('Node object with target value 3 is', node);
