/**
 * File: build_tree.ts
 * Created Time: 2023-07-30
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

import { printTree } from '../modules/PrintUtil';
import { TreeNode } from '../modules/TreeNode';

/* 構建二元樹：分治 */
function dfs(
    preorder: number[],
    inorderMap: Map<number, number>,
    i: number,
    l: number,
    r: number
): TreeNode | null {
    // 子樹區間為空時終止
    if (r - l < 0) return null;
    // 初始化根節點
    const root: TreeNode = new TreeNode(preorder[i]);
    // 查詢 m ，從而劃分左右子樹
    const m = inorderMap.get(preorder[i]);
    // 子問題：構建左子樹
    root.left = dfs(preorder, inorderMap, i + 1, l, m - 1);
    // 子問題：構建右子樹
    root.right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r);
    // 返回根節點
    return root;
}

/* 構建二元樹 */
function buildTree(preorder: number[], inorder: number[]): TreeNode | null {
    // 初始化雜湊表，儲存 inorder 元素到索引的對映
    let inorderMap = new Map<number, number>();
    for (let i = 0; i < inorder.length; i++) {
        inorderMap.set(inorder[i], i);
    }
    const root = dfs(preorder, inorderMap, 0, 0, inorder.length - 1);
    return root;
}

/* Driver Code */
const preorder = [3, 9, 2, 1, 7];
const inorder = [9, 3, 1, 2, 7];
console.log('前序走訪 = ' + JSON.stringify(preorder));
console.log('中序走訪 = ' + JSON.stringify(inorder));
const root = buildTree(preorder, inorder);
console.log('構建的二元樹為：');
printTree(root);
