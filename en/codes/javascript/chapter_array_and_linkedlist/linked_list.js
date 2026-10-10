/**
 * File: linked_list.js
 * Created Time: 2022-12-12
 * Author: IsChristina (christinaxia77@foxmail.com), Justin (xiefahit@gmail.com)
 */

const { printLinkedList } = require('../modules/PrintUtil');
const { ListNode } = require('../modules/ListNode');

/* Insert node P after node n0 in the linked list */
function insert(n0, P) {
    const n1 = n0.next;
    P.next = n1;
    n0.next = P;
}

/* Remove the first node after node n0 in the linked list */
function remove(n0) {
    if (!n0.next) return;
    // n0 -> P -> n1
    const P = n0.next;
    const n1 = P.next;
    n0.next = n1;
}

/* Access the node at index index in the linked list */
function access(head, index) {
    for (let i = 0; i < index; i++) {
        if (!head) {
            return null;
        }
        head = head.next;
    }
    return head;
}

/* Find the first node with value target in the linked list */
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
/* Initialize linked list */
// Initialize each node
const n0 = new ListNode(1);
const n1 = new ListNode(3);
const n2 = new ListNode(2);
const n3 = new ListNode(5);
const n4 = new ListNode(4);
// Build references between nodes
n0.next = n1;
n1.next = n2;
n2.next = n3;
n3.next = n4;
console.log('Initialized linked list is');
printLinkedList(n0);

/* Insert node */
insert(n0, new ListNode(0));
console.log('Linked list after inserting node is');
printLinkedList(n0);

/* Remove node */
remove(n0);
console.log('Linked list after removing node is');
printLinkedList(n0);

/* Access node */
const node = access(n0, 3);
console.log('Value of node at index 3 in linked list = ' + node.val);

/* Search node */
const index = find(n0, 2);
console.log('Index of node with value 2 in linked list = ' + index);
