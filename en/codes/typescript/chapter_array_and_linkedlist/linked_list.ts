/**
 * File: linked_list.ts
 * Created Time: 2022-12-10
 * Author: Justin (xiefahit@gmail.com)
 */

import { ListNode } from '../modules/ListNode';
import { printLinkedList } from '../modules/PrintUtil';

/* Insert node P after node n0 in the linked list */
function insert(n0: ListNode, P: ListNode): void {
    const n1 = n0.next;
    P.next = n1;
    n0.next = P;
}

/* Remove the first node after node n0 in the linked list */
function remove(n0: ListNode): void {
    if (!n0.next) {
        return;
    }
    // n0 -> P -> n1
    const P = n0.next;
    const n1 = P.next;
    n0.next = n1;
}

/* Access the node at `index` in the linked list */
function access(head: ListNode | null, index: number): ListNode | null {
    for (let i = 0; i < index; i++) {
        if (!head) {
            return null;
        }
        head = head.next;
    }
    return head;
}

/* Search for the first node with value target in the linked list */
function find(head: ListNode | null, target: number): number {
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
console.log('The initialized linked list is');
printLinkedList(n0);

/* Insert node */
insert(n0, new ListNode(0));
console.log('Linked list after inserting the node is');
printLinkedList(n0);

/* Remove node */
remove(n0);
console.log('Linked list after removing the node is');
printLinkedList(n0);

/* Access node */
const node = access(n0, 3);
console.log(`链表中索引 3 处的节点的值 = ${node?.val}`);

/* Search node */
const index = find(n0, 2);
console.log(`链表中值为 2 的节点的索引 = ${index}`);

export {};
