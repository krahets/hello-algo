/**
 * File: preorder_traversal_iii_compact.js
 * Created Time: 2023-05-09
 * Author: Justin (xiefahit@gmail.com)
 */

const { arrToTree } = require('../modules/TreeNode');
const { printTree } = require('../modules/PrintUtil');

/* 前序走訪：例題三 */
function preOrder(root, path, res) {
    // 剪枝
    if (root === null || root.val === 3) {
        return;
    }
    // 嘗試
    path.push(root);
    if (root.val === 7) {
        // 記錄解
        res.push([...path]);
    }
    preOrder(root.left, path, res);
    preOrder(root.right, path, res);
    // 回退
    path.pop();
}

// Driver Code
const root = arrToTree([1, 7, 3, 4, 5, 6, 7]);
console.log('\n初始化二元樹');
printTree(root);

// 前序走訪
const path = [];
const res = [];
preOrder(root, path, res);

console.log('\n輸出所有根節點到節點 7 的路徑，路徑中不包含值為 3 的節點');
res.forEach((path) => {
    console.log(path.map((node) => node.val));
});
