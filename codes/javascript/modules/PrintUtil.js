/**
 * File: PrintUtil.js
 * Created Time: 2022-12-04
 * Author: IsChristina (christinaxia77@foxmail.com)
 */

const { arrToTree } = require('./TreeNode');

/**
 * Print a linked list
 * @param head
 */
function printLinkedList(head) {
    let list = [];
    while (head !== null) {
        list.push(head.val.toString());
        head = head.next;
    }
    console.log(list.join(' -> '));
}

function Trunk(prev, str) {
    this.prev = prev;
    this.str = str;
}

/**
 * The interface of the tree printer
 * This tree printer is borrowed from TECHIE DELIGHT
 * https://www.techiedelight.com/c-program-print-binary-tree/
 * @param root
 */
function printTree(root) {
    printTree(root, null, false);
}

/**
 * Print a binary tree
 * @param root
 * @param prev
 * @param isLeft
 */
function printTree(root, prev, isLeft) {
    if (root === null) {
        return;
    }

    let prev_str = '    ';
    let trunk = new Trunk(prev, prev_str);

    printTree(root.right, trunk, true);

    if (!prev) {
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

    printTree(root.left, trunk, false);
}

/**
 * Helper function to print branches of the binary tree
 * @param p
 */
function showTrunks(p) {
    if (!p) {
        return;
    }

    showTrunks(p.prev);
    process.stdout.write(p.str);
}

/**
 * Print a heap
 * @param arr
 */
function printHeap(arr) {
    console.log('堆的数组表示：');
    console.log(arr);
    console.log('堆的树状表示：');
    printTree(arrToTree(arr));
}

module.exports = {
    printLinkedList,
    printTree,
    printHeap,
};
