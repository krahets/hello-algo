/**
 * File: PrintUtil.js
 * Created Time: 2022-12-04
 * Author: IsChristina (christinaxia77@foxmail.com)
 */

const { arrToTree } = require('./TreeNode');

/* Print linked list */
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
 * Print binary tree
 * This tree printer is borrowed from TECHIE DELIGHT
 * https://www.techiedelight.com/c-program-print-binary-tree/
 */
function printTree(root) {
    printTree(root, null, false);
}

/* Print binary tree */
function printTree(root, prev, isRight) {
    if (root === null) {
        return;
    }

    let prev_str = '    ';
    let trunk = new Trunk(prev, prev_str);

    printTree(root.right, trunk, true);

    if (!prev) {
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

    printTree(root.left, trunk, false);
}

function showTrunks(p) {
    if (!p) {
        return;
    }

    showTrunks(p.prev);
    process.stdout.write(p.str);
}

/* Print heap */
function printHeap(arr) {
    console.log('Heap array representation:');
    console.log(arr);
    console.log('Heap tree representation:');
    printTree(arrToTree(arr));
}

module.exports = {
    printLinkedList,
    printTree,
    printHeap,
};
