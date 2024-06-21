/**
 * File: ListNode.js
 * Created Time: 2022-12-12
 * Author: IsChristina (christinaxia77@foxmail.com)
 */

/* 鏈結串列節點 */
class ListNode {
    val; // 節點值
    next; // 指向下一節點的引用（指標）
    constructor(val, next) {
        this.val = val === undefined ? 0 : val;
        this.next = next === undefined ? null : next;
    }
}

/* 將串列反序列化為鏈結串列 */
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
