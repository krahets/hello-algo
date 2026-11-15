/**
 * File: ListNode.js
 * Created Time: 2022-12-12
 * Author: IsChristina (christinaxia77@foxmail.com)
 */

/* 链表节点 */
class ListNode {
    val; // 节点值
    next; // 指向下一节点的引用（指针）
    constructor(val, next) {
        this.val = val === undefined ? 0 : val;
        this.next = next === undefined ? null : next;
    }
}

/* 将列表反序列化为链表 */
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
