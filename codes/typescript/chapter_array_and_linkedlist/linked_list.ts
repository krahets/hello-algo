/**
 * File: linked_list.ts
 * Created Time: 2022-12-10
 * Author: Justin (xiefahit@gmail.com)
 */

import ListNode from '../module/ListNode';
import { printLinkedList } from '../module/PrintUtil';

/* 在链表的结点 n0 之后插入结点 P */
function insert(n0: ListNode, P: ListNode): void {
    const n1 = n0.next;
    n0.next = P;
    P.next = n1;
}

/* 删除链表的结点 n0 之后的首个结点 */
function remove(n0: ListNode): void {
    if (!n0.next) {
        return;
    }
    // n0 -> P -> n1
    const P = n0.next;
    const n1 = P.next;
    n0.next = n1;
}

/* 访问链表中索引为 index 的结点 */
function access(head: ListNode | null, index: number): ListNode | null {
    for (let i = 0; i < index; i++) {
        if (!head) {
            return null;
        }
        head = head.next;
    }
    return head;
}

/* 在链表中查找值为 target 的首个结点 */
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
/* 初始化链表 */
// 初始化各个结点
const n0 = new ListNode(1);
const n1 = new ListNode(3);
const n2 = new ListNode(2);
const n3 = new ListNode(5);
const n4 = new ListNode(4);
// 构建引用指向
n0.next = n1;
n1.next = n2;
n2.next = n3;
n3.next = n4;
console.log('初始化的链表为');
printLinkedList(n0);

/* 插入结点 */
insert(n0, new ListNode(0));
console.log('插入结点后的链表为');
printLinkedList(n0);

/* 删除结点 */
remove(n0);
console.log('删除结点后的链表为');
printLinkedList(n0);

/* 访问结点 */
const node = access(n0, 3);
console.log(`链表中索引 3 处的结点的值 = ${node?.val}`);

/* 查找结点 */
const index = find(n0, 2);
console.log(`链表中值为 2 的结点的索引 = ${index}`);

export {};
