/**
 * File: PrintUtil.js
 * Created Time: 2022-12-04
 * Author: IsChristina (christinaxia77@foxmail.com)
 */

const { arrToTree } = require('./TreeNode');

/* 連結リストを表示する */
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
 * 二分木を表示する
 * この木の表示処理は TECHIE DELIGHT から借用した
 * https://www.techiedelight.com/c-program-print-binary-tree/
 */
function printTree(root) {
    printTree(root, null, false);
}

/* 二分木を表示する */
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

/* ヒープを表示する */
function printHeap(arr) {
    console.log('ヒープの配列表現：');
    console.log(arr);
    console.log('ヒープの木構造表現：');
    printTree(arrToTree(arr));
}

module.exports = {
    printLinkedList,
    printTree,
    printHeap,
};
