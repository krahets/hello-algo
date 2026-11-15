/**
 * File: ListNode.js
 * Created Time: 2022-12-12
 * Author: IsChristina (christinaxia77@foxmail.com)
 */

/* 연결 리스트 노드 */
class ListNode {
    val; // 노드 값
    next; // 다음 노드를 가리키는 참조(포인터)
    constructor(val, next) {
        this.val = val === undefined ? 0 : val;
        this.next = next === undefined ? null : next;
    }
}

/* 리스트를 연결 리스트로 역직렬화 */
function arrToLinkedList(arr) {
    const dum = new ListNode(0);
    let head = dum;
    for (const val of arr) {
        head.next = new ListNode(val);
        head = head.next;
    }
    return dum.next;
}

module.exports = {
    ListNode,
    arrToLinkedList,
};
