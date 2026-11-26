/**
 * File: hashing_search.js
 * Created Time: 2022-12-29
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

const { arrToLinkedList } = require('../modules/ListNode');

/* Hash lookup in an array */
function hashingSearchArray(map, target) {
    // Hash table key: target element, value: index
    // Return -1 if the key is absent
    return map.has(target) ? map.get(target) : -1;
}

/* Hash lookup in a linked list */
function hashingSearchLinkedList(map, target) {
    // Hash table key: target node value, value: node object
    // Return null if the key is absent
    return map.has(target) ? map.get(target) : null;
}

/* Driver code */
const target = 3;

/* Hash lookup in an array */
const nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8];
// Initialize the hash table
const map = new Map();
for (let i = 0; i < nums.length; i++) {
    map.set(nums[i], i); // key: element, value: index
}
const index = hashingSearchArray(map, target);
console.log('Index of target 3 = ' + index);

/* Hash lookup in a linked list */
let head = arrToLinkedList(nums);
// Initialize the hash table
const map1 = new Map();
while (head != null) {
    map1.set(head.val, head); // key: node value, value: node
    head = head.next;
}
const node = hashingSearchLinkedList(map1, target);
console.log('Node object for target value 3 =', node);
