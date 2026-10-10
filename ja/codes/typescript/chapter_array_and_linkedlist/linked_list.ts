/**
 * File: linked_list.ts
 * Created Time: 2022-12-10
 * Author: Justin (xiefahit@gmail.com)
 */

import { ListNode } from '../modules/ListNode';
import { printLinkedList } from '../modules/PrintUtil';

/* 連結リストでノード n0 の後ろにノード P を挿入する */
function insert(n0: ListNode, P: ListNode): void {
    const n1 = n0.next;
    P.next = n1;
    n0.next = P;
}

/* 連結リストでノード n0 の直後のノードを削除する */
function remove(n0: ListNode): void {
    if (!n0.next) {
        return;
    }
    // n0 -> P -> n1
    const P = n0.next;
    const n1 = P.next;
    n0.next = n1;
}

/* 連結リスト内で index 番目のノードにアクセス */
function access(head: ListNode | null, index: number): ListNode | null {
    for (let i = 0; i < index; i++) {
        if (!head) {
            return null;
        }
        head = head.next;
    }
    return head;
}

/* 連結リストで値が target の最初のノードを探す */
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
/* 連結リストを初期化 */
// 各ノードを初期化
const n0 = new ListNode(1);
const n1 = new ListNode(3);
const n2 = new ListNode(2);
const n3 = new ListNode(5);
const n4 = new ListNode(4);
// ノード間の参照を構築する
n0.next = n1;
n1.next = n2;
n2.next = n3;
n3.next = n4;
console.log('初期化された連結リストは');
printLinkedList(n0);

/* ノードを挿入 */
insert(n0, new ListNode(0));
console.log('ノード挿入後の連結リストは');
printLinkedList(n0);

/* ノードを削除 */
remove(n0);
console.log('ノード削除後の連結リストは');
printLinkedList(n0);

/* ノードにアクセス */
const node = access(n0, 3);
console.log(`連結リストのインデックス 3 にあるノードの値 = ${node?.val}`);

/* ノードを探索 */
const index = find(n0, 2);
console.log(`連結リスト内で値が 2 のノードのインデックス = ${index}`);

export {};
