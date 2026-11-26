/**
 * File: build_tree.js
 * Created Time: 2023-07-30
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

const { printTree } = require('../modules/PrintUtil');
const { TreeNode } = require('../modules/TreeNode');

/* 建構二元樹：分治法 */
function dfs(preorder, inorderMap, i, l, r) {
    // 子樹區間為空時終止
    if (r - l < 0) return null;
    // 初始化根節點
    const root = new TreeNode(preorder[i]);
    // 查出 m，據此劃分左右子樹
    const m = inorderMap.get(preorder[i]);
    // 子問題：建構左子樹
    root.left = dfs(preorder, inorderMap, i + 1, l, m - 1);
    // 子問題：建構右子樹
    root.right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r);
    // 回傳根節點
    return root;
}

/* 建構二元樹 */
function buildTree(preorder, inorder) {
    // 初始化雜湊表，記錄 inorder 中各元素對應的索引
    let inorderMap = new Map();
    for (let i = 0; i < inorder.length; i++) {
        inorderMap.set(inorder[i], i);
    }
    const root = dfs(preorder, inorderMap, 0, 0, inorder.length - 1);
    return root;
}

/* 主程式 */
const preorder = [3, 9, 2, 1, 7];
const inorder = [9, 3, 1, 2, 7];
console.log('前序走訪 = ' + JSON.stringify(preorder));
console.log('中序走訪 = ' + JSON.stringify(inorder));
const root = buildTree(preorder, inorder);
console.log('建構出的二元樹為：');
printTree(root);
