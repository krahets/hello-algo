/**
 * File: linked_list.js
 * Created Time: 2022-12-12
 * Author: IsChristina (christinaxia77@foxmail.com), Justin (xiefahit@gmail.com)
 */

const { printLinkedList } = require('../modules/PrintUtil');
const { ListNode } = require('../modules/ListNode');

/* 在鏈結串列的節點 n0 之後插入節點 P */
function insert(n0, P) {
    const n1 = n0.next;
    P.next = n1;
    n0.next = P;
}

/* 刪除鏈結串列的節點 n0 之後的首個節點 */
function remove(n0) {
    if (!n0.next) return;
    // n0 -> P -> n1
    const P = n0.next;
    const n1 = P.next;
    n0.next = n1;
}

/* 訪問鏈結串列中索引為 index 的節點 */
function access(head, index) {
    for (let i = 0; i < index; i++) {
        if (!head) {
            return null;
        }
        head = head.next;
    }
    return head;
}

/* 在鏈結串列中查詢值為 target 的首個節點 */
function find(head, target) {
    let index = 0;
    while (head !== null) {
        if (head.val === target) {
            return index;
        }
        head = head.next;
        index += 1;
    }
    return -1;
}

/* Driver Code */
/* 初始化鏈結串列 */
// 初始化各個節點
const n0 = new ListNode(1);
const n1 = new ListNode(3);
const n2 = new ListNode(2);
const n3 = new ListNode(5);
const n4 = new ListNode(4);
// 構建節點之間的引用
n0.next = n1;
n1.next = n2;
n2.next = n3;
n3.next = n4;
console.log('初始化的鏈結串列為');
printLinkedList(n0);

/* 插入節點 */
insert(n0, new ListNode(0));
console.log('插入節點後的鏈結串列為');
printLinkedList(n0);

/* 刪除節點 */
remove(n0);
console.log('刪除節點後的鏈結串列為');
printLinkedList(n0);

/* 訪問節點 */
const node = access(n0, 3);
console.log('鏈結串列中索引 3 處的節點的值 = ' + node.val);

/* 查詢節點 */
const index = find(n0, 2);
console.log('鏈結串列中值為 2 的節點的索引 = ' + index);
