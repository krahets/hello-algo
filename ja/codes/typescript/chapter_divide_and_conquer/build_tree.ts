/**
 * File: build_tree.ts
 * Created Time: 2023-07-30
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

import { printTree } from '../modules/PrintUtil';
import { TreeNode } from '../modules/TreeNode';

/* 二分木を構築：分割統治 */
function dfs(
    preorder: number[],
    inorderMap: Map<number, number>,
    i: number,
    l: number,
    r: number
): TreeNode | null {
    // 部分木区間が空なら終了する
    if (r - l < 0) return null;
    // ルートノードを初期化する
    const root: TreeNode = new TreeNode(preorder[i]);
    // m を求めて左右部分木を分割する
    const m = inorderMap.get(preorder[i]);
    // 部分問題：左部分木を構築する
    root.left = dfs(preorder, inorderMap, i + 1, l, m - 1);
    // 部分問題：右部分木を構築する
    root.right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r);
    // 根ノードを返す
    return root;
}

/* 二分木を構築 */
function buildTree(preorder: number[], inorder: number[]): TreeNode | null {
    // inorder の要素からインデックスへの対応を格納するハッシュテーブルを初期化する
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
console.log('前順走査 = ' + JSON.stringify(preorder));
console.log('中順走査 = ' + JSON.stringify(inorder));
const root = buildTree(preorder, inorder);
console.log('構築した二分木：');
printTree(root);
