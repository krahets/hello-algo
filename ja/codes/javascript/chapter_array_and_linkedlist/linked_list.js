/**
 * File: linked_list.js
 * Created Time: 2022-12-12
 * Author: IsChristina (christinaxia77@foxmail.com), Justin (xiefahit@gmail.com)
 */

const { printLinkedList } = require('../modules/PrintUtil');
const { ListNode } = require('../modules/ListNode');

/* 連結リストのノード n0 の直後にノード P を挿入する */
function insert(n0, P) {
    const n1 = n0.next;
    P.next = n1;
    n0.next = P;
}

/* 連結リストのノード n0 の直後のノードを削除する */
function remove(n0) {
    if (!n0.next) return;
    // n0 -> P -> n1
    const P = n0.next;
    const n1 = P.next;
    n0.next = n1;
}

/* 連結リストのインデックス index にあるノードにアクセスする */
function access(head, index) {
    for (let i = 0; i < index; i++) {
        if (!head) {
            return null;
        }
        head = head.next;
    }
    return head;
}

/* 連結リストから値が target である最初のノードを探索する */
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

/* 実行用コード */
/* 連結リストを初期化する */
// 各ノードを初期化する
const n0 = new ListNode(1);
const n1 = new ListNode(3);
const n2 = new ListNode(2);
const n3 = new ListNode(5);
const n4 = new ListNode(4);
// ノード間の参照を設定する
n0.next = n1;
n1.next = n2;
n2.next = n3;
n3.next = n4;
console.log('初期化した連結リスト');
printLinkedList(n0);

/* ノードを挿入する */
insert(n0, new ListNode(0));
console.log('ノードを挿入した後の連結リスト');
printLinkedList(n0);

/* ノードを削除する */
remove(n0);
console.log('ノードを削除した後の連結リスト');
printLinkedList(n0);

/* ノードにアクセスする */
const node = access(n0, 3);
console.log('連結リストのインデックス 3 にあるノードの値 = ' + node.val);

/* ノードを探索する */
const index = find(n0, 2);
console.log('連結リスト内で値が 2 であるノードのインデックス = ' + index);
