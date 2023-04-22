/**
 * File: PrintUtil.ts
 * Created Time: 2022-12-13
 * Author: Justin (xiefahit@gmail.com)
 */

import { ListNode } from './ListNode';
import { TreeNode, arrToTree } from './TreeNode';

/**
 * Print a linked list
 * @param head
 */
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
 * The interface of the tree printer
 * This tree printer is borrowed from TECHIE DELIGHT
 * https://www.techiedelight.com/c-program-print-binary-tree/
 * @param root
 */
function printTree(root: TreeNode | null) {
    printTreeHelper(root, null, false);
}

/**
 * Print a binary tree
 * @param root
 * @param prev
 * @param isLeft
 */
function printTreeHelper(
    root: TreeNode | null,
    prev: Trunk | null,
    isLeft: boolean
) {
    if (root === null) {
        return;
    }

    let prev_str = '    ';
    const trunk = new Trunk(prev, prev_str);

    printTreeHelper(root.right, trunk, true);

    if (prev === null) {
        trunk.str = '———';
    } else if (isLeft) {
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

/**
 * Helper function to print branches of the binary tree
 * @param p
 */
function showTrunks(p: Trunk | null) {
    if (p === null) {
        return;
    }

    showTrunks(p.prev);
    process.stdout.write(p.str);
    // ts-node to execute, we need to install type definitions for node
    // solve: npm i --save-dev @types/node
    // restart the vscode
}

/**
 * Print a heap
 * @param arr
 */
function printHeap(arr: number[]): void {
    console.log('堆的数组表示：');
    console.log(arr);
    console.log('堆的树状表示：');
    const root = arrToTree(arr);
    printTree(root);
}

export { printLinkedList, printTree, printHeap };
