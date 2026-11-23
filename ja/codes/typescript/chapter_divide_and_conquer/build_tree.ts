/**
 * File: build_tree.ts
 * Created Time: 2023-07-30
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

import { printTree } from '../modules/PrintUtil';
import { TreeNode } from '../modules/TreeNode';

/* 二分木の構築：分割統治法 */
function dfs(
    preorder: number[],
    inorderMap: Map<number, number>,
    i: number,
    l: number,
    r: number
): TreeNode | null {
    // 部分木の区間が空の場合、終了する
    if (r - l < 0) return null;
    // 根ノードを初期化する
    const root: TreeNode = new TreeNode(preorder[i]);
    // m を調べ、左右の部分木に分割する
    const m = inorderMap.get(preorder[i]);
    // 部分問題：左部分木の構築
    root.left = dfs(preorder, inorderMap, i + 1, l, m - 1);
    // 部分問題：右部分木の構築
    root.right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r);
    // 根ノードを返す
    return root;
}

/* 二分木を構築する */
function buildTree(preorder: number[], inorder: number[]): TreeNode | null {
    // inorder の要素からインデックスへの対応を格納するハッシュテーブルを初期化する
    let inorderMap = new Map<number, number>();
    for (let i = 0; i < inorder.length; i++) {
        inorderMap.set(inorder[i], i);
    }
    const root = dfs(preorder, inorderMap, 0, 0, inorder.length - 1);
    return root;
}

/* 実行用コード */
const preorder = [3, 9, 2, 1, 7];
const inorder = [9, 3, 1, 2, 7];
console.log('行きがけ順走査 = ' + JSON.stringify(preorder));
console.log('通りがけ順走査 = ' + JSON.stringify(inorder));
const root = buildTree(preorder, inorder);
console.log('構築した二分木：');
printTree(root);
