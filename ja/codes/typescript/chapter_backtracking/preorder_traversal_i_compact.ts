/**
 * File: preorder_traversal_i_compact.ts
 * Created Time: 2023-05-09
 * Author: Justin (xiefahit@gmail.com)
 */

import { type TreeNode } from '../modules/TreeNode';
import { arrToTree } from '../modules/TreeNode';
import { printTree } from '../modules/PrintUtil';

/* 行きがけ順走査：例題 1 */
function preOrder(root: TreeNode | null, res: TreeNode[]): void {
    if (root === null) {
        return;
    }
    if (root.val === 7) {
        // 解を記録する
        res.push(root);
    }
    preOrder(root.left, res);
    preOrder(root.right, res);
}

// 実行用コード
const root = arrToTree([1, 7, 3, 4, 5, 6, 7]);
console.log('\n二分木を初期化する');
printTree(root);

// 行きがけ順走査
const res: TreeNode[] = [];
preOrder(root, res);

console.log('\n値が 7 であるすべてのノードを出力する');
console.log(res.map((node) => node.val));

export {};
