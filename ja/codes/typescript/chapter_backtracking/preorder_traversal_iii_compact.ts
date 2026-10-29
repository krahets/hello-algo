/**
 * File: preorder_traversal_iii_compact.ts
 * Created Time: 2023-05-09
 * Author: Justin (xiefahit@gmail.com)
 */

import { type TreeNode } from '../modules/TreeNode';
import { arrToTree } from '../modules/TreeNode';
import { printTree } from '../modules/PrintUtil';

/* 行きがけ順走査：例題 3 */
function preOrder(
    root: TreeNode | null,
    path: TreeNode[],
    res: TreeNode[][]
): void {
    // 枝刈り
    if (root === null || root.val === 3) {
        return;
    }
    // 試行
    path.push(root);
    if (root.val === 7) {
        // 解を記録する
        res.push([...path]);
    }
    preOrder(root.left, path, res);
    preOrder(root.right, path, res);
    // 復元
    path.pop();
}

// 実行用コード
const root = arrToTree([1, 7, 3, 4, 5, 6, 7]);
console.log('\n二分木を初期化する');
printTree(root);

// 行きがけ順走査
const path: TreeNode[] = [];
const res: TreeNode[][] = [];
preOrder(root, path, res);

console.log('\n値が 3 のノードを含まない、根ノードからノード 7 までのすべての経路を出力する');
res.forEach((path) => {
    console.log(path.map((node) => node.val));
});

export {};
