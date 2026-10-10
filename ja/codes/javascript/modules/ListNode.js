/**
 * File: ListNode.js
 * Created Time: 2022-12-12
 * Author: IsChristina (christinaxia77@foxmail.com)
 */

/* 連結リストノード */
class ListNode {
    val; // ノード値
    next; // 次のノードを指す参照（ポインタ）
    constructor(val, next) {
        this.val = val === undefined ? 0 : val;
        this.next = next === undefined ? null : next;
    }
}

/* リストを連結リストにデシリアライズする */
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
