/**
 * File: hashing_search.js
 * Created Time: 2022-12-29
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

const { arrToLinkedList } = require('../modules/ListNode');

/* Hash-based search (array) */
function hashingSearchArray(map, target) {
    // Hash table key: target element; value: index
    // Return -1 if the hash table does not contain this key
    return map.has(target) ? map.get(target) : -1;
}

/* Hash-based search (linked list) */
function hashingSearchLinkedList(map, target) {
    // Hash table key: target node value; value: node object
    // Return null if this key is absent from the hash table
    return map.has(target) ? map.get(target) : null;
}

/* Driver code */
const target = 3;

/* Hash-based search (array) */
const nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8];
// Initialize the hash table
const map = new Map();
for (let i = 0; i < nums.length; i++) {
    map.set(nums[i], i); // key: element; value: index
}
const index = hashingSearchArray(map, target);
console.log('Index of target element 3 = ' + index);

/* Hash-based search (linked list) */
let head = arrToLinkedList(nums);
// Initialize the hash table
const map1 = new Map();
while (head != null) {
    map1.set(head.val, head); // key: node value; value: node
    head = head.next;
}
const node = hashingSearchLinkedList(map1, target);
console.log('The node object corresponding to target value 3 is', node);
