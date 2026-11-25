/**
 * File: binary_tree_bfs.js
 * Created Time: 2022-12-04
 * Author: IsChristina (christinaxia77@foxmail.com)
 */

const { arrToTree } = require('../modules/TreeNode');
const { printTree } = require('../modules/PrintUtil');

/* 層序走訪 */
function levelOrder(root) {
    // 初始化佇列並加入根節點
    const queue = [root];
    // 初始化一個串列，用來儲存走訪序列
    const list = [];
    while (queue.length) {
        let node = queue.shift(); // 從佇列前端取出節點
        list.push(node.val); // 儲存節點值
        if (node.left) queue.push(node.left); // 將左子節點加入佇列
        if (node.right) queue.push(node.right); // 將右子節點加入佇列
    }
    return list;
}

/* 主程式 */
/* 初始化二元樹 */
// 這裡使用能從陣列直接建立二元樹的函式
const root = arrToTree([1, 2, 3, 4, 5, 6, 7]);
console.log('\n初始化二元樹\n');
printTree(root);

/* 層序走訪 */
const list = levelOrder(root);
console.log('\n依層序走訪印出的節點序列 = ' + list);
