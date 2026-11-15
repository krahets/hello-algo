/**
 * File: ListNode.ts
 * Created Time: 2022-12-10
 * Author: Justin (xiefahit@gmail.com)
 */

// [region]{list_node}
/* 链表节点 */
class ListNode {
    val: number; // 节点值
    next: ListNode | null; // 指向下一节点的引用
    constructor(val?: number, next?: ListNode | null) {
        this.val = val === undefined ? 0 : val;
        this.next = next === undefined ? null : next;
    }
}
// [endregion]{list_node}

/* 将数组反序列化为链表 */
function arrToLinkedList(arr: number[]): ListNode | null {
    const dum: ListNode = new ListNode(0);
    let head = dum;
    for (const val of arr) {
        head.next = new ListNode(val);
        head = head.next;
    }
    return dum.next;
}

export { ListNode, arrToLinkedList };
