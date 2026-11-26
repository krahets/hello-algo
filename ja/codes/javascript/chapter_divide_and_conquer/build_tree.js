/**
 * File: build_tree.js
 * Created Time: 2023-07-30
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

const { printTree } = require('../modules/PrintUtil');
const { TreeNode } = require('../modules/TreeNode');

/* 二分木の構築：分割統治法 */
function dfs(preorder, inorderMap, i, l, r) {
    // 部分木の区間が空なら終了する
    if (r - l < 0) return null;
    // 根ノードを初期化する
    const root = new TreeNode(preorder[i]);
    // m を調べて左右の部分木を分ける
    const m = inorderMap.get(preorder[i]);
    // 部分問題：左部分木を構築する
    root.left = dfs(preorder, inorderMap, i + 1, l, m - 1);
    // 部分問題：右部分木を構築する
    root.right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r);
    // 根ノードを返す
    return root;
}

/* 二分木の構築 */
function buildTree(preorder, inorder) {
    // ハッシュ表を初期化し、inorder の各要素に対応するインデックスを格納する
    let inorderMap = new Map();
    for (let i = 0; i < inorder.length; i++) {
        inorderMap.set(inorder[i], i);
    }
    const root = dfs(preorder, inorderMap, 0, 0, inorder.length - 1);
    return root;
}

/* 実行例 */
const preorder = [3, 9, 2, 1, 7];
const inorder = [9, 3, 1, 2, 7];
console.log('行きがけ順 = ' + JSON.stringify(preorder));
console.log('通りがけ順 = ' + JSON.stringify(inorder));
const root = buildTree(preorder, inorder);
console.log('構築した二分木：');
printTree(root);
