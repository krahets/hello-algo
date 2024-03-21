/**
 * File: binary_tree_bfs.js
 * Created Time: 2022-12-04
 * Author: IsChristina (christinaxia77@foxmail.com)
 */

const { arrToTree } = require('../modules/TreeNode');
const { printTree } = require('../modules/PrintUtil');

/* 層序走訪 */
function levelOrder(root) {
    // 初始化佇列，加入根節點
    const queue = [root];
    // 初始化一個串列，用於儲存走訪序列
    const list = [];
    while (queue.length) {
        let node = queue.shift(); // 隊列出隊
        list.push(node.val); // 儲存節點值
        if (node.left) queue.push(node.left); // 左子節點入列
        if (node.right) queue.push(node.right); // 右子節點入列
    }
    return list;
}

/* Driver Code */
/* 初始化二元樹 */
// 這裡藉助了一個從陣列直接生成二元樹的函式
const root = arrToTree([1, 2, 3, 4, 5, 6, 7]);
console.log('\n初始化二元樹\n');
printTree(root);

/* 層序走訪 */
const list = levelOrder(root);
console.log('\n層序走訪的節點列印序列 = ' + list);
