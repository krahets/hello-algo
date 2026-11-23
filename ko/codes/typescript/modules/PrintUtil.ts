/**
 * File: PrintUtil.ts
 * Created Time: 2022-12-13
 * Author: Justin (xiefahit@gmail.com)
 */

import { ListNode } from './ListNode';
import { TreeNode, arrToTree } from './TreeNode';

/* 연결 리스트 출력 */
function printLinkedList(head: ListNode | null): void {
    const list: string[] = [];
    while (head !== null) {
        list.push(head.val.toString());
        head = head.next;
    }
    console.log(list.join(' -> '));
}

class Trunk {
    prev: Trunk | null;
    str: string;

    constructor(prev: Trunk | null, str: string) {
        this.prev = prev;
        this.str = str;
    }
}

/**
 * 이진 트리 출력
 * 이 트리 출력 코드는 TECHIE DELIGHT에서 가져왔다
 * https://www.techiedelight.com/c-program-print-binary-tree/
 */
function printTree(root: TreeNode | null) {
    printTreeHelper(root, null, false);
}

/* 이진 트리 출력 */
function printTreeHelper(
    root: TreeNode | null,
    prev: Trunk | null,
    isRight: boolean
) {
    if (root === null) {
        return;
    }

    let prev_str = '    ';
    const trunk = new Trunk(prev, prev_str);

    printTreeHelper(root.right, trunk, true);

    if (prev === null) {
        trunk.str = '———';
    } else if (isRight) {
        trunk.str = '/———';
        prev_str = '   |';
    } else {
        trunk.str = '\\———';
        prev.str = prev_str;
    }

    showTrunks(trunk);
    console.log(' ' + root.val);

    if (prev) {
        prev.str = prev_str;
    }
    trunk.str = '   |';

    printTreeHelper(root.left, trunk, false);
}

function showTrunks(p: Trunk | null) {
    if (p === null) {
        return;
    }

    showTrunks(p.prev);
    process.stdout.write(p.str);
}

/* 힙 출력 */
function printHeap(arr: number[]): void {
    console.log('힙의 배열 표현:');
    console.log(arr);
    console.log('힙의 트리 표현:');
    const root = arrToTree(arr);
    printTree(root);
}

export { printLinkedList, printTree, printHeap };
