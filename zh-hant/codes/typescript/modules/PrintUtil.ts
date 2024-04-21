/**
 * File: PrintUtil.ts
 * Created Time: 2022-12-13
 * Author: Justin (xiefahit@gmail.com)
 */

import { ListNode } from './ListNode';
import { TreeNode, arrToTree } from './TreeNode';

/* 列印鏈結串列 */
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
 * 列印二元樹
 * This tree printer is borrowed from TECHIE DELIGHT
 * https://www.techiedelight.com/c-program-print-binary-tree/
 */
function printTree(root: TreeNode | null) {
    printTreeHelper(root, null, false);
}

/* 列印二元樹 */
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

/* 列印堆積 */
function printHeap(arr: number[]): void {
    console.log('堆積的陣列表示：');
    console.log(arr);
    console.log('堆積的樹狀表示：');
    const root = arrToTree(arr);
    printTree(root);
}

export { printLinkedList, printTree, printHeap };
