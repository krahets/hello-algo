/**
 * File: build_tree.ts
 * Created Time: 2023-07-30
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

import { printTree } from '../modules/PrintUtil';
import { TreeNode } from '../modules/TreeNode';

/* 构建二叉树：分治 */
function dfs(
    preorder: number[],
    inorderMap: Map<number, number>,
    i: number,
    l: number,
    r: number
): TreeNode | null {
    // 子树区间为空时终止
    if (r - l < 0) return null;
    // 初始化根节点
    const root: TreeNode = new TreeNode(preorder[i]);
    // 查询 m ，从而划分左右子树
    const m = inorderMap.get(preorder[i]);
    // 子问题：构建左子树
    root.left = dfs(preorder, inorderMap, i + 1, l, m - 1);
    // 子问题：构建右子树
    root.right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r);
    // 返回根节点
    return root;
}

/* 构建二叉树 */
function buildTree(preorder: number[], inorder: number[]): TreeNode | null {
    // 初始化哈希表，存储 inorder 元素到索引的映射
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
console.log('前序遍历 = ' + JSON.stringify(preorder));
console.log('中序遍历 = ' + JSON.stringify(inorder));
const root = buildTree(preorder, inorder);
console.log('构建的二叉树为：');
printTree(root);
