/**
 * File: PrintUtil.js
 * Created Time: 2022-12-04
 * Author: IsChristina (christinaxia77@foxmail.com)
 */

const { arrToTree } = require('./TreeNode');

/* 印出鏈結串列 */
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
 * 印出二元樹
 * 這段印出樹狀結構的程式碼取自 TECHIE DELIGHT
 * https://www.techiedelight.com/c-program-print-binary-tree/
 */
function printTree(root) {
    printTree(root, null, false);
}

/* 印出二元樹 */
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

/* 印出堆積 */
function printHeap(arr) {
    console.log('堆積的陣列表示法：');
    console.log(arr);
    console.log('堆積的樹狀表示法：');
    printTree(arrToTree(arr));
}

module.exports = {
    printLinkedList,
    printTree,
    printHeap,
};
