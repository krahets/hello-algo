/**
 * File: preorder_traversal_ii_compact.js
 * Created Time: 2023-05-09
 * Author: Justin (xiefahit@gmail.com)
 */

const { arrToTree } = require('../modules/TreeNode');
const { printTree } = require('../modules/PrintUtil');

/* 前順走査：例題 2 */
function preOrder(root, path, res) {
    if (root === null) {
        return;
    }
    // 試す
    path.push(root);
    if (root.val === 7) {
        // 解を記録
        res.push([...path]);
    }
    preOrder(root.left, path, res);
    preOrder(root.right, path, res);
    // バックトラック
    path.pop();
}

// Driver Code
const root = arrToTree([1, 7, 3, 4, 5, 6, 7]);
console.log('\n二分木を初期化');
printTree(root);

// 先行順走査
const path = [];
const res = [];
preOrder(root, path, res);

console.log('\n根ノードからノード 7 までのすべての経路を出力');
res.forEach((path) => {
    console.log(path.map((node) => node.val));
});
