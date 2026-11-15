/**
 * File: ListNode.ts
 * Created Time: 2022-12-10
 * Author: Justin (xiefahit@gmail.com)
 */

// [region]{list_node}
/* 연결 리스트 노드 */
class ListNode {
    val: number; // 노드 값
    next: ListNode | null; // 다음 노드를 가리키는 참조
    constructor(val?: number, next?: ListNode | null) {
        this.val = val === undefined ? 0 : val;
        this.next = next === undefined ? null : next;
    }
}
// [endregion]{list_node}

/* 배열을 역직렬화하여 연결 리스트로 변환한다 */
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
