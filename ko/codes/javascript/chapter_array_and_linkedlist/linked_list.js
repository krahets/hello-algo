/**
 * File: linked_list.js
 * Created Time: 2022-12-12
 * Author: IsChristina (christinaxia77@foxmail.com), Justin (xiefahit@gmail.com)
 */

const { printLinkedList } = require('../modules/PrintUtil');
const { ListNode } = require('../modules/ListNode');

/* 연결 리스트의 노드 n0 뒤에 노드 P 삽입 */
function insert(n0, P) {
    const n1 = n0.next;
    P.next = n1;
    n0.next = P;
}

/* 연결 리스트의 노드 n0 바로 뒤에 있는 노드 삭제 */
function remove(n0) {
    if (!n0.next) return;
    // n0 -> P -> n1
    const P = n0.next;
    const n1 = P.next;
    n0.next = n1;
}

/* 연결 리스트에서 인덱스가 index인 노드에 접근 */
function access(head, index) {
    for (let i = 0; i < index; i++) {
        if (!head) {
            return null;
        }
        head = head.next;
    }
    return head;
}

/* 연결 리스트에서 값이 target인 첫 번째 노드 탐색 */
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

/* 실행 코드 */
/* 연결 리스트 초기화 */
// 각 노드를 초기화한다
const n0 = new ListNode(1);
const n1 = new ListNode(3);
const n2 = new ListNode(2);
const n3 = new ListNode(5);
const n4 = new ListNode(4);
// 노드 사이의 참조를 설정한다
n0.next = n1;
n1.next = n2;
n2.next = n3;
n3.next = n4;
console.log('초기화한 연결 리스트');
printLinkedList(n0);

/* 노드 삽입 */
insert(n0, new ListNode(0));
console.log('노드를 삽입한 후의 연결 리스트');
printLinkedList(n0);

/* 노드 삭제 */
remove(n0);
console.log('노드를 삭제한 후의 연결 리스트');
printLinkedList(n0);

/* 노드 접근 */
const node = access(n0, 3);
console.log('연결 리스트에서 인덱스 3에 있는 노드의 값 = ' + node.val);

/* 노드 탐색 */
const index = find(n0, 2);
console.log('연결 리스트에서 값이 2인 노드의 인덱스 = ' + index);
