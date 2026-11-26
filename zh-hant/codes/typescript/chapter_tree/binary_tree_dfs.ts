/**
 * File: binary_tree_dfs.ts
 * Created Time: 2022-12-14
 * Author: Justin (xiefahit@gmail.com)
 */

import { type TreeNode } from '../modules/TreeNode';
import { arrToTree } from '../modules/TreeNode';
import { printTree } from '../modules/PrintUtil';

// 初始化串列以儲存走訪序列
const list: number[] = [];

/* 前序走訪 */
function preOrder(root: TreeNode | null): void {
    if (root === null) {
        return;
    }
    // 走訪順序：根節點 -> 左子樹 -> 右子樹
    list.push(root.val);
    preOrder(root.left);
    preOrder(root.right);
}

/* 中序走訪 */
function inOrder(root: TreeNode | null): void {
    if (root === null) {
        return;
    }
    // 走訪順序：左子樹 -> 根節點 -> 右子樹
    inOrder(root.left);
    list.push(root.val);
    inOrder(root.right);
}

/* 後序走訪 */
function postOrder(root: TreeNode | null): void {
    if (root === null) {
        return;
    }
    // 走訪順序：左子樹 -> 右子樹 -> 根節點
    postOrder(root.left);
    postOrder(root.right);
    list.push(root.val);
}

/* 主程式 */
/* 初始化二元樹 */
// 這裡使用能從陣列直接建立二元樹的函式
const root = arrToTree([1, 2, 3, 4, 5, 6, 7]);
console.log('\n初始化二元樹\n');
printTree(root);

/* 前序走訪 */
list.length = 0;
preOrder(root);
console.log('\n依前序走訪印出的節點序列 = ' + list);

/* 中序走訪 */
list.length = 0;
inOrder(root);
console.log('\n依中序走訪印出的節點序列 = ' + list);

/* 後序走訪 */
list.length = 0;
postOrder(root);
console.log('\n依後序走訪印出的節點序列 = ' + list);

export {};
